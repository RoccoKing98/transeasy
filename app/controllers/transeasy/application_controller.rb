# frozen_string_literal: true

module Transeasy
  # Basic application controller
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  end
end
