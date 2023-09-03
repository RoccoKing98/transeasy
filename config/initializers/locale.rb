# frozen_string_literal: true

# Permitted locales available for the application
I18n.available_locales = Transeasy.config.all_languages.map { |l| l[:lang].to_sym }
