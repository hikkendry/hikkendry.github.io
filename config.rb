# Require any additional compass plugins here.
require "susy"
require "breakpoint"
require "scut"

# require 'slim'

activate :livereload
activate :directory_indexes

set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :images_dir, 'assets/images'
set :frontmatter_extensions, %w(.html .slim)


ready do
  sprockets.append_path File.join root, 'bower_components'
end

# Dynamically create project pages
data.projects.each do |project|
	proxy "/#{project[:title].parameterize}.html", "/project.html", :locals => { :content => project }, :ignore => true
end

# middleman-deploy config
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.remote = "origin"
  deploy.branch = "master"
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_javascript, :compressor => Uglifier.new( output: { comments: none } )
  activate :asset_hash

  activate :imageoptim do |options|
    # print out skipped images
    options.verbose = true

    # Setting these to true or nil will let options determine them (recommended)
    options.nice = true
    options.threads = true

    # Image extensions to attempt to compress
    options.image_extensions = %w(.png .jpg .gif .svg)

    # compressor worker options, individual optimisers can be disabled by passing
    # false instead of a hash
    options.pngcrush_options  = {:chunks => ['alla'], :fix => false, :brute => false}
    options.pngout_options    = false
    options.optipng_options   = {:level => 6, :interlace => false}
    options.advpng_options    = {:level => 4}
    options.jpegoptim_options = {:strip => ['all'], :max_quality => 100}
    options.jpegtran_options  = {:copy_chunks => false, :progressive => true, :jpegrescan => true}
    options.gifsicle_options  = {:interlace => false}
  end

  compass_config do |config|
    config.output_style = :compact
  end

  activate :relative_assets
  set :relative_links, true
end
