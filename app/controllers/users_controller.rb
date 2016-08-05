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
	redirect '/' # need to decide 
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


# Delete
delete '/users/:id' do
	User.destroy(params[:id])
	redirect '/sessions/new'
end

