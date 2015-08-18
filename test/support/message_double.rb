# A double for the Message class for testing
class MessageDouble

  attr_accessor :from, :message_body

  def initialize(args = {})
    self.from         = args.fetch(:from, '1800TESTME')
    self.message_body = args.fetch(:message_body, 'Fake body')
  end
end
