class RemoveCommand < Command
  attr_accessor :todo

  def execute
    # find item and remove
    @todo =
    @todo.remove!
  end

  def response
    "#{@todo} removed"
  end

end
