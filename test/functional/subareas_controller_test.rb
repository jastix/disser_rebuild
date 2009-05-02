require 'test_helper'

class SubareasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Subarea.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Subarea.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to subareas_url
  end
  
  def test_edit
    get :edit, :id => Subarea.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Subarea.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Subarea.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Subarea.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Subarea.first
    assert_redirected_to subareas_url
  end
  
  def test_destroy
    subarea = Subarea.first
    delete :destroy, :id => subarea
    assert_redirected_to subareas_url
    assert !Subarea.exists?(subarea.id)
  end
end
