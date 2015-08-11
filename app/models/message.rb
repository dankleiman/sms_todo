# sample incoming message params:
# params = { ToCountry: 'US', ToState: 'MA', SmsMessageSid: 'SMe40c71a5a09f1bad9ff702fce90b1d9d', NumMedia: 0, ToCity: 'ROXBURY', FromZip: 02110, SmsSid: 'SMe40c71a5a09f1bad9ff702fce90b1d9d', FromState: 'MA', SmsStatus: 'received', FromCity: 'BOSTON', Body: 'Hola', FromCountry: 'US', To: 8573992266, ToZip: 02111, NumSegments: 1, MessageSid: 'SMe40c71a5a09f1bad9ff702fce90b1d9d', AccountSid: 'AC428abc24c52ac55ff5cd98b68bd6a5e7', From: 7814547642, ApiVersion: '2010-04-01' }

# sample query params
# /messages?ToCountry=US&ToState=MA&SmsMessageSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&NumMedia=0&ToCity=ROXBURY&FromZip=1096&SmsSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&FromState=MA&SmsStatus=received&FromCity=BOSTON&Body=*new*write_something&FromCountry=US&To=8573992266&ToZip=1097&NumSegments=1&MessageSid=SMe40c71a5a09f1bad9ff702fce90b1d9d&AccountSid=AC428abc24c52ac55ff5cd98b68bd6a5e7&From=7814547642&ApiVersion=2010-04-01
class Message

  attr_accessor :command, :message_body

  MESSAGE_KEYS = [:ToCountry, :ToState, :SmsMessageSid, :NumMedia, :ToCity, :FromZip, :SmsSid, :FromState, :SmsStatus, :FromCity, :Body, :FromCountry, :To, :ToZip, :NumSegments, :MessageSid, :AccountSid, :From, :ApiVersion]
  # set incoming params as attributes on message, per the whitelisted MESSAGE_KEYS
  # parse the message for a command, body combination where the command is *something*
  def initialize(options)
    MESSAGE_KEYS.each do |key|
      attribute = key.to_s.gsub(/([A-Z][a-z]*)/, '\1_').downcase[0..-2]
      if options[key]
        self.class.send(:attr_accessor, attribute)
        instance_variable_set("@#{attribute}", options[key])
      end
    end

    if match_data = @body.match(/\A\*(.*)\*(.*)/)
      self.command = match_data[1]
      self.message_body = match_data[2]
    else
      self.command = 'help'
    end
  end
end
