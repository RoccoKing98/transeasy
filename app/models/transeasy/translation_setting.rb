module Transeasy

  class TranslationSetting < ApplicationRecord
    validates :root_locale, presence: true
    validates :target_locales, presence: true
  end
end