require 'sinatra'

get '/' do
    num = rand(1..42)
    code = num == 42 ? 200 : 404
    [code, [num.to_s]]
end