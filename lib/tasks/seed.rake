# -*- coding: utf-8 -*-
namespace :db do
  desc "Fill database with type of wp"
  task populate: :environment do
   
    make_types
    make_option_types
    make_countries
    make_vendors
    make_categories
    make_models
    make_admin
    
    
  end
  COUNTRY = %w(Рoccия Турция Чехия Германия Италия)

  OPT_TYPES = [["Мощность, кВт", 1 ],
               ["Hmax, м", 1],
               ["Qmax, м3/час", 1],
               ["Подсоединение", nil],
               ["Монтажная длина, мм", 1],
               ["Размеры", nil],
                
              ]
    
  CATEGORIES = ["Трубы", "Haсосы"]
  SUBCAT = [["Металлические", "Полипропиленовые", "Сшитые"],
            ["Циркуляционные", "Дренажные", "Фекальные"]]
  def choose_type(x)
    x ? Type.first : Type.last
  end
  
  def make_types
    t = %w(INT STR)
    for c in t 
      Type.create!(name: c)
    end
  end
  
  def make_admin
    AdminUser.create!(email: "admin@example.com",
                      password: "password")
  end
  def make_countries
    COUNTRY.each do |c|
      Country.create!(name: c)
    end
  end

  def make_vendors
    country = Country.all.map(&:id)
    8.times do |v|
      Vendor.create!(name:  Faker::Company.name,
                     country_id: country.sample)
    end
  end
  def make_categories
    CATEGORIES.each_with_index do |cat, ind| 
      c = Category.create!(name: cat)
      SUBCAT[ind].each do |subc|
        Subcategory.create!(name: subc, category: c)
      end
    end
  end
  

  def make_models 
    subcat = Subcategory.all
    vendors = Vendor.all
    subcat.each do |s|
      3.times do 
        s.models.create!(name: Faker::Address.state,
                         vendor: vendors.sample)
      end
    end
  end
  def make_option_types
    OPT_TYPES.each do |opt|
      OptionType.create!(name: opt.first, 
                         type: choose_type(opt.last))
    end
    #OptionType.create!(name: "Power", type: Type.first)
    #OptionType.create!(name: "Box", type: Type.last)
  end
end
