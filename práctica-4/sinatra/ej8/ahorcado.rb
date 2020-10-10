class Ahorcado
    def initialize(word)
        @word = word
        @tries = 6
        @guessed = []
        @used_letters = []
    end

    #Muestra la situación del juego
    def game
        check_win do
            s = "Ahorcado \n\n"
            s << write_word + "\n"
            s << "Letras probadas: " + @used_letters.to_s + "\n"
            s << "Fallidos: " + (6 - @tries).to_s << "\n"
            s << "Restantes: " + @tries.to_s << "\n"
        end      
    end

    #Comprueba si la letra mandada se encuentra o no en la palabra a adivinar
    def test_letter(letter)
        check_win do
            @used_letters << letter
            if @word.include? letter and !@guessed.include? letter then
                @word.scan(/(?=#{letter})/).count.times do
                    @guessed << letter
                end
            else
                @tries -= 1
            end
        end
    end

    #Se encarga de imprimir la palabra mostrando solo las letras adivinadas
    def write_word
        view_word = @word
        @word.chars.each do |c|
            if !@guessed.include? c then
                view_word = view_word.gsub(/#{c}/, ' _ ')
            end
        end
        return view_word
    end
    
    #Comprueba si ya se ganó la partida y actúa en consecuencia
    private
    def check_win
        if !guessed? and intents_left?
            yield
        elsif guessed?
            "Ganaste!! :D \n"
        else
            "Perdiste!! D: \n"
        end
    end    

    #Retorna true si se ha adivinado la palabra, else caso contrario
    private
    def guessed?
        @word.size == @guessed.size
    end

    #Retorna true si aún hay intentos, else caso contrario
    private
    def intents_left?
        @tries > 0 ? true : false
    end
end

