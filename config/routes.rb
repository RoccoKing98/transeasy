# frozen_string_literal: true

Transeasy::Engine.routes.draw do
  root 'translations#index'

  get '/setup', to: 'translations#setup'

  resource :translations do
    member do
      post :save_setup
    end
    collection do
      get :index
    end
  end
end
