require 'sinatra'

class NumberToX
    def initialize(app)
        @app = app
    end

    def call(env)
        status, headers, response  = @app.call(env)
        new_response = response.map { |c| c.gsub(/\d/,'x') }
        [status, headers, new_response]
    end
end

use NumberToX

get '/' do
    body "GET / lista todos los endpoints disponibles (sirve a modo de documentación) <br/>
GET /mcm/:a/:b calcula y presenta el mínimo común múltiplo de los valores numéricos :a y :b <br/>
GET /mcd/:a/:b calcula y presenta el máximo común divisor de los valores numéricos :a y :b <br/>
GET /sum/* calcula la sumatoria de todos los valores numéricos recibidos como parámetro en el splat <br/>
GET /even/* presenta la cantidad de números pares que hay entre los valores numéricos recibidos como parámetro en el splat <br/>
POST /random presenta un número al azar <br/>
POST /random/:lower/:upper presenta un número al azar entre :lower y :upper (dos valores numéricos)"
end

get '/mcm/:a/:b' do |a, b|
    'El mcm entre ' + 
    a.to_s + ' y ' + b.to_s +
    ' es <p> ' + 
    a.to_i.lcm(b.to_i).to_s
end

get '/mcd/:a/:b' do |a, b|
    'El mcd entre ' + 
    a + ' y ' + b +
    ' es <p> ' + 
    a.to_i.gcd(b.to_i).to_s
end

get '/sum/*' do |nums|
    'La suma de: ' + 
    nums.gsub(/[{\/\\}]/, '/' => ", ") + 
    ' es <p> ' + 
    nums.split('/').map(&:to_i).sum.to_s
end

get '/even/*' do |nums|
    'La cantidad de números pares entre: ' + 
    nums.gsub(/[{\/\\}]/, '/' => ", ") + 
    ' es <p> ' + 
    nums.split('/').map(&:to_i).select(&:even?).size.to_s
end

get '/random' do
    rand.to_s
end

get '/random/:lower/:upper' do |lower, upper|
    rand(lower.to_i..upper.to_i).to_s
end