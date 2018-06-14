class ViewGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model_name, type: :string
  argument :user_views, type: :array, required: false
  
  DEFAULT_VIEWS = ['index', 'new', 'show', 'edit']
  
  def generate_views

    if user_views.present?
      
      user_views.each do |view|
        create_file "app/views/#{model_name.downcase.pluralize}/#{view}.html.erb"
      end
      
    else
      
      DEFAULT_VIEWS.each do |view|
        create_file "app/views/#{model_name.downcase.pluralize}/#{view}.html.erb"
      end
      
    end
  end
end




















