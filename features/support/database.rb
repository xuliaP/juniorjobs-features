require 'yaml'
require 'erb'
require 'active_record'

db_config = File.read('./features/support/database.yml')
db_config = ERB.new(db_config).result()
db_config = YAML.load(db_config)['test']

ActiveRecord::Base.establish_connection(db_config)
