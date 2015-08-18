require 'test_helper'

class CommandTest < ActiveSupport::TestCase

  include CommandInterface

  def setup
    @command_class = Command
  end

  def test_execute
    assert_raises RuntimeError do
      @command_class.new(MessageDouble.new).execute
    end
  end
end
