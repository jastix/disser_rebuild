require 'test_helper'

class DisserPdfTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert DisserPdf.new.valid?
  end
end
