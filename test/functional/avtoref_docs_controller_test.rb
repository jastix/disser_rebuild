require 'test_helper'

class AvtorefDocsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => AvtorefDoc.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    AvtorefDoc.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    AvtorefDoc.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to avtoref_doc_url(assigns(:avtoref_doc))
  end
  
  def test_edit
    get :edit, :id => AvtorefDoc.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    AvtorefDoc.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AvtorefDoc.first
    assert_template 'edit'
  end
  
  def test_update_valid
    AvtorefDoc.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AvtorefDoc.first
    assert_redirected_to avtoref_doc_url(assigns(:avtoref_doc))
  end
  
  def test_destroy
    avtoref_doc = AvtorefDoc.first
    delete :destroy, :id => avtoref_doc
    assert_redirected_to avtoref_docs_url
    assert !AvtorefDoc.exists?(avtoref_doc.id)
  end
end
