# frozen_string_literal: true

module Transeasy
  # The key for each translation
  class TranslationFile < ApplicationRecord
    def self.rename_files(old_name, new_name)
      settings = TranslationSetting.first
      JSON.parse(settings.target_languages).each do |l|
        language_short = Transeasy.config.all_languages.find { |x| x[:title] == l }[:lang]

        raise 'Target language not found while renaming files!' unless language_short

        if File.exist?(Transeasy.full_file_name(old_name, language_short))
          File.rename(Transeasy.full_file_name(old_name, language_short),
                      Transeasy.full_file_name(new_name, language_short))
        end
      end
    end

    def create_files
      require 'yaml'
      settings = TranslationSetting.first
      JSON.parse(settings.target_languages).each do |l|
        language_short = Transeasy.config.all_languages.find { |x| x[:title] == l }[:lang]

        raise 'Target language not found while creating files!' unless language_short

        if File.exist?((full_name = full_file_name(language_short)))
          raise "File #{file_name} cannot be created because it already exists"
        end

        empty_file = { language_short.to_sym => { hello: 'world' } }.to_yaml
        File.write(full_name, empty_file)
      end
    end

    def delete_files
      settings = TranslationSetting.first
      JSON.parse(settings.target_languages).each do |l|
        language_short = Transeasy.config.all_languages.find { |x| x[:title] == l }[:lang]
        if File.exist?((full_name = full_file_name(language_short)))
          File.delete(full_name)
        end
      end
    end

    def all_translations
      []
    end

    private

    def full_file_name(language)
      TranslationFile.full_file_name(file_name, language)
    end

    def self.full_file_name(file_name, language)
      "#{Transeasy.config.locales_path}/#{file_name}_#{language}.yml"
    end
  end
end
