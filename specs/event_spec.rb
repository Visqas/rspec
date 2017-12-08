require '../helpers/spec_helper'
require '../app/event'
require 'rspec/support'
require 'rspec/core'
require '../bases/bases'
require 'faker'

describe 'my-events' do
  include Bases::AuthBase
  name_event = Faker::Commerce.department
  description_event = Faker::Hobbit.quote
 
  it 'should create event' do
   (0..5).each do |i|
      @app.navigation.go_to_events_page
      @app.navigation.go_to_create_events_page
      event = Event.new(name_event, description_event)
      @app.event.create_event_with(event)
    end
  end

  it 'should edit last event' do
    @app.navigation.go_to_events_page
    
    event = Event.new(name_event, description_event)
    
    @app.event.edit_event(event)
  end

  it 'should delete event' do
    @app.navigation.go_to_events_page
    @app.event.remove_last_event
  end
end