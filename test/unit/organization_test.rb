require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Organization.new.valid?
  end
end
