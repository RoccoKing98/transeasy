# frozen_string_literal: true

# lib/transeasy/engine.rb
module Transeasy
  # The engine so that the application can be locally mounted
  class Engine < ::Rails::Engine
    isolate_namespace Transeasy
    # lib/transeasy/engine.rb

    # Add Bootstrap assets to the asset pipeline
    initializer 'transeasy.assets' do |app|
      # app.config.assets.paths << Rails.root.join('node_modules/bootstrap/dist/css')
      # app.config.assets.paths << Rails.root.join('node_modules/bootstrap/dist/js')

      app.config.assets.precompile << 'transeasy.css'
      # app.config.assets.precompile << /\.(?:png|jpg|jpeg|gif)$/
    end
  end
end
