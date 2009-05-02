require 'test_helper'

class DisserDocsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => DisserDoc.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    DisserDoc.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    DisserDoc.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to disser_doc_url(assigns(:disser_doc))
  end
  
  def test_edit
    get :edit, :id => DisserDoc.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    DisserDoc.any_instance.stubs(:valid?).returns(false)
    put :update, :id => DisserDoc.first
    assert_template 'edit'
  end
  
  def test_update_valid
    DisserDoc.any_instance.stubs(:valid?).returns(true)
    put :update, :id => DisserDoc.first
    assert_redirected_to disser_doc_url(assigns(:disser_doc))
  end
  
  def test_destroy
    disser_doc = DisserDoc.first
    delete :destroy, :id => disser_doc
    assert_redirected_to disser_docs_url
    assert !DisserDoc.exists?(disser_doc.id)
  end
end
