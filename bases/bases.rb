require '../app/app_manager.rb'
require '../app/user'
require 'rspec/support'
require 'rspec/core'
require '../helpers/navigation_helper'
require '../helpers/event_helper'

module Bases
  module TestBase
    def self.included(base)
      base.before(:all) do
        @app = AppManager.new
      end

      base.before(:each) do
        # @app = AppManager.new
        @app.navigation.open_home_page
      end

      base.after(:all) do
        @app.quit
      end
    end
  end 
 
  module AuthBase
    def self.included(base)
      base.before(:all) do
        @app = AppManager.new
      end

      base.before(:each) do
        # @app = AppManager.new
        @app.navigation.open_home_page
        user = User.new(@app.json["email"], @app.json["password"])
        @app.auth.login_with(user)
      end

      base.after(:each) do
        @app.auth.logout
        # @app.quit
      end

      base.after(:all) do
        @app.quit
      end
    end
  end

end