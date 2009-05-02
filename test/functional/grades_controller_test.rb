require 'test_helper'

class GradesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Grade.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Grade.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to grades_url
  end
  
  def test_edit
    get :edit, :id => Grade.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Grade.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Grade.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Grade.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Grade.first
    assert_redirected_to grades_url
  end
  
  def test_destroy
    grade = Grade.first
    delete :destroy, :id => grade
    assert_redirected_to grades_url
    assert !Grade.exists?(grade.id)
  end
end
