# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Disable fingerprinting till we're up on AWS S3
config.assets.digest = false

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
# Rails.application.config.assets.paths << "#{Rails.root}/app/assets/videos"

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
