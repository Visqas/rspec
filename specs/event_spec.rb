require '../helpers/spec_helper'
require '../app/event'
require 'rspec/support'
require 'rspec/core'
require '../bases/bases'

describe 'my-events' do
  include Bases::AuthBase
  it 'should create event' do
    @app.navigation.go_to_events_page
    @app.navigation.go_to_create_events_page
    event = Event.new('New event', 'My new event')
    @app.event.create_event_with(event)
    expect(@app.event.create?).to eq(true)
  end

  it 'should edit last event' do
    @app.navigation.go_to_events_page
    event = Event.new('Change event', 'KEK')
    @app.event.edit_event(event)
  end

  it 'should delete event' do
    @app.navigation.go_to_events_page
    @app.event.remove_last_event
    expect(@app.event.deleted?).to eq(false)
  end
end