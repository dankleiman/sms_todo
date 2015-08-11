class DoneCommand < Command
  attr_accessor :todo

  def execute
    # find item and mark as complete
    @todo =
    @todo.complete!
  end

  def response
    "#{@todo} marked as complete"
  end

end
