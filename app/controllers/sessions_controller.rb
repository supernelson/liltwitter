# Sessions NEW
get '/sessions/new' do
  erb :'sessions/new'
end

# Sessions CREATE
post '/sessions' do
  @user = User.find_by(username: params[:user][:username])
  if @user
    if @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect 'sessions/new'
    end
  else
    redirect 'users/new'
  end
end

# Sessions DELETE
delete '/sessions/:id' do
  session[:id] = nil
  redirect "/"
end
