require 'test_helper'

class RemoveCommandTest < ActiveSupport::TestCase

  include CommandInterface

  def setup
    @command_class = RemoveCommand
  end

  def test_execute_invalid
    command = @command_class.new(MessageDouble.new)
    assert_match /Could not find/, command.execute
  end

  def test_execute_valid
    command = @command_class.new(MessageDouble.new(from: items(:bob_first).from, message_body: '1'))
    assert_difference 'Item.count', -1 do
      command.execute
    end
  end

  def test_response_invalid
    command = @command_class.new(MessageDouble.new)
    command.execute
    assert_match /Could not find/, command.response
  end

  def test_response_valid
    command = @command_class.new(MessageDouble.new(from: items(:bob_first).from, message_body: '1'))
    command.execute
    assert_match /removed/, command.response
  end
end
