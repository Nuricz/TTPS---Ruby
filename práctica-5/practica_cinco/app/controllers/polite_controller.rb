class PoliteController < ApplicationController
  def salute
    ['Buenos días señorite', 'Ola khe asé', 'Holaa', 'Hola que tal como te va??', 'Holis'].sample
  end

  helper_method :salute
end
