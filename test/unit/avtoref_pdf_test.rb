require 'test_helper'

class AvtorefPdfTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AvtorefPdf.new.valid?
  end
end
