class ListCommand < Command
  attr_accessor :command_list
  # /messages?ToCountry=US&ToState=MA&SmsMessageSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&NumMedia=0&ToCity=ROXBURY&FromZip=1096&SmsSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&FromState=MA&SmsStatus=received&FromCity=BOSTON&Body=*list*&FromCountry=US&To=8573992266&ToZip=1097&NumSegments=1&MessageSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&AccountSid=AC428abc24c52ac55ff5cd98b68bd6a5e7&From=7814547642&ApiVersion=2010-04-01
  def execute
    @list = Item.where(from: @message.from).order(:created_at)
  end

  def response
    items = []
    @list.each_with_index do |item, index|
      list = "#{index + 1}: #{item.description}"
      if item.completed_at.present?
        list += ", (Completed: #{item.completed_at.to_date})"
      end
      items << list
    end
    items.join(', ')
  end

end
