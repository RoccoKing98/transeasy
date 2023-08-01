# frozen_string_literal: true

Dir.glob("#{__dir__}/../../factories/*").each do |x|
  require_relative(x)
end

module Transeasy
end
