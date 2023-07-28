# frozen_string_literal: true

module Transeasy
  # Empty application helper for now...
  module ApplicationHelper
    def to_array(json_array)
      json_array.is_a?(String) ? json_array.tr('\"[]', '').split(',').map(&:strip) : nil
    end
  end
end
