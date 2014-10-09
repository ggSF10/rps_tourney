require 'active_record'
require 'active_record_tasks'
require_relative 'lib/rps_tourney.rb' # the path to your application file

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'rock_paper_scissors'
  )