require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validação da presença do nome do pai" do
    user = User.new father_name: nil

    refute user.valid?
  end
end
