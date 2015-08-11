class ListCommand < Command
  attr_accessor :command_list

  def execute
    # @command_list = # pull something from the db
  end

  def response
    # format @command_list for display
  end

end
