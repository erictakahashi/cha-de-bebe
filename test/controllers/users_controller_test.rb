require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "pagina do formulario de cadastro deve abrir" do
    get :new
    assert_response :success
  end
end
