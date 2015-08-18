module MessageTesting
  def self.params(presets = {})
    {
      ToCountry: 'US',
      ToState: 'MA',
      SmsMessageSid: 'SMe40c71a5a09f1bad9ff702fce90b1d9d',
      NumMedia: 0,
      ToCity: 'ROXBURY',
      FromZip: 02110,
      SmsSid: 'SMe40c71a5a09f1bad9ff702fce90b1d9d',
      FromState: 'MA',
      SmsStatus: 'received',
      FromCity: 'BOSTON',
      Body: 'Hola',
      FromCountry: 'US',
      To: 8573992266,
      ToZip: 02111,
      NumSegments: 1,
      MessageSid: 'SMe40c71a5a09f1bad9ff702fce90b1d9d',
      AccountSid: 'AC428abc24c52ac55ff5cd98b68bd6a5e7',
      From: '1800TESTME',
      ApiVersion: '2010-04-01'
    }.merge(presets)
  end
end
