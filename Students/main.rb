require 'fox16'
require './views/student_list_view.rb'
require 'dotenv/load'
require 'pg'
include Fox
app = FXApp.new
StudentListView.new(app)
app.create
app.run
