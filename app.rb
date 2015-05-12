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
#---------------------

# All Surveys
get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end
#--------------------


#Add survey
get('/survey/new') do
  erb(:survey_form)
end

post('/survey') do
  name = params.fetch('name')
  Survey.create({:name => name})
  @surveys = Survey.all
  erb(:surveys)
end
#----------------------

#Edit/delete survey
get('/survey/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:survey_edit)
end
#---------------------

#Edit survey
patch('/survey/:id') do
  name = params.fetch('name')
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.update({:name => name})
  @surveys = Survey.all
  # @questions = Survey.questions.all
  erb(:surveys)
end
#----------------------

#Delete survey
delete('/survey/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.delete
  @surveys = Survey.all
  erb(:surveys)
end
#------------------------

# Add question
get('/question/new') do
  @surveys = Survey.all
  erb(:question_form)
end

post('/question') do
  survey_id = params.fetch('survey_id').to_i
  question = params.fetch('question')
  Question.create({:question => question, :survey_id => survey_id})
  @questions = Question.all
  @surveys = Survey.all
  erb(:surveys)
end
#----------------

#Edit/delete question
get('/question/:id') do
  @question = Question.find(params.fetch('id').to_i)
  @surveys = Survey.all
  erb(:question_edit)
end
#------------------

#Edit question
patch('/question/:id') do
  question = params.fetch('question')
  @question = Question.find(params.fetch('id').to_i)
  @question.update({:question => question})
  @questions = Survey.questions.all
  @surveys = Survey.all
  erb(:survey_edit)
end
#-------------

# #Delete question
# delete
# #--------------
