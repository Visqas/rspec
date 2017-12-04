require '../helpers/spec_helper'
require '../app/event'
require 'rspec/support'
require 'rspec/core'
require '../bases/bases'
require 'faker'

describe 'my-events' do
  include Bases::AuthBase
  it 'should create event' do
    @app.navigation.go_to_events_page
    @app.navigation.go_to_create_events_page

    name_event = Faker::Commerce.department
    description_event = Faker::HarryPotter.quote

    event = Event.new(name_event, description_event)
    @app.event.create_event_with(event)
    expect(@app.event.create?).to eq(true)
  end

  it 'should edit last event' do
    @app.navigation.go_to_events_page
    event = Event.new('Change event', 'KEK')
    @app.event.edit_event(event)
  
    expect(@app.event.edited?).to eq(true)
  end

  it 'should delete event' do
    @app.navigation.go_to_events_page
    @app.event.remove_last_event
  
    expect(@app.event.deleted?).to eq(true)
  end
end