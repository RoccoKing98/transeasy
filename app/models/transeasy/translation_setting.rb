# frozen_string_literal: true

module Transeasy
  # The application settings
  class TranslationSetting < ApplicationRecord
    include ApplicationHelper

    validates :root_language, presence: true
    validates :target_languages, presence: true

    validate :check_translation_engine
    validate :target_languages_are_valid

    def check_translation_engine
      Transeasy.config.all_translation_engines.map { |e| e[:name] }.include?(translation_engine)
    end

    def target_languages_are_valid
      all_titles = Transeasy.config.all_languages.map { |l| l[:title] }
      to_array(target_languages).each do |l|
        all_titles.include?(l)
      end
    end

  end
end
