require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "pagina do formulario de cadastro deve abrir" do
    get :new
    assert_response :success
  end

  test "deve salvar o usuario submetido" do
    assert_difference('User.count') do
      post :create, user: {
                            father_name: 'Fulano', 
                            mother_name: 'Joana',
                            child_name: 'Spock',
                            event_date: Time.now,
                            message: 'Mensagem do chá de bebe'
                          }

    end

    assert_redirected_to user_path(assigns(:user))
  end
end
