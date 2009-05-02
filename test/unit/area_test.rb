require 'test_helper'

class AreaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Area.new.valid?
  end
end
