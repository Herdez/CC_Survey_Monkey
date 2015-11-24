before '/secret' do 
	unless session[:user_id]
	  session[:errors] = "No tienes una sesión por favor inicia sesión"
		redirect ("/")
	end
	@user = User.find(session[:user_id])
end 

before '/create' do 
	unless session[:user_id]
	  session[:errors] = "No tienes una sesión por favor inicia sesión"
		redirect ("/")
	end
	@user = User.find(session[:user_id])
end 

before '/survey/user/:user_id' do 
	unless session[:user_id]
	  session[:errors] = "No tienes una sesión por favor inicia sesión"
		redirect ("/")
	end
	@user = User.find(session[:user_id])
end 
#GET=============================================================================================

before '/survey/poll_survey' do 
	unless session[:user_id]
	  session[:errors] = "No tienes una sesión por favor inicia sesión"
		redirect ("/")
	end
	@user = User.find(session[:user_id])
end 

before '/survey_list' do 
	unless session[:user_id]
	  session[:errors] = "No tienes una sesión por favor inicia sesión"
		redirect ("/")
	end
	@user = User.find(session[:user_id])
end 


get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb

  erb :index
end


get '/secret' do
	
  erb :secret
end

get '/create' do

  erb :'survey/survey_title'
end

get '/survey_list' do
	@survey_list = Survey.all	
	erb :'survey/survey_list'
end

# get '/survey_list/answer_survey' do 
	
# 	erb :'survey/answer_survey/'
# end

#POST=============================================================================================

get '/survey/:survey_id/poll_survey' do
	@survey = Survey.find(params[:survey_id])
	@questions = @survey.questions
	@options = Option.where(survey_id: @survey.id)
	puts "*" * 50
	p @questions
	p @options
  erb :'survey/poll_survey'
end

post '/survey/user/:user_id' do
  @survey = Survey.create(title: params["title"])
  @survey_id = Survey.last.id
  @record = Record.create(user_id: params[:user_id], survey_id: @survey_id )
  erb :'survey/create'
end

post '/create/user/:user_id/survey/:survey_id' do
  #puts "*" * 50
	#puts params
	@question = Question.create(question: params["question"], survey_id: params[:survey_id])
  @option1 = Option.create(option: params["option1"], question_id: @question.id, survey_id: params[:survey_id])
  @option2 = Option.create(option: params["option2"], question_id: @question.id, survey_id: params[:survey_id])
  @option3 = Option.create(option: params["option3"], question_id: @question.id, survey_id: params[:survey_id])
  erb :'survey/_question', layout: false
end