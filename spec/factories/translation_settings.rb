# frozen_string_literal: true

FactoryBot.define do
  factory :translation_setting, class: 'Transeasy::TranslationSetting' do
    root_language { 'English' }
    target_languages { %w[French German] }
  end
end
