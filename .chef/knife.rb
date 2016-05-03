# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "pjohn07"
client_key               "#{current_dir}/pjohn07.pem"
validation_client_name   "parkerchef-validator"
validation_key           "#{current_dir}/parkerchef-validator.pem"
chef_server_url          "https://api.chef.io/organizations/parkerchef"
cookbook_path            ["#{current_dir}/../cookbooks"]
