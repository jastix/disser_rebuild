require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Theme.new.valid?
  end
end
