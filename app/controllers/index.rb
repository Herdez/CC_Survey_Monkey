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

before '/survey/:survey_id/poll_survey' do 
	unless session[:user_id]
	  session[:errors] = "No tienes una sesión por favor inicia sesión"
		redirect ("/")
	end
	@user = User.find(session[:user_id])
end 

before '/user/:user_id/show_surveys' do 
	unless session[:user_id]
	  session[:errors] = "No tienes una sesión por favor inicia sesión"
		redirect ("/")
	end
	@user = User.find(session[:user_id])
end 

before '/user/:user_id/survey/:survey_id/stats' do 
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

get '/user/:user_id/show_surveys' do
  @record = Record.all
  @survey = Survey.all
  @record_user = @record.where(user_id: params[:user_id])
  erb :'survey/show_surveys'
end

get '/user/:user_id/survey/:survey_id/stats' do
  @survey = Survey.find(params[:survey_id])
	@questions = @survey.questions
  @stat = Stat.all
  @user_all = User.all
	@options = Option.where(survey_id: @survey.id)
  erb :'survey/stats'
end
#POST=============================================================================================

get '/survey/:survey_id/poll_survey' do
	@survey = Survey.find(params[:survey_id])
	@questions = @survey.questions
	@options = Option.where(survey_id: @survey.id)
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

post '/user/:user_id/survey/:survey_id/question/option' do
  puts "+" * 50
  p params["option"]
  params["option"].each do |question, choice|
    @stat = Stat.create(responder_id: params[:user_id], survey_id: params[:survey_id], choice: choice, question_id: question)
  end
  redirect ("/survey_list")
end


