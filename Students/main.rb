require 'fox16'
require "./views/student_list_view.rb"
require 'dotenv/load'
require 'pg'
include Fox
app = FXApp.new

students_list = Students_list.new('./students.json',Students_list_strategy_json.new())
students_list.read
db = Students_list_DB.new(
        dbname: ENV['DB_NAME'],
        user: ENV['DB_USERNAME'],
        password: ENV['DB_PASSWORD'],
        host: ENV['DB_HOST'],
        port: ENV['DB_PORT']
    )
StudentListView.new(app, db)
app.create
app.run
