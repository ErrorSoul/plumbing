namespace :db do
  desc "Fill database with type of wp"
  task populate: :environment do
    
    
    make_types 
    
    
  end

  def make_types
    t = %w(INT STR)
    for c in t 
      Type.create!(name: c)
    end
  end
end
