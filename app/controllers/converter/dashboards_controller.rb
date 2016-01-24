class Converter::DashboardsController < Converter::BaseController

  def show
    @report = Report.new
  end
end
