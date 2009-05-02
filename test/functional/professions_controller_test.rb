require 'test_helper'

class ProfessionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Profession.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Profession.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to professions_url
  end
  
  def test_edit
    get :edit, :id => Profession.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Profession.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Profession.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Profession.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Profession.first
    assert_redirected_to professions_url
  end
  
  def test_destroy
    profession = Profession.first
    delete :destroy, :id => profession
    assert_redirected_to professions_url
    assert !Profession.exists?(profession.id)
  end
end
