# frozen_string_literal: true

require 'transeasy/config'
require 'transeasy/engine'
# The Transeasy module
module Transeasy
  class Config
    attr :locales_path
    def self.locales_path=(path = 'config/locales')
      @@locales_path = path
    end

    def self.locales_path
      @@locales_path
    end

  end

  def self.config(&block)
    c = Transeasy::Config

    if block_given?
      block.call(c)
    else
      c
    end
  end



  def self.hi
    puts 'Hello Transeasy!'
  end
end
