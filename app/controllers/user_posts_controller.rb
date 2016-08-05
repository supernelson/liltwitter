# Index
get '/users/:user_id/posts' do
	@users = User.find(params[:user_id])
	@posts = @users.posts
	erb :'/posts/index'
end

get '/users/:user_id/following_posts' do
	@users = User.find(params[:user_id])
	@posts = @users.posts
	erb :'/posts/following_index'
end


# New
get '/users/:user_id/posts/new' do
	@users = User.find(params[:user_id])
	erb :'/posts/new'
end


# Create
post '/users/:user_id/posts' do
	@user = User.find(params[:user_id])
	@post = @user.posts.new(params[:user]) #post comes from form

	if @post.save
		redirect "/users/#{@user.id}/posts"
	else
		erb :'/posts/new'
	end
end

# Show
get '/users/:user_id/posts/:id' do
	@users = User.find(params[:user_id])
	@post = @user.posts.find(params[:id])
	erb :'/posts/show'
end


# Edit
### another release
# get '/users/:user_id/posts/:id/edit' do
# 	@users = User.find(params[:user_id])
# 	@post = @user.posts.find(params[:id])
# 	erb :'/posts/edit'
# end



# Update
### another release
# put '/users/:user_id/posts/:id' do
# 	@users = User.find(params[:user_id])
# 	@post = @user.posts.find(params[:id])

# 	if @post.update_attributes(params[:post])
# 		redirect "/users/#{@user.id}/posts"
# 	else
# 		erb :'/posts/edit'
# 	end
# end


# Delete
delete '/users/:user_id/posts/:id' do
	@user = user.find(params[:user_id])
	@post = @user.posts.find(params[:id])

	@post.destroy
	redirect "/users/#{@user.id}/posts"
end
