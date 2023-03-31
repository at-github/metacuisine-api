# frozen_string_literal: true

require 'test_helper'

class ComputationTest < ActiveSupport::TestCase
  test 'should not save computation without title' do
    computation = Computation.new
    assert_not computation.save, 'Saved computation without title'
  end

  test 'should not save computation with duplicate title' do
    computation_one = Computation.new({ title: 'title' })
    assert computation_one.save

    computation_two = Computation.new({ title: 'title' })
    assert_not computation_two.save, 'Saved computation with title already exist'

    computation_three = Computation.new({ title: 'Title' })
    assert_not computation_three.save, 'Saved computation with title already exist but different case'
  end

  test 'should save computation with just a title' do
    computation = Computation.new({ title: 'title' })
    assert computation.save, 'Saved computation with just title'
  end
end
