require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  test "donation pertence a um user" do
    assert_equal users(:cha_de_alguem), donations(:one).user
  end
end
