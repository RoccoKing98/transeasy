# frozen_string_literal: true

require 'transeasy/config'
require 'transeasy/engine'
# The Transeasy module
module Transeasy
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
