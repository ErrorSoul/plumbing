namespace :db do
  desc "Fill database with type of wp"
  task populate: :environment do
    
    
    make_types
    make_option_types
    
    
  end

  def make_types
    t = %w(INT STR)
    for c in t 
      Type.create!(name: c)
    end
  end

  def make_option_types
    OptionType.create!(name: "Power", type: Type.first)
    OptionType.create!(name: "Box", type: Type.last)
  end
end
