require 'spec_helper'

describe 'account' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "account class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('account::params') }
          it { is_expected.to contain_class('account::install').that_comes_before('account::config') }
          it { is_expected.to contain_class('account::config') }
          it { is_expected.to contain_class('account::service').that_subscribes_to('account::config') }

          it { is_expected.to contain_service('account') }
          it { is_expected.to contain_package('account').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'account class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('account') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
