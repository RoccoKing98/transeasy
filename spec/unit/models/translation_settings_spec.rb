# frozen_string_literal: true

require 'spec_helper'

module Transeasy
  RSpec.describe TranslationSetting, type: :model do
    let(:translation_settings) { FactoryBot.create(:translation_setting) }

    it 'setup requires a root language' do
      translation_settings.root_language = nil
      translation_settings.valid?
      expect(translation_settings.errors[:root_language]).to be == ["can't be blank"]
    end

    it 'setup requires at least one target language' do
      translation_settings.target_languages = nil
      translation_settings.valid?
      expect(translation_settings.errors[:target_languages]).to be == ["can't be blank",
                                                                       'Invalid class NilClass for target languages']
    end

    it 'setup requires that the root language cannot be a target language' do
      translation_settings.target_languages = [translation_settings.root_language].to_json
      translation_settings.valid?
      expect(translation_settings.errors[:root_language]).to be == ['Root language cannot also be a target language']
    end
  end
end
