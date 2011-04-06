# encoding: utf-8
require 'spec_helper'
require File.dirname(__FILE__) + '/shared_data_store_examples'

describe Dragonfly::DataStorage::CouchDataStore do

  before(:each) do
    WebMock.allow_net_connect!
    @data_store = Dragonfly::DataStorage::CouchDataStore.new(
      :host => "localhost", 
      :port => "5984", 
      :username => "", 
      :password => "", 
      :database => "dragonfly_test"
    )
    begin
      @data_store.db.get('ping')
    rescue Errno::ECONNREFUSED => e
      pending "You need to start CouchDB on localhost:5984 to test the CouchDataStore"
    rescue RestClient::ResourceNotFound
    end
    
  end
  
  it_should_behave_like 'data_store'
  
end
