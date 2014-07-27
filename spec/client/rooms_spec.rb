require 'spec_helper'
require 'yaml'
require 'hashie/mash'

describe Gitter::Client::Rooms do

  let(:client) { Gitter::Client.new('TOKEN') }
  let(:yaml) { YAML.load_file('spec/response/rooms.yml') }

  it 'should get the rooms list' do
    allow(Gitter::Client).to receive(:get).with('/rooms', headers: client.headers) do
      yaml['rooms']
    end
    rooms = client.rooms
    expect(rooms.size).to eql(2)
    rooms.each do |room|
      expect(room).to be_a Hashie::Mash
    end
  end

  it 'should get the room users' do
    allow(Gitter::Client).to receive(:get).with('/rooms/ROOM_ID/users', headers: client.headers) do
      yaml['users']
    end
    users = client.room_users('ROOM_ID')
    expect(users.size).to eql(2)
    users.each do |user|
      expect(user).to be_a Hashie::Mash
    end
  end

  it 'should get the room channels' do
    allow(Gitter::Client).to receive(:get).with('/rooms/ROOM_ID/channels', headers: client.headers) do
      yaml['channels']
    end
    channels = client.room_channels('ROOM_ID')
    expect(channels.size).to eql(1)
    channels.each do |channel|
      expect(channel).to be_a Hashie::Mash
    end
  end
end