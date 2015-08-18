ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start('rails')

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/mock'

require 'support/command_interface'
require 'support/message_double'
require 'support/message_testing'

class ActiveSupport::TestCase
  fixtures :all
end
