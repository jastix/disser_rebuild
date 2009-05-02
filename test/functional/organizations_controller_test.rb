require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Organization.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Organization.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to organizations_url
  end
  
  def test_edit
    get :edit, :id => Organization.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Organization.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Organization.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Organization.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Organization.first
    assert_redirected_to organizations_url
  end
  
  def test_destroy
    organization = Organization.first
    delete :destroy, :id => organization
    assert_redirected_to organizations_url
    assert !Organization.exists?(organization.id)
  end
end
