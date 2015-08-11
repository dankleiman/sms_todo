class MessagesController < ApplicationController

  #GET messages/
  def index
    initialize_command(params)
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message @command.execute ? @command.response : 'Sorry something went wrong'
    end
    twiml.text
  end

  private

  # build a message and command from incoming params that can be executed to deliver the response
  def initialize_command(message)
    message = Message.new(params)
    @command = begin
      "#{message.command.capitalize}Command".constantize.new(message)
    rescue
      HelpCommand.new(message)
    end
  end

end
