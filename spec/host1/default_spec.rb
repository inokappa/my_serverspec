require 'spec_helper'

# OS チェック
describe file('/etc/redhat-release') do
  it { should contain 'CentOS' }
end

# ホスト名チェック
describe file('/etc/sysconfig/network') do
  it { should contain 'vm01.xen.inokara.com' }
end

# パーティションの確認
%w{ / /boot }.each do |partisions|
  describe partisions do
    it { should be_mounted.with( :type => 'ext4' ) }
  end
end

# SELinux 無効の確認
describe selinux do
  it { should be_disabled }
end
