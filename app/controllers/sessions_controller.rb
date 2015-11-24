
# GETS ============================================

get '/signin' do
	erb :signin
end


# Este debería ser un post 
get '/logout' do
	session.clear
  redirect ("/")
end

# POSTS ============================================

post '/signin' do
	email = params[:user][:email]
	password = params[:user][:password]
	@user = User.autenticate(email,password)

	if @user
  	session[:user_id] = @user.id
  	erb :secret
  else
  	@errors = "Invalid Email and Password"
  	erb :signin
  end

end

