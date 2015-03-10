# -*- coding: utf-8 -*-
module ApplicationHelper
  DICT = { name: 'Имя',
           id: 'Номер',
           asset: 'Картинка',
           updated_at: 'Последнее изменение',
           price: 'Цена',
           marking: 'Артикул',
           subcategory: 'Подкатегория',
           subcategories: 'Подкатегории',
           subcategory_id: 'Подкатегория',
           model_id: 'Модель',
           prototype: 'Прототип',
           model: 'Модель',
           models: 'Модели',
           category: 'Категория',
           option_types: 'Характеристики',
           product: 'Товар',
           products: 'Товары',
           price: 'Цена',
           marking: 'Артикуль',
           description: 'Описание',
           country: 'Страна',
           vendor: 'Фирма',
           text: "Текст"
          }

  DICT_ROD = {
    model: 'Модель',
    subcategory: 'Подкатегорию',
    prototype: 'Прототип',
    products: 'Товары'
  }

  def arr_for_options(arr)
    arr.map do |item|
      [item.vendor.name, item.vendor.name]
    end.uniq
  end

  def create_my_path(obj)
    # return "/admin/categories/#{obj.id}"
    url_for([:admin, obj])
  end

  def column_creator(attributes, action_flag = nil)
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
       when :vendor, :country

         column dict[attr], attr do |obj|
           logger.debug "This is objUU #{obj}"
           logger.debug "This is attrUU #{attr}"
           puts "FFFF #{obj[attr]}"
           link_to obj.send(attr).name, url_for([:admin, obj.send(attr)])
         end
      when :asset
        column 'Картинка', :asset do |obj|
          div class: 'thumb' do
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
