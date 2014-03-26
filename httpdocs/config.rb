# Require any additional compass plugins here.
require "susy"
require "scut"
	
compass_config do |config|
  config.output_style = :compact

end

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

  # activate :relative_assets
  # set :relative_links, true

end