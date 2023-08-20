require 'sinatra'
require 'sinatra/reloader'
# require 'active_record'

# ActiveRecord::Base.establish_connection(
# )

# class Comment < ActiveRecord::Base
# end

JSON_FILE_PATH = 'data.json'

get '/' do
  @memo = Memo.order("id desc").all
  erb :memo_app
end

post '/add_memo' do
  data = JSON.parse(FILE.read(JSON_FILE_PATH))
  input_data = {
    title: params[:title],
    contents: params[:contents],
  }
  data << input_data
  File.write(JSON_FILE_PATH, JSON.pretty_generate(data))
  redirect '/'
end

get '/registration' do
  @data = JSON.parse(File.read(JSON_FILE_PATH))
  erb :registration
end

# get '/erb_template_page' do
#   erb :erb_template_page
# end
#
# get '/markdown_template_page' do
#   markdown :markdown_template_page
# end
#
# get '/erb_and_md_template_page' do
#   erb :erb_and_md_template_page, :locals => { :md => markdown(:erb_and_md_template_page) }
# end
#
# get '/erb_and_md_template_page' do
#   erb :erb_and_md_template_page, :locals => { :md => markdown(:erb_and_md_template_page) }
# end
