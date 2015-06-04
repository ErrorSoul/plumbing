crumb :root  do
  link t(:home), root_path
end

crumb :category do |category|
  link category.name, category_path(category)
  parent :root
end

crumb :categories do
  link "Categories", categories_path
  parent :root
end

crumb :subcategory do |subcategory|
  link subcategory.name, subcategory_path(subcategory)
  parent :category, subcategory.category
end

crumb :model do |model|
  link model.name, model_path(model)
  parent :subcategory, model.subcategory
end

crumb :cart do
  link t(:shopping_cart), root_path
  parent :root
end

crumb :enter do
  link t(:enter), new_user_session_path
  parent :root
end

crumb :signup do
  link t(:sign_up), new_user_registration_path
  parent :root
end

crumb :profile do
  link t(:profile), user_root_path
  parent :root
end

crumb :contact do
  link t(:contacts), '#'
  parent :root
end

crumb :delivery do
  link t(:delivery), '#'
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
