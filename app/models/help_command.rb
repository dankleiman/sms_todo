class HelpCommand < Command

  def execute
    @command_list = [
      '*list* to retreive a list of todos',
      '*new* followed by text to add an item to your todo list',
      '*done* followed by the item number on your list to mark it as complete',
      '*remove* followed by a number to remove an item from your todo list',
      '*help* to retrieve a list of available commands'
    ]
  end

  def response
    "Available commands: #{@command_list.join(', ')}"
  end

end
