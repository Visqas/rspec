require '../bases/helper_base'

class EventHelper < HelperBase
  def initialize(manager)
    super(manager)
  end

  def create_event_with(event)
    @driver.find_element(:id, 'event_name').clear
    @driver.find_element(:id, 'event_name').send_keys(event.title)
    @driver.find_element(:id, 'event_description').clear
    @driver.find_element(:id, 'event_description').send_keys(event.text)
    @driver.find_element(:css, '.button.success').click
  end

  def remove_last_event
    @driver.find_element(:css, 'div.medium-5.cloumns.columns > div:nth-child(5) > li:nth-child(2) > a').click
  end

  def edit_event(event)
    @driver.find_element(:css, 'div.medium-5.cloumns.columns > div:nth-child(5) > li:nth-child(1) > a').click
    create_event_with(event)
  end

  def create?
    element_present?(:xpath, '/html/body/div/div/div[1]/span[1]')
  end

  def deleted?
    !element_present?(:xpath, '/html/body/div/div/div[1]/span[1]')
  end

  def edited?
    element_present?(:xpath, '(//p[contains(text(),\'KEK\')])')
  end
end