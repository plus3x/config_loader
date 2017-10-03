# frozen_string_literal: true

require_relative '../../lib/custom_config_parser'

describe CustomConfigParser do
  let(:config_file) do
    %Q{
# This is what a comment looks like, ignore it
# All these config lines are valid
host = test.com
server_id=55331
server_load_alarm=2.5
user= user
# comment can appear here as well
verbose =true
test_mode = on
debug_mode = off
log_file_path = /tmp/logfile.log
send_notifications = yes
    }
  end
  let(:expected_result) do
    {
      'host' => 'test.com',
      'server_id' => 55331,
      'server_load_alarm' => 2.5,
      'user' => 'user',
      'verbose' => true,
      'test_mode' => true,
      'debug_mode' => false,
      'log_file_path' => '/tmp/logfile.log',
      'send_notifications' => true
    }
  end

  it { expect(described_class.parse(config_file)).to match expected_result }
end
