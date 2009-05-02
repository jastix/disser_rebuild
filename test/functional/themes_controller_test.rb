require 'test_helper'

class ThemesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Theme.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Theme.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to themes_url
  end
  
  def test_edit
    get :edit, :id => Theme.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Theme.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Theme.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Theme.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Theme.first
    assert_redirected_to themes_url
  end
  
  def test_destroy
    theme = Theme.first
    delete :destroy, :id => theme
    assert_redirected_to themes_url
    assert !Theme.exists?(theme.id)
  end
end
