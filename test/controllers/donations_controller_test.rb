require 'test_helper'

class DonationsControllerTest < ActionController::TestCase
  test "verificação de rota a criação de uma doação" do
    assert_routing({ path: 'donations/new', method: :get }, { controller: 'donations', action: 'new' })
  end

  test "pagina do formulario de cadastro deve abrir" do
    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input", 3
      end
    end

    assert_select "form input" do
      assert_select "[name=?]", 'donation[email]'
      assert_select "[name=?]", 'donation[value]'
      assert_select "[type=?]", 'submit'
    end
  end
end
