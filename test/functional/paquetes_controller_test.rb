require 'test_helper'

class PaquetesControllerTest < ActionController::TestCase
  setup do
    @paquete = paquetes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paquetes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paquete" do
    assert_difference('Paquete.count') do
      post :create, :paquete => @paquete.attributes
    end

    assert_redirected_to paquete_path(assigns(:paquete))
  end

  test "should show paquete" do
    get :show, :id => @paquete.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @paquete.to_param
    assert_response :success
  end

  test "should update paquete" do
    put :update, :id => @paquete.to_param, :paquete => @paquete.attributes
    assert_redirected_to paquete_path(assigns(:paquete))
  end

  test "should destroy paquete" do
    assert_difference('Paquete.count', -1) do
      delete :destroy, :id => @paquete.to_param
    end

    assert_redirected_to paquetes_path
  end
end
