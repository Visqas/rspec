require '../bases/helper_base'

class AuthHelper < HelperBase
  def initialize(manager)
    super(manager)
  end

  def login_with(user)
    if element_present?(:xpath, '(//a[contains(text(),\'sign in\')])')
      @driver.find_element(:id, 'user_email').clear
      @driver.find_element(:id, 'user_email').send_keys(user.email)
      @driver.find_element(:id, 'user_password').clear
      @driver.find_element(:id, 'user_password').send_keys(user.password)
      @driver.find_element(:css, '.button').click
    end
  end

  def logout
    @driver.find_element(:xpath, '(//a[contains(text(),\'exit\')])').click if element_present?(:xpath, '(//a[contains(text(),\'exit\')])')
  end 

  def logined?
    element_present?(:xpath, '(//a[contains(text(),\'exit\')])')
  end

  def sign_in
    @driver.find_element(:xpath, '/html/body/nav/div/div/div/nav/div[2]/ul/div/li[1]/a').click
  end
end