class HelperBase
  def initialize(manager)
    @manager = manager
    @driver = manager.driver
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
end