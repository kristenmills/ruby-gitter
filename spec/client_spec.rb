require 'spec_helper'

describe Gitter::Client do
  it 'should initialize properly with token' do
    client = Gitter::Client.new('TOKEN')
    expect(client.headers).to include('Content-Type' => 'application/json')
    expect(client.headers).to include('Accept' => 'application/json')
    expect(client.headers).to include('Authorization' => 'Bearer TOKEN')
  end
end