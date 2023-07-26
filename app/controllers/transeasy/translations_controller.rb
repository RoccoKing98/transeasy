# frozen_string_literal: true

module Transeasy
  # Controller for translations
  class TranslationsController < ApplicationController
    before_action :check_setup, except: [:setup, :save_setup]

    def index
      unless ActiveRecord::Base.connection.data_source_exists? 'transeasy_translation_settings'
        flash.alert = "Has migration not yet been performed? Missing database"
      end
    end

    def save_setup
      render :setup
    end

    def check_setup
      @settings = TranslationSetting.first_or_create
      redirect_to :setup unless @settings.persisted?
    end

    def setup_params
      params.permit(:root_locale)
    end
  end
end
