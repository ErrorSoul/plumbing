# -*- coding:utf-8 -*-
ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title:  proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do

        panel I18n.t(:new_orders) do
          table_for Order.order("created_at desc").limit(5) do
            column I18n.t(:clients),:name do |order|
              link_to order.user.name, admin_order_path(order)
            end
            column I18n.t(:phone), :phone
            column  I18n.t(:address), :address
            column I18n.t(:total), :total
            column I18n.t(:created_at_order), :created_at
          end
          strong { link_to I18n.t(:show_orders), admin_orders_path }
        end

      end
    end
  end
end
