require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
end

get '/' do
  erb :index
end

get '/count' do
  @number = Count.first.number
  
  erb :index
end

post '/plus' do
  count = Count.first
  count.number = count.number + 1
  count.save
  
  redirect '/count'
end

post '/minus' do
  count = Count.first
  count.number = count.number - 1
  count.save
  redirect '/count'
end

post '/kakeru' do
  count = Count.first
  count.number = count.number  * 2
  count.save
  
  redirect '/count'
end

post '/waru' do
  count = Count.first
  count.number = count.number / 2
  count.save
  
  redirect '/count'
end