class Converter::ReportsController < Converter::BaseController


  def create
    Report.destroy_all
    @report = Report.new report_params
    if @report.save and XLSX::Main.new(@report).create_tasks
      flash[:success] = t 'flash.reports.succes.created'
      redirect_to converter_tasks_path
    else
      flash[:warning] = t 'flash.reports.fail.created'
      redirect_to converter_tasks_path
    end

  end


  private

  def report_params
    params[:report].permit(:name, :asset)
  end
end
