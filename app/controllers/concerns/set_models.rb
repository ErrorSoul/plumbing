module SetModels
  extend ActiveSupport::Concern
  
  private

  def set_need_attr
    @categories ||= Category.includes(:subcategories).all
  end
end
