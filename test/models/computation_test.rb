# frozen_string_literal: true

require 'test_helper'

class ComputationTest < ActiveSupport::TestCase
  test 'should not save computation without title' do
    computation = Computation.new
    assert_not computation.save, 'Saved computation without title'
  end
end
