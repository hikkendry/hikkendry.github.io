# require 'slim'

activate :livereload
activate :directory_indexes

set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :images_dir, 'assets/images'

ready do
  sprockets.append_path File.join root, 'bower_components'
end

# Build-specific configuration
configure :build do

  # activate :minify_css
  # activate :minify_javascript
  activate :asset_hash

	# compass_config do |config|
	#   config.output_style = :compact
	# end

  # activate :relative_assets
  # set :relative_links, true

end

# Dynamically create project pages
data.projects.each do |project|
	proxy "/#{project[:title].parameterize}.html", "/project.html", :locals => { :title => project[:title], :content => project }, :ignore => true
end
