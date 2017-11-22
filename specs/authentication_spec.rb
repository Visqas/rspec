require '../helpers/spec_helper'
require '../app/event'
require '../helpers/auth_helper'

describe 'auth' do
  include Bases::TestBase
  it 'should login with valid data' do
    user = User.new('vi@g.com', '123456')
    @app.auth.login_with(user)
    @app.auth.logout
  end

  it 'should not login with invalid data' do
    user = User.new('vig@c.com', '123456')
    @app.auth.login_with(user)
    expect(@app.auth.logined?).to eq(false)
  end
end