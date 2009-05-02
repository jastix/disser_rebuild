require 'test_helper'

class AreasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Area.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Area.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to areas_url
  end
  
  def test_edit
    get :edit, :id => Area.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Area.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Area.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Area.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Area.first
    assert_redirected_to areas_url
  end
  
  def test_destroy
    area = Area.first
    delete :destroy, :id => area
    assert_redirected_to areas_url
    assert !Area.exists?(area.id)
  end
end
