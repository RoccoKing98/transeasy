# frozen_string_literal: true

module Transeasy
  # Empty application record for now
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
