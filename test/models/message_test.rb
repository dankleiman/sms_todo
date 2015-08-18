require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def test_command
    message = Message.new(MessageTesting.params)
    assert_equal 'help', message.command

    %w[done list new remove].each do |command|
      message = Message.new(MessageTesting.params(Body: "*#{command}*"))
      assert_equal command, message.command
    end
  end

  def test_message_body
    message = Message.new(MessageTesting.params)
    assert_nil message.message_body

    message = Message.new(MessageTesting.params(Body: '*list*'))
    assert message.message_body.blank?

    message = Message.new(MessageTesting.params(Body: '*new* item'))
    assert_equal ' item', message.message_body
  end
end
