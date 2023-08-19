require 'sinatra'
require 'sinatra/reloader'
# require 'active_record'

# ActiveRecord::Base.establish_connection(
# )

# class Comment < ActiveRecord::Base
# end

get '/' do
  @memo = Memo.order("id desc").all
  erb :memo_app
end

get '/erb_template_page' do
  erb :erb_template_page
end

get '/markdown_template_page' do
  markdown :markdown_template_page
end

get '/erb_and_md_template_page' do
  erb :erb_and_md_template_page, :locals => { :md => markdown(:erb_and_md_template_page) }
end

get '/erb_and_md_template_page' do
  erb :erb_and_md_template_page, :locals => { :md => markdown(:erb_and_md_template_page) }
end
