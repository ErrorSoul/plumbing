class Converter::ReportsController < Converter::BaseController


  def create
    @report = Report.new report_params
    if @report.save and XLSX::Main.new(@report).create_tasks
      flash[:success] = t 'flash.reports.succes.created'
      redirect_to converter_dashboard_path
    else
      flash[:success] = t 'flash.reports.fail.created'
      redirect_to converter_dashboard_path
    end

  end


  private

  def report_params
    params[:report].permit(:name, :asset)
  end
end
