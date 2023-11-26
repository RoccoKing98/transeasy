# frozen_string_literal: true

Transeasy::Engine.routes.draw do
  root 'translations#index'

  get '/setup', to: 'translations#setup'

  resource :translations do
    member do
      post :save_setup
      get :clear_database if Rails.env.test?
      get :import_translation_file
      get :edit_translation_file
      post :create_translation_file
      patch :update_translation_file
      patch :delete_translation_file
      get :edit_translations
      post :add_translation
    end
    collection do
      get :index
    end
  end
end
