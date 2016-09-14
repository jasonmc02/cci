require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'the quantity of users' do
    assert_equal 2, User.count
  end
  # test 'fail' do
  #   assert_equal 0, User.count
  # end
end
