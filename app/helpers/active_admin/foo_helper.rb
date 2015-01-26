# -*- coding: utf-8 -*-
module ActiveAdmin::FooHelper
  class ActiveAdmin::Views::Pages::Show
    def column_creator(attributes,action_flag=nil)
      logger.debug "Person attributes #{attributes}"
      
    
      for attr in attributes
        dict = ApplicationHelper::DICT
        ###  column "Haзвание", :name do |x| 
        ###     link_to x.name, admin_country_path(x)
        ###  end
        case attr
        when  :id, :name
          
          column dict[attr], attr, sortable: attr  do |obj|
            logger.debug "This is obj #{obj.to_s}"
            logger.debug "This is attr #{attr}"
            link_to obj[attr], create_my_path(obj)
          end
          
        when :asset
          column "Картинка", :asset do |obj|
            div :class => "thumb" do
              image_tag(obj.asset.url)
            end
          end
        else
          logger.debug "This is dict #{dict}"
          logger.debug "This is attr #{attr}"
          
          column dict[attr], attr do |obj|
            logger.debug "This is obj #{obj}"
            obj[attr]
          end
        end
      end
      if action_flag

        actions
      end
    end 
    def create_links_row(x, links_hash)
      unless links_hash.nil?
        
        links_hash.each do |key, value|
          if key.eql?(:prototype) and x.send(key)
          
          else
            row "Cоздать" do
              #link_to 'Новая коллекция', new_admin_subcategory_path(key => { value => x.id})
              link_to ApplicationHelper::DICT_ROD[key], url_for(controller: "admin/#{key.to_s.pluralize}", action: 'new', key => {value => x.id} )
            end
          end
        end
      end
    end
    def create_table_for_show(obj, table_hash)
      
      
      unless table_hash.nil?
        table_hash.each do |key, value|
          
             panel ApplicationHelper::DICT[key], id: "my-panel" do
              logger.debug "This is key #{key.to_s}"
              logger.debug "This is arrivva #{obj.send(key)}"
              logger.debug "This is arrivva #{value}"
              if obj.send(key) 
                
                table_for obj.send(key)  do
                  column_creator(value, action_flag=nil)
                end
             
              
              end
            end
            
        end
      end
    end

    def create_show(obj, attributes, d: {table_hash: nil, links_hash: nil})
      
      attributes_table do 
        attributes.each do |attr|
          case attr

          when :asset
            row ApplicationHelper::DICT[attr] do
              image_tag(obj.asset.url)
            end
          when :category, :subcategory
            if obj.send(attr)

              row ApplicationHelper::DICT[attr] do 
                puts "FFAAAAAAAAAAAAAAAAAAA", attr
                puts "AAAAAAAAAAAAAAAAAAAAAAAAAA", obj[:subcategory]
                link_to "SUBCATEGORY", url_for([:admin, obj.send(attr)])
              end
            end
          when :type
             row ApplicationHelper::DICT[attr] do 
              link_to obj.send(attr).name, url_for([:admin, obj.subcategory])
            end
          else
            row ApplicationHelper::DICT[attr] do 
              obj[attr]
            end
            
          end
        end
        #
        create_links_row(obj, d[:links_hash])
      end
      create_table_for_show(obj, d[:table_hash])
        
    end
  end
    
  class ActiveAdmin::Views::IndexAsTable
    include ApplicationHelper
  end

end
