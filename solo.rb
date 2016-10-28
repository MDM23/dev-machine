package_path = File.expand_path(File.dirname(__FILE__)) + "/"

# Configuration for chef-solo
file_cache_path package_path
cookbook_path package_path + "cookbooks"
json_attribs package_path + "node.json"

# Setup logging
log_level :info
verbose_logging false
