require 'minitest/autorun'
require './lcdTest.rb'

class LcdTest < Minitest::Test

  def setup
    input1 = '2,4534 khsd,23153 8,243 9,25 0,0'
    @print1 = LcdPrinter.new(input1)
    input2 = '2,4534 5,23153 8,243 9,25'
    @print2 = LcdPrinter.new(input2)
    input3 = '2,4534 34,23153 8,243 9,25 0,0'
    @print3 = LcdPrinter.new(input3)
    input4 = '2,4534 -5,23153 8,243 9,25 0,0'
    @print4 = LcdPrinter.new(input4)
    input5 = '2,4534 0,975 8,243 9,25 0,0'
    @print5 = LcdPrinter.new(input5)
    input6 = '2,4534 0,0 8,243 9,25 0,0'
    @print6 = LcdPrinter.new(input6)
    input7 = '2,4534 4,23153,8 8,243 9,25 0,0'
    @print7 = LcdPrinter.new(input7)
    input8 = '2,4534 4,23153 8,243 9,25 0,0'
    @print8 = LcdPrinter.new(input8)
  end

  def test_user_input_contain_letters
    assert_equal 'Only numbers are accepted', @print1.displayNumber
  end

  def test_user_input_with_no_end_statement
    assert_equal 'You must write 0,0 in your input to end the application', @print2.displayNumber
  end

  def test_user_input_has_size_greater_than_10
    assert_equal 'Size must be a number between 1 and 10', @print3.displayNumber
  end

  def test_user_input_has_size_less_than_0
    assert_equal 'Size must be a number between 1 and 10', @print4.displayNumber
  end

  def test_user_input_has_size_equal_to_0_before_end
    assert_equal 'Size must be greater than 0', @print5.displayNumber
  end

  def test_user_input_has_set_of_numbers_after_end_statement
    assert_equal 'Size must be greater than 0', @print6.displayNumber
  end

  def test_user_input_with_incorrect_pattern
    assert_equal 'Your input must be composed by pairs of numbers separated by a white space, like: 2,345 3,1994 0,0', @print7.displayNumber
  end

  def test_numbers_sucsessfully_displayed_message
    assert_equal 'Number(s) sucsessfully displayed', @print8.displayNumber
  end

  def test_users_cannot_access_configutarion_variables
    assert_raises "User cant access configuration variable regions" do
      LcdPrinter.regions
    end
    assert_raises "User cant access configuration variable digit_information" do
      LcdPrinter.digit_information
    end
    assert_raises "User cant access configuration variable digit_space" do
      LcdPrinter.digit_space
    end
  end

  def test_users_cannot_access_configutarion_methods
    assert_raises "User cant access configuration method set_regions" do
      @print8.set_regions
    end
    assert_raises "User cant access configuration method validate_input" do
      @print8.validate_input
    end
    assert_raises "User cant access configuration method print_horizontal_region" do
      @print8.print_horizontal_region
    end
    assert_raises "User cant access configuration method print_vertical_region" do
      @print8.print_vertical_region
    end
    assert_raises "User cant access configuration method add_horizontal_segment" do
      @print8.add_horizontal_segment
    end
    assert_raises "User cant access configuration method add_vertical_segment" do
      @print8.add_vertical_segment
    end
  end
end
