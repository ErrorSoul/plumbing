class Converter::TasksController < Converter::BaseController

  def index
    @tasks = Task.all
  end
end
