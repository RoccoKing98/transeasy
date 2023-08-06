module Transeasy
  # The key for each translation
  class TranslationKey < ApplicationRecord
    has_many :translation_values, class_name: 'Transeasy::TranslationValue', dependent: :destroy

    validates :key, presence: true, uniqueness: { case_sensitive: false }
  end
end
