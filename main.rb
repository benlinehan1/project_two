require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require_relative 'user.rb'
require_relative 'lib/helpers.rb'
require_relative 'models/content.rb'

enable :sessions


get '/' do

  posts = find_all_posts()

  user = 

  erb :index, locals: { posts: posts }
end

get '/resources' do
  
  erb :resources
end

get '/about' do

  erb :about
end

get '/account' do

 erb :account_creation
end

get '/login' do
  
  erb :login
end

get '/share' do
  
  erb :make_a_post
end

get "/posts/:id" do
  

  post = find_post_by_id(params[:id])

  erb :show, locals: { post: post }
end

get '/comments' do

  
  erb :comments
end

post '/account_creation' do
  
  username = params["username"]
  email = params["email"]
  password = params["password"]
  password_digest = BCrypt::Password.create(password)

  create_user(username, email, password_digest)

  redirect '/'

end

post '/session' do
  
    user = find_user_by_email(params[:email])

    if user && BCrypt::Password.new(user["password_digest"]).==(params[:password])

      session[:user_id] = user["id"]
      redirect '/'
    else

      erb :login
  end
end

post '/posts' do
  create_content(params["title"], params["content"], params["image_url"], params["username"])

  redirect '/'
end

delete '/posts/:id' do
  
  delete_post(params["id"])

  redirect '/'
end

get '/posts/:id/edit' do
  
  id = params["id"]

  post = find_post_by_id(id)

  erb :edit_post, locals: { post: post }

end

put '/posts/:id' do

  update_post(params[:id], params[:title], params[:content], params[:image_url])

  redirect "/"


end

get '/comment/:id' do
  
  comments = get_comments( params["id"] )

  post = find_post_by_id( params["id"] ) 

  erb :comment_section, locals: { comments: comments, post: post }

end

post '/comments/:id' do

  comment = params["comment"]
  username = current_user()["username"]
  post_id = params["id"]

  make_a_comment(comment, username, post_id)

  redirect "/comment/#{post_id}"

end

delete '/comments/:id' do
  
  delete_a_comment( params["id"] )

  redirect '/'
end
 
# Ally123
# benjaminlinehan21@gmail.com
# nickiminaj

# PG.connect(ENV['DATABASE_URL'] || {dbname: 'project_two'})

delete '/session' do
  
  session[:user_id] = nil
  
  redirect '/login'
end