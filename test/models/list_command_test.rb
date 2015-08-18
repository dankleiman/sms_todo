require 'test_helper'

class ListCommandTest < ActiveSupport::TestCase

  include CommandInterface

  def setup
    @command_class = ListCommand
  end

  def test_execute_type
    assert_kind_of ActiveRecord::Relation, @command_class.new(MessageDouble.new).execute
  end

  def test_execute_size
    assert_equal 3, @command_class.new(MessageDouble.new(from: items(:bob_first).from)).execute.size
    assert_equal 2, @command_class.new(MessageDouble.new(from: items(:joe_first).from)).execute.size
  end

  def test_response_invalid
    command = @command_class.new(MessageDouble.new)
    command.execute
    assert_match /Create a new item/, command.response
  end

  def test_response_valid
    command = @command_class.new(MessageDouble.new(from: items(:bob_first).from))
    command.execute
    assert_equal 3, command.response.scan(/[0-9]+:/).size

    command = @command_class.new(MessageDouble.new(from: items(:joe_first).from))
    command.execute
    assert_equal 2, command.response.scan(/[0-9]+:/).size
  end
end
