require 'test_helper'

class DoneCommandTest < ActiveSupport::TestCase

  include CommandInterface

  def setup
    @command_class = DoneCommand
  end

  def test_execute_calls
    mock = Minitest::Mock.new
    mock.expect(:from, nil)
    mock.expect(:message_body, '')

    command = @command_class.new(mock)
    command.execute

    mock.verify
  end

  def test_execute_valid
    item = items(:bob_second)
    command = @command_class.new(MessageDouble.new(from: item.from, message_body: '2'))
    command.execute

    item.reload
    assert_not item.completed_at.nil?
  end

  def test_response_invalid
    command = @command_class.new(MessageDouble.new)
    command.execute
    assert_match /Could not find/, command.response
  end

  def test_response_valid
    item = items(:bob_second)
    command = @command_class.new(MessageDouble.new(from: item.from, message_body: '2'))
    command.execute
    assert_match /marked as complete/, command.response
  end
end
