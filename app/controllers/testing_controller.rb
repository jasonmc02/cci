class TestingController < ApplicationController
  def justesting_method
    1...10.map { |n| puts n }
  end

  def just_testing_2
    puts "hola"
  end
end
