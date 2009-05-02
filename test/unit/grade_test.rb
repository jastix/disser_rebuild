require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Grade.new.valid?
  end
end
