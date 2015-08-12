class DoneCommand < Command

  # /messages?ToCountry=US&ToState=MA&SmsMessageSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&NumMedia=0&ToCity=ROXBURY&FromZip=1096&SmsSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&FromState=MA&SmsStatus=received&FromCity=BOSTON&Body=*done*2&FromCountry=US&To=8573992266&ToZip=1097&NumSegments=1&MessageSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&AccountSid=AC428abc24c52ac55ff5cd98b68bd6a5e7&From=7814547642&ApiVersion=2010-04-01
  def execute
    list = Item.where(from: @message.from).order(:created_at).to_a
    list_index = @message.message_body.strip
    if list_index.to_i.to_s == list_index
      @item = list[list_index.to_i - 1]
      @item.update_attributes(completed_at: Time.now)
    else
      false
    end
  end

  def response
    "'#{@item.description}' marked as complete"
  end

end
