require 'test_helper'

class AvtorefDocTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AvtorefDoc.new.valid?
  end
end
