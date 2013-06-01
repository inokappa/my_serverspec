require 'spec_helper'

describe file('/usr/local/bin/redis-server') do
  it { should be_file }
  it { should be_executable }
end

describe file('/usr/local/bin/redis-cli') do
  it { should be_file }
  it { should be_executable }
end	

describe service('redis-server') do
  it { should be_running   }
end

describe port(6379) do
  it { should be_listening }
end

