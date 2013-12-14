require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "pagina index" do
    get :index
    assert_response :success

    action_title("Bem vindo")
  end

  test "rota da pagina index" do
    assert_routing({ path: 'users', method: :get }, { controller: 'users', action: 'index' })
  end

  test "rota da pagina de cadastro do cha" do
    assert_routing({ path: 'users/new', method: :get }, { controller: 'users', action: 'new' })
  end

  test "pagina do formulario de cadastro deve abrir" do
    get :new
    assert_response :success

    action_title("Cadastre seu Chá de Bebê")

    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input", 6
      end
    end

    assert_select "form input" do
      assert_select "[name=?]", 'user[father_name]'
      assert_select "[name=?]", 'user[mother_name]'
      assert_select "[name=?]", 'user[child_name]'
      assert_select "[name=?]", 'user[event_date]'
      assert_select "[type=?]", 'submit'
    end
    
    assert_select "form textarea" do
      assert_select "[name=?]", 'user[message]'
    end
  end

  test "rota da pagina de criação do cha" do
    assert_routing({ path: 'users', method: :post }, { controller: 'users', action: 'create' })
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

  test "renderizar a view new quando falhar o formulario" do
    assert_no_difference('User.count') do
      post :create, user: {
                            father_name: ' ', 
                            mother_name: 'Joana',
                            child_name: 'Spock',
                            event_date: Time.now,
                            message: 'Mensagem do chá de bebe'
                          }
    end

    assert_template "new"
  end
    
  test "rota da pagina de exibição do cha" do
    assert_routing({ path: 'users/1', method: :get }, { controller: 'users', action: 'show', id: '1' })
  end

  test "deve exibir o chá de bebe" do
    #Fixtures users
    user = users(:cha_de_alguem)

    get :show, id: user.id
    assert_response :success

    action_title("Chá de bebe | " + user.child_name)

    assert_select '#father_name', user.father_name
    assert_select '#mother_name', user.mother_name
    assert_select '#child_name', user.child_name
    assert_select '#event_date', user.event_date.to_s
    assert_select '#message', user.message
  end
end
