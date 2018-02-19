data_collector.server_url "https://10.10.10.10/data-collector/v0"
data_collector.token "93a49a4f2482c64126f7b6015e6b0f30284287ee4054ff8807fb63d9cbd1c506"

# Disable reporting to visibility when running chef in solo mode
# Set to :both to get chef-client to report to visibility
data_collector.mode :client

# *******************************************************************
# Below are configuration options for demonstrating with Vagrant
# They are not required and should not be set for a real deployment
# *******************************************************************

# This prevents the VMs from re-using the data_collector_metadata.json
#  file created by Chef. 
file_cache_path "#{File.dirname(__FILE__)}/local-mode-cache/#{`hostname`}"
ssl_verify_mode :verify_none
