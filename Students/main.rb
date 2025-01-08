require 'fox16'
require './views/student_list_view.rb'
require 'dotenv/load'
require 'pg'
include Fox
app = FXApp.new

students_list = Students_list.new('./students.json',Students_list_strategy_json.new())
students_list.read
StudentListView.new(app, students_list)
app.create
app.run
