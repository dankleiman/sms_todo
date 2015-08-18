module CommandInterface

  # assert the command responds to execute
  def test_responds_to_execute
    assert_respond_to @command_class.new(MessageDouble.new), :execute
  end
end
