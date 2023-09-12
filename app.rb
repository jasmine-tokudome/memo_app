require 'sinatra'
require 'sinatra/reloader'

get "/" do
  erb :index
end

get "/about" do
  @title = "about"
  @content = "about contnt"
  @email = 'mail@k.com'
  erb :about
end
