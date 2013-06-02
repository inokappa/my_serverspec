require 'spec_helper'

# SSH サービスの稼働と自動起動の確認
describe service('sshd') do
  it { should be_enabled }
  it { should be_running }
end

# SSH の Listen ポート確認
describe port(22) do
	it { should be_listening }
end

# MySQL のインストール確認
describe package('mysql-server') do                  
  it { should be_installed }                  
end 

# MySQL サービスの稼働と自動起動の確認
describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end

# postfix のインストール確認
describe package('postfix') do                  
  it { should be_installed }                  
end 

# postfix サービスの稼働と自動起動の確認
describe service('postfix') do
  it { should be_enabled }
  it { should be_running }
end

# Apache のインストール確認
describe package('httpd') do                  
  it { should be_installed }                  
end                                           

# httpd サービスの稼働と自動起動の確認
describe service('httpd') do                  
  it { should be_enabled   }                  
  it { should be_running   }                  
end                                           

# httpd の Listen ポート確認
describe port(80) do                          
  it { should be_listening }                  
end                                           

# welcome.conf が存在していないか確認                                             
describe file('/etc/httpd/conf.d/welcome.conf') do
  it { should_not be_file }                       
end 

# iptables が稼働していない、自動起動しないか確認
describe service('iptables') do
  it { should_not be_enabled }
  it { should_not be_running }
end                                          
