require "logger"
require "sequel"

db = "production"
DB = Sequel.sqlite("#{db}.sqlite3",
                     logger: Logger.new("#{db}.log"))
