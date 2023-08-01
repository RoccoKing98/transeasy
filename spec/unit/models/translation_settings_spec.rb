# frozen_string_literal: true

require 'spec_helper'

module Transeasy
  RSpec.describe TranslationSetting, type: :model do

    let(:translation_settings) { FactoryBot.create(:translation_setting) }

    context 'validations' do
      it 'requires a root language' do
        translation_settings.root_language = nil
        translation_settings.valid?
        expect(translation_settings.errors[:root_language]).to be_present
      end

    end

  end
end
