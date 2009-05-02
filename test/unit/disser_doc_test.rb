require 'test_helper'

class DisserDocTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert DisserDoc.new.valid?
  end
end
