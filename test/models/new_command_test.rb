require 'test_helper'

class NewCommandTest < ActiveSupport::TestCase

  include CommandInterface

  def setup
    @command_class = NewCommand
  end

  def test_execute
    assert_difference 'Item.count', 1 do
      @command_class.new(MessageDouble.new).execute
    end
  end

  def test_response
    command = @command_class.new(MessageDouble.new)
    command.execute
    assert_match /Task added/, command.response
  end
end
