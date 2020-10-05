# Práctica 2

## Métodos

1. Implementá un método que reciba como parámetro un arreglo de números, los ordene y devuelva el resultado. Por ejemplo:

    ```ruby
    ordenar_arreglo([1, 4, 6, 2, 3, 0, 10])
    # => [0, 1, 2, 3, 4, 6, 10]
    ```

    ```rb
    def ordenar_arreglo(array)
        array.sort
    end
    ```

2. Modificá el método anterior para que en lugar de recibir un arreglo como único parámetro, reciba todos los números como parámetros separados. Por ejemplo:

    ```ruby
    ordenar(1, 4, 6, 2, 3, 5, 0, 10, 9)
    # => [0, 1, 2, 4, 5, 6, 9, 10]
    ```

    Solución:

    ```rb
    def ordenar(*args)
        args.sort
    end 
    ```

3. Suponé que se te da el método que implementaste en el ejercicio anterior para que lo uses a fin de ordenar un arreglo de números que te son provistos en forma de arreglo. ¿Cómo podrías invocar el método? Por ejemplo, teniendo la siguiente variable con los números a ordenar:

   ```ruby
   entrada = [10, 9, 1, 2, 3, 5, 7, 8]
   # Dada `entrada', invocar a #ordenar utilizando sus valores para ordenarlos
   ```

    Solución:

    ```rb
    ordenar(*entrada)
    ```
    Ver * (o splat) en:
    >https://ruby-doc.org/core-2.6/doc/syntax/calling_methods_rdoc.html

4. Escribí un método que dado un número variable de parámetros que pueden ser de cualquier tipo, imprima en pantalla la cantidad de caracteres que tiene su representación como `String` y la representación que se utilizó para contarla.

   > Nota: Para convertir cada parámetro a string utilizá el método #to_s presente en todos los objetos.
   Por ejemplo:

   ```ruby
   longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)
   # Debe imprimir:
   # "9" --> 1
   # "2017-09-14 13:22:10 +0000" --> 25
   # "Hola" --> 4
   # {:un=>"hash"} --> 13
   # ruby --> 4
   ```

    Solución:
    ```rb
    def longitud(*args)
        args.each do |arg|
            puts "#{arg.to_s} --> #{arg.to_s.length}"
        end
    end
    ```

5. Implementá el método `cuanto_falta?` que opcionalmente reciba como parámetro un objeto `Time` y que calcule la cantidad de minutos que faltan para ese momento. Si el parámetro de fecha no es provisto, asumí que la consulta es para la medianoche de hoy.

   Por ejemplo:

   ```ruby
   cuanto_falta? Time.new(2022, 12, 31, 23, 59, 59)
   # Debe retornar la cantidad de minutos que faltan para las 23:59:59 del 31/12/2017
   cuanto_falta?
   # Debe retornar la cantidad de minutos que faltan para la medianoche de hoy
   ```

    Solución: 

    ```rb
    #Restar un objeto de de la clase Time con otro da un resultado en segundos, al dividirlo por 60 da el resultado en minutos
    def cuanto_falta?(time = Time.new(Time.new.year, Time.new.month, Time.new.day+1))
        (time - Time.now).to_i / 60        
    end
    ```

6. Analizá el siguiente código e indicá qué problema(s) puede tener.

   ```ruby
   # Tira un dado virtual de 6 caras
   def tirar_dado
     rand 1..6
   end
   # Mueve la ficha de un jugador tantos casilleros como indique el dado en un tablero virtual de 40 posiciones.
   # Si no se recibe la cantidad de casilleros, aprovecho el valor por defecto para ese parámetro para evitar tener que
   # llamar a #tirar_dado dentro del cuerpo del método.
   def mover_ficha(fichas, jugador, casilleros = tirar_dado)
     fichas[jugador] += casilleros
     if fichas[jugador] > 40
       puts "Ganó #{jugador}!!"
       true
     else
       puts "#{jugador} ahora está en el casillero #{fichas[jugador]}"
       fichas[jugador]
     end
   end
   posiciones = { azul: 0, rojo: 0, verde: 0 }
   finalizado = false
   until finalizado
     ['azul', 'rojo', 'verde'].shuffle.each do |jugador|
       finalizado = mover_ficha(posiciones, jugador)
     end
   end
   ```

    1) El hash de posiciones está construído con keys que son símbolos y se está intentando acceder con strings. Esto genera que esas posicones tengan `nil` por lo cual el programa da error
   
    2) `finalizado` toma el valor `true` a pesar de que no haya ganado ningún jugador
   
    3) Como no hay ninguna verificación de si algún otro jugador ya ganó, puede suceder que un jugador gane y luego otro jugador se mueva, hasta podría haber más de un ganador

7. Modificá el código anterior para, acorde a tu análisis, corregir los problemas que pueda tener.

   > Nota: asumí que el juego debe terminar al momento que el primer jugador supera la posición 40 en el tablero.

   Solucion:

    ```ruby
    def tirar_dado
        rand 1..6
    end

    def mover_ficha(fichas, jugador, casilleros = tirar_dado)
        fichas[jugador] += casilleros
        if fichas[jugador] > 40
            puts "Ganó #{jugador}!!"
            true
        else
            puts "#{jugador} ahora está en el casillero #{fichas[jugador]}"
            fichas[jugador]
            false #Se agregó un false
        end
    end
    #Programa principal
    posiciones = { azul: 0, rojo: 0, verde: 0 }
    finalizado = false
    until finalizado
        #Se accede al hash con símbolos
        [:azul, :rojo, :verde].shuffle.each do |jugador|
            if(!finalizado) then #Se agregó una verificación
                finalizado = mover_ficha(posiciones, jugador)
            end
        end
    end
    ```