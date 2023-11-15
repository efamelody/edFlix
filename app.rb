require "sinatra"
include ERB::Util
require "require_all"
require "sequel"
require "logger"

require_rel "db/db", "models", "controllers", "helpers"
enable :sessions
logger = Logger.new('log/app.log')
logger.level = Logger::INFO
before do
  logger.info("#{request.ip} - #{request.request_method} #{request.path} - session: #{session.inspect}")
end
set :logging, true

get '/' do
  erb :index
end

