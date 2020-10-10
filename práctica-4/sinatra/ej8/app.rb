require 'sinatra'
require_relative 'ahorcado.rb'

words = [Ahorcado.new("lucario"), Ahorcado.new("archipielago"), Ahorcado.new("restaurante"),
    Ahorcado.new("portaretrato"), Ahorcado.new("helado")]


post '/' do
    redirect "/partida/#{rand(words.size)}"
end

get '/partida/:id' do |id|
    words[id.to_i].game
end

put '/partida/:id' do |id|
    words[id.to_i].test_letter(params['intento'])
    redirect "/partida/#{id}"
end