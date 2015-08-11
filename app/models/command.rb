class Command
  attr_accessor :message, :response

  def initialize(message)
    @message = message
  end

  # execute should be implemented on each subclass command
  def execute
    raise 'Not Implemented'
  end

end
