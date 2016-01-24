module XLSX
  class Main
    def initialize(report)
      @filename = report.filename
      @report = report
    end

    def create_tasks
      begin
        @workbook = RubyXL::Parser.parse(@file)[0]
        Task.transaction do

          @workbook.each do |row|
            @report.tasks.create!(
              content: row.cells[1].value
          )
          end
          report.update_attribute(:current_id, @report.tasks.last.id)

        end
      rescue => e
        nil
      end

    end
  end
end
