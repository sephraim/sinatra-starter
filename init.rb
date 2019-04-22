require 'sinatra'
require_relative 'helpers'
# require 'sinatra/cookies'
# require 'mysql2'
# require 'active_record'

# Auto-require all .rb files in the models/ directory
Dir[settings.root + "/models/*.rb"].each { |file| require file }

# Configure sessions
# enable :sessions
# set :session_secret, 'foobarfoobarfoobarfoobarfoobar' # <-- ANY RANDOM LONG STRING

# Configure database
# ActiveRecord::Base.establish_connection(
#   :adapter => 'mysql2',
#   :host => 'localhost',
#   :database => 'db_name',
#   :username => 'db_user',
#   :password => 'db_password'
# )

# Homepage
get '/' do
  render_view(:index)
end

# Auto-load public/views directories
get /\/(?<file>.+)/ do
  file = params[:file]
  if File.exist?("#{settings.public_folder}/#{file}.html")
    # Public dir
    send_file("#{settings.public_folder}/#{file}.html")
  elsif File.exist?("#{settings.views}/#{file}.erb")
    # Views dir
    render_view(file)
  else
    "Invalid URL"
  end
end
