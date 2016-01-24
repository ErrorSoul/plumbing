module XLSX
  class Main
    def initialize(report)
      @filename = report.filename
      @report = report
    end

    def create_tasks
      begin
        @workbook = RubyXL::Parser.parse(@filename)[0]
        Task.transaction do

          @workbook.each do |row|
            @report.tasks.create!(
              content: row[1].value
            )
          end
          @report.update_attribute(:current_id, @report.tasks.first.id)

        end
      rescue => e
        puts e
        nil
      end

    end
  end
end
