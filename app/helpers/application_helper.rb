# -*- coding: utf-8 -*-
module ApplicationHelper
  require 'pry'
  DICT = {name: "Имя",
          id: "Номер",
          asset: "Картинка",
          updated_at: "Последнее изменение",
          price: "Цена",
          marking: "Артикул",
          subcategory: "Подкатегория",
          subcategories: "Подкатегории",
          subcategory_id: "Подкатегория",
          model_id: "Модель",
          prototype: "Прототип",
          model: "Модель",
          models: "Модели",
          category: "Категория",
          option_types: "Характеристики",
          product: "Товар",
          products: "Товары",
          price: "Цена",
          marking: "Артикуль",
          description: "Описание",
          country: "Страна"
          }

  DICT_ROD = {
    model: "Модель",
    subcategory: "Подкатегорию",
    prototype: "Прототип",
    products: "Товары"
  }

    def create_my_path(obj)
      #return "/admin/categories/#{obj.id}"
      url_for([:admin, obj])
    end
    def column_creator(attributes,action_flag=nil)
    
      for attr in attributes
        dict = DICT
        ###  column "Haзвание", :name do |x| 
        ###     link_to x.name, admin_country_path(x)
        ###  end
        case attr
        when  :id, :name
          column dict[attr], attr, sortable: attr  do |obj|
            
            link_to obj[attr], create_my_path(obj)
          end
          
        when :asset
          column "Картинка", :asset do |obj|
            div :class => "thumb" do
              image_tag(obj.asset.url)
            end
          end
        else
          column dict[attr], attr do |obj|
            obj[attr]
          end
        end
      end
      if action_flag

        actions
      end
    end
end

