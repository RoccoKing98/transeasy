# frozen_string_literal: true

module Transeasy
  # The application settings
  class TranslationSetting < ApplicationRecord
    include ApplicationHelper

    validates :root_language, presence: true
    validates :target_languages, presence: true

    validate :check_translation_engine
    validate :target_languages_are_valid
    validate :root_language_not_target_language

    def check_translation_engine
      Transeasy.config.all_translation_engines.map { |e| e[:name] }.include?(translation_engine)
    end

    # rubocop:disable Metrics/AbcSize
    def target_languages_are_valid
      unless target_languages.instance_of?(String)
        errors.add(:target_languages, "Invalid class #{target_languages.class.to_s} for target languages")
        return false
      end

      all_titles = Transeasy.config.all_languages.map { |l| l[:title] }
      JSON.parse(target_languages)&.each do |l|
        next if all_titles.include?(l)

        errors.add(:target_languages, "Invalid target language #{l}")
      end
    end
    # rubocop:enable Metrics/AbcSize

    def root_language_not_target_language
      return unless JSON.parse(target_languages)&.include?(root_language)

      errors.add(:root_language, 'Root language cannot also be a target language')
    end
  end
end
