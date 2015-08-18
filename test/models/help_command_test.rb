require 'test_helper'

class HelpCommandTest < ActiveSupport::TestCase

  include CommandInterface

  def setup
    @command_class = HelpCommand
  end

  def test_execute
    assert_kind_of Array, @command_class.new(MessageDouble.new).execute
  end

  def test_response
    command = @command_class.new(MessageDouble.new)
    command.execute
    assert_match /Available commands/, command.response
  end
end
