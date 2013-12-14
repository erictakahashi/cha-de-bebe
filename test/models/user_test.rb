require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "validação da presença do nome do pai" do
    user = User.new father_name: '    '

    refute user.valid?

    #Verifica a lista de erros
    # assert_includes user.errors.messages, :father_name
    assert_includes user.errors[:father_name], I18n.t('activerecord.errors.messages.blank')
  end

  test "validação da presença do nome da mãe" do
    user = User.new mother_name: nil

    refute user.valid?

    #assert_includes user.errors.messages, :mother_name
    assert_includes user.errors[:mother_name], I18n.t('activerecord.errors.messages.blank')
  end

  test "usuario tem donation" do
    assert_equal [donations(:one), donations(:two)].sort, users(:cha_de_alguem).donations.sort
  end
end
