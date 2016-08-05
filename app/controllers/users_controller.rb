# Index
get '/users' do
	@users = User.all
	erb :'/users/index'
end


# New
get '/users/new' do
	erb :'/users/new'
end


# Create
post '/users' do
  if User.find_by(username: params[:user][:username])
   redirect 'sessions/new'
  elsif params[:user][:password] == params[:password1]
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/users" # check
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
    end
  else
    redirect '/users/new'
  end
end

post '/users/:id/follower' do
  @user = User.find(params[:id])
  @user_to_follow = User.find(params[:user_to_follow_id])
  @user.following << @user_to_follow if !@user.following.include?(@user_to_follow)
  redirect "/users"
end


# Show
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'/users/show'
end


# Edit
### another release


# Update
### another release


# Delete - needs to be referenced in an active route
delete '/users/:id' do
	@user = User.find(params[:id])
	@user.destroy
	redirect '/sessions/new'
end

