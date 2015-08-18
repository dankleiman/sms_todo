require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  def test_default
    get :index, MessageTesting.params

    assert_response :success
    assert_match /Available commands/, parsed_response
  end

  def test_list
    get :index, MessageTesting.params(Body: '*list*')

    assert_response :success
    assert_match /Create a new item/, parsed_response
  end

  def test_invalid
    get :index, MessageTesting.params(Body: '*fake*')

    assert_response :success
    assert_match /Available commands/, parsed_response
  end

  private

    def parsed_response
      Nokogiri::XML(response.body).at('Message').content
    end
end
