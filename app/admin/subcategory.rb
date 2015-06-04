# -*- coding: utf-8 -*-
ActiveAdmin.register Subcategory do
  permit_params :name, :category_id, :asset, :text,  models_attributes: [:id, :asset, :text, :percent, :subcategory_id, :name,:valuta_id, :vendor_id, :_destroy], prototype_attributes: [:id, :name, :subcategory_id,:_destroy, ptypes_attributes: [:id, :option_type_id,:prototype_id, :_destroy ]]

  index do
    column_creator([:id, :name, :asset, :updated_at], action_flag = true)
  end

  form(html: { multipart: true }) do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs t(:details) do
      f.input :category, label: 'Category', as: :select, collection: Category.all, include_blank: false
      f.input :name
      f.input :text
      f.input :asset
    end

    panel t(:prototype) do
      f.inputs for: [:prototype_attributes, f.object.prototype || Prototype.new], heading: "Ata" do |x|

      x.input :name
      x.input :id, wrapper_html: {class: 'hide_input'}

          x.has_many :ptypes,  allow_destroy: true, heading: t(:attributes) do |b|

            b.input :prototype_id, wrapper_html: {class: 'hide_input'}

            b.input :option_type, label: t('name_attr'), as: :select, collection: OptionType.all,  include_blank: false
        end
      end
end


    panel t('subcategory_model') do
      f.has_many :models, allow_destroy: true do |f|
        render partial: 'admin/models/model_form', locals: {f: f}
      end
    end

    f.actions
  end

  show do |x|
    create_show(x, [:id, :name, :text, :asset,  :category], d:
                { table_hash: { prototype: [:name], models: [:name] },
                  links_hash: { }

                })
    if subcategory.prototype.present?
      a  I18n.t(:create_model), class: 'button', href: new_admin_model_path(model: {  subcategory_id: subcategory.id })
    else
      div class: 'flashes' do
        div t(:need_prototype), class: 'flash flash_alert'
      end
    end
  end

  sidebar I18n.t('activerecord.models.prototype.one'), only: :show do |e|
    if subcategory.prototype.present?
      attributes_table_for subcategory do
        row t :name do |x|
          x.prototype.name
        end

        subcategory.prototype.option_types.each do |x|
          row t :attribute  do
            x.name
          end
        end
      end

    else
      link_to t('formtastic.create', model: t('activerecord.models.prototype.one')), 
              new_admin_prototype_path(prototype: {subcategory_id: subcategory.id}),
              class: 'button'
    end
  end

  sidebar I18n.t('activerecord.models.model.one'), only: :show do
    if subcategory.prototype.present?
      if subcategory.models.empty?
        link_to t('formtastic.create', model: t('activerecord.models.model.one')), 
              new_admin_model_path(model: {subcategory_id: subcategory.id}),
              class: 'button'

      else
         attributes_table_for subcategory do
          subcategory.models.each do |mod|
            row t(:name) do
              link_to mod.name, admin_model_path(mod)
            end
          end
        end

      end
    end
  end

end
