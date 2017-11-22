require '../bases/helper_base'

class NavigationHelper < HelperBase
  def initialize(manager, base_url)
    super(manager)
    @base_url = base_url
  end

  def open_home_page
    @driver.get(@base_url + '/')
  end

  def go_to_events_page
    @driver.find_element(:css, 'nav > div.top-bar-left > ul > div > div > h4 > a').click
  end

  def go_to_create_events_page
    @driver.find_element(:css, 'nav > div.top-bar-right > ul > div > li:nth-child(4) > a').click
  end
end