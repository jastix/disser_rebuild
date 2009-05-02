require 'test_helper'

class DisserPdfsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => DisserPdf.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    DisserPdf.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    DisserPdf.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to disser_pdf_url(assigns(:disser_pdf))
  end
  
  def test_edit
    get :edit, :id => DisserPdf.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    DisserPdf.any_instance.stubs(:valid?).returns(false)
    put :update, :id => DisserPdf.first
    assert_template 'edit'
  end
  
  def test_update_valid
    DisserPdf.any_instance.stubs(:valid?).returns(true)
    put :update, :id => DisserPdf.first
    assert_redirected_to disser_pdf_url(assigns(:disser_pdf))
  end
  
  def test_destroy
    disser_pdf = DisserPdf.first
    delete :destroy, :id => disser_pdf
    assert_redirected_to disser_pdfs_url
    assert !DisserPdf.exists?(disser_pdf.id)
  end
end
