# frozen_string_literal: true

module Transeasy
  # Controller for translations
  class TranslationsController < ApplicationController
    before_action :check_setup, except: %i[save_setup setup]

    def index
      @translation_files = TranslationFile.all

      return if ActiveRecord::Base.connection.data_source_exists?('transeasy_translation_settings')

      flash.alert = 'Has migration not yet been performed? Missing database'
    end

    def setup
      @settings = TranslationSetting.first_or_create
    end

    def save_setup
      @settings = TranslationSetting.first_or_create
      if params[:target_languages].blank?
        flash[:alert] = 'Changes not saved. At least one target language must be selected'
      elsif @settings.update(setup_params)
        flash[:notice] = @settings.previous_changes.any? ? 'Changes saved' : 'No changes made'
      else
        flash[:alert] = "Changes not saved. #{@settings.errors.full_messages.join(',')}"
      end
      render :setup
    end

    def check_setup
      @settings = TranslationSetting.first_or_create
      redirect_to :setup unless @settings.persisted?
    end

    def import_translation_file; end

    def edit_translation_file
      return if (@translation_file = TranslationFile.find_by(id: params['id']))

      @translation_file = TranslationFile.new
    end

    def create_translation_file
      file_name = params['translation_file']['file_name']

      if TranslationFile.find_by(file_name:)
        flash[:alert] = "File #{file_name} already exists"
      elsif (@translation_file = TranslationFile.create(create_translation_file_params))
        @translation_file.create_files
        flash[:notice] = "Translation File #{file_name} created"
      else
        flash[:alert] = "File #{file_name} could not be created.
            Errors : #{@translation_file.errors.full_messages.join(', ')}"
      end
      redirect_to :translations
    end

    def update_translation_file
      @translation_file = TranslationFile.find(params['translation_file']['id'])

      if @translation_file.update(create_translation_file_params)
        flash[:notice] = if @translation_file.previous_changes.any?
                           change = @translation_file.previous_changes['file_name']
                           TranslationFile.rename_files(change[0], change[1])
                           "Translation File #{params['file_name']} updated"
                         else
                           'No changes made'
                         end
      else
        flash[:alert] = "File #{params['file_name']} could not be updated.
            Errors : #{@translation_file.errors.full_messages.join(', ')}"
      end

      redirect_to :translations
    end

    def delete_translation_file
      translation_file = TranslationFile.find(params[:id])
      name = translation_file.file_name
      translation_file.delete_files
      if translation_file.destroy
        flash[:notice] = "File #{name} destroyed"
      else
        flash[:alert] =
          "File #{name} could not be destroyed. Errors : #{translation_file.errors.full_messages.join(', ')}"
      end

      redirect_to :translations
    end

    def edit_translations
      translation_file = TranslationFile.find(params[:id])

      render :edit_translations, locals: { translations: translation_file.all_translations }
    end

    def clear_database
      return unless Rails.env.test?

      TranslationSetting.destroy_all
      flash[:notice] = 'Databases cleared'

      redirect_to :setup
    end

    private

    def setup_params
      params.permit(:root_language, :translation_engine, :translation_engine_parameters, target_languages: [])
    end

    def create_translation_file_params
      params.require(:translation_file).permit(:file_name, :id)
    end
  end
end
