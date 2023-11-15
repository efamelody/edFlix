
# Connect to the database
db = SQLite3::Database.new 'production.sqlite3'

# Define a route to display the course information
get '/courses' do
    db = SQLite3::Database.new 'db/production.sqlite3'
  # Query the database to retrieve the course information
  results = db.execute('SELECT * FROM courses')

  # Render the ERB view file, passing in the results as a variable
  erb :courses, locals: { results: results }
end
