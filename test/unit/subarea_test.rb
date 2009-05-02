require 'test_helper'

class SubareaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Subarea.new.valid?
  end
end
