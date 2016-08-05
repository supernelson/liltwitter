# Index
get '/user_posts' do
	@users = User.find(session[:id])
	erb :'/users_posts/index'
end


# New
get '/user_posts/new' do
	erb :'/user_posts/new'
end


# Create
post '/user_posts' do
	redirect '/' # need to decide 
end

# Show
get '/user_posts/:id' do
	@user = User.find(params[:id])
	erb :'/user_posts/show'
end


# Edit
### another release


# Update
### another release


# Delete
delete '/user_posts/:id' do
	User.destroy(params[:id])
	redirect '/sessions/new'
end
