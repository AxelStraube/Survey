require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**/*.rb'
require './lib/survey'
require './lib/question'
require 'pg'
require 'pry'


# Index page

get('/') do
  erb(:index)
end

#-----------------------

# All Surveys

get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

#-----------------------
