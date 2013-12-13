require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "pagina do formulario de cadastro deve abrir" do
    get :new
    assert_response :success

    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input", 6
      end
    end

    #assert_select "form" do
    #  assert_select "[name=?]", /.+/
    #end

    assert_select "form input" do
      assert_select "[name=?]", 'user[father_name]'
      assert_select "[name=?]", 'user[mother_name]'
      assert_select "[name=?]", 'user[child_name]'
      assert_select "[name=?]", 'user[event_date]'
      assert_select "[name=?]", 'commit'
    end
    assert_select "form textarea" do
      assert_select "[name=?]", 'user[message]'
    end
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

  test "deve exibir o chá de bebe" do
    #Fixtures users
    user = users(:cha_de_alguem)

    get :show, id: user.id
    assert_response :success
    assert_select '#father_name', user.father_name
    assert_select '#mother_name', user.mother_name
    assert_select '#child_name', user.child_name
    assert_select '#event_date', user.event_date.to_s
    assert_select '#message', user.message
  end
end
