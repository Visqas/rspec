require 'selenium-webdriver'
require 'rspec'
require '../helpers/spec_helper'
require '../helpers/auth_helper'
require '../helpers/navigation_helper'
require '../helpers/event_helper'
require 'json'
require 'pry'

class AppManager
  attr_accessor :driver, :navigation, :auth, :event, :json

  def initialize
    @json = JSON.parse(File.read('../settings.json'))
    @driver = Selenium::WebDriver.for :chrome
    @base_url = @json["url"]
    @accept_next_alert = true
    @driver.manage.window.maximize
    @driver.manage.timeouts.implicit_wait = 5
    @verification_errors = []

    @navigation = NavigationHelper.new(self, @base_url)
    @auth = AuthHelper.new(self)
    @event = EventHelper.new(self)
  end

  def quit
    @driver.quit
    #expect(@verification_errors) == []
  end
end