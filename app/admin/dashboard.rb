# -*- coding:utf-8 -*-
ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title:  proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do

        panel "Новые заказы" do
          table_for Order.order("created_at desc").limit(5) do
            column "Клиент",:name do |order|
              link_to order.user.name, admin_order_path(order)
            end
            column "Телефон", :phone
            column "Адрес" , :address
            column "Сумма заказа", :total
            column "Дата оформления заказа", :created_at
          end
          strong { link_to "Показать все заказы", admin_orders_path }
        end

      end
    end
  end
end
