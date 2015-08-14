class Command

  def initialize(message)
    @message = message
  end

  # execute should be implemented on each subclass command
  def execute
    raise 'Not Implemented'
  end

  private

  def item_options
    {
      from: @message.from,
      description: @message.message_body
    }
  end
end
