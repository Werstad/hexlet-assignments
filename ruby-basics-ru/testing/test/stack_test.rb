# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_empty
    stack = Stack.new
    assert { stack.empty? }
  end

  def test_push
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)

    assert { stack.size == 2 }
  end

  def test_pop
    stack = Stack.new
    stack.push!(1)

    assert { stack.pop! == 1 }
  end

  def test_clear
    stack = Stack.new
    stack.push!(1)
    stack.clear!

    assert { stack.empty? }
  end

  def test_to_array
    stack = Stack.new
    stack.push!(1)
    stack.push!(2)
    stack.push!(3)

    assert { stack.to_a == [1, 2, 3] }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
