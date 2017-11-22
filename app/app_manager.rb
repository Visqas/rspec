require 'selenium-webdriver'
require 'rspec'
require '../helpers/spec_helper'
require '../helpers/auth_helper'
require '../helpers/navigation_helper'
require '../helpers/event_helper'

class AppManager
  attr_accessor :driver, :navigation, :auth, :event

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'https://fs-intern-calendar.herokuapp.com'
    @accept_next_alert = true
    @driver.manage.window.maximize
    @driver.manage.timeouts.implicit_wait = 30
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