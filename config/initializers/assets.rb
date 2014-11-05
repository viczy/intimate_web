# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

#css
Rails.application.config.assets.precompile += %w( fwtabs.css )
Rails.application.config.assets.precompile += %w( sumsung_grid.css )
Rails.application.config.assets.precompile += %w( timeline.css )



#js
Rails.application.config.assets.precompile += %w( cbpFWTabs.js )
Rails.application.config.assets.precompile += %w( sumsung_grid.js )