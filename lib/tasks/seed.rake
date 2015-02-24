# -*- coding: utf-8 -*-
namespace :db do
  desc 'Fill database with type of wp'
  task populate: :environment do
    #make_types
    make_option_types
    make_countries
    make_vendors
    make_categories
    make_models
    make_prototypes
    make_admin
  end
  COUNTRY = %w(Рoccия Турция Чехия Германия Италия)

  OPT_TYPES = [['Мощность, кВт', 1],
               ['Hmax, м', 1],
               ['Qmax, м3/час', 1],
               ['Подсоединение', nil],
               ['Монтажная длина, мм', 1],
               ['Размеры', nil]

              ]

  CATEGORIES = %w(Трубы Haсосы)
  SUBCAT = [%w(Металлические Полипропиленовые Сшитые),
            %w(Циркуляционные Дренажные Фекальные)]
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
    AdminUser.create!(email: 'admin@example.com',
                      password: 'password')
  end

  def make_countries
    COUNTRY.each do |c|
      Country.create!(name: c)
    end
  end

  def make_vendors
    country = Country.all.map(&:id)
    8.times do |_v|
      Vendor.create!(name:  Faker::Company.name,
                     country_id: country.sample)
    end
  end

  def make_categories
    CATEGORIES.each_with_index do |cat, ind|
      c = Category.create!(
                           name: cat,
                           text: Faker::Lorem.paragraph(3, true, 4),
                           asset: File.open(File.join("app", ActionController::Base.helpers.asset_path("assets/images/category/#{ind}.jpg")))
                           )
      SUBCAT[ind].each do |subc|
        Subcategory.create!(name: subc, 
                            category: c,
                            text: Faker::Lorem.paragraph(3, true, 4))
      end
    end
  end

  def make_models
    subcat = Subcategory.all
    vendors = Vendor.all
    subcat.each do |s|
      3.times do
        s.models.create!(name: Faker::Address.state,
                         vendor: vendors.sample,
                         text: Faker::Lorem.paragraph(3, true, 4))
      end
    end
  end

  def make_prototypes
    subcat = Subcategory.all
    optypes = OptionType.all
    subcat.each do |s|
      p = Prototype.create!(name: Faker::Company.name,
                            subcategory: s)
      3.times do 
        p.ptypes.create!(option_type: optypes.sample)
      end
    end
  end

  def make_option_types
    OPT_TYPES.each do |opt|
      OptionType.create!(name: opt.first,
                         type: choose_type(opt.last))
    end
    # OptionType.create!(name: "Power", type: Type.first)
    # OptionType.create!(name: "Box", type: Type.last)
  end
end
