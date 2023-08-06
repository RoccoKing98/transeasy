module Transeasy
  # The translations
  class TranslationValue < ApplicationRecord
    belongs_to :translation_key, class_name: 'Transeasy::TranslationKey'
  end
end
