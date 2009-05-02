require 'test_helper'

class AvtorefPdfsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => AvtorefPdf.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    AvtorefPdf.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    AvtorefPdf.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to avtoref_pdf_url(assigns(:avtoref_pdf))
  end
  
  def test_edit
    get :edit, :id => AvtorefPdf.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    AvtorefPdf.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AvtorefPdf.first
    assert_template 'edit'
  end
  
  def test_update_valid
    AvtorefPdf.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AvtorefPdf.first
    assert_redirected_to avtoref_pdf_url(assigns(:avtoref_pdf))
  end
  
  def test_destroy
    avtoref_pdf = AvtorefPdf.first
    delete :destroy, :id => avtoref_pdf
    assert_redirected_to avtoref_pdfs_url
    assert !AvtorefPdf.exists?(avtoref_pdf.id)
  end
end
