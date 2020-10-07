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

## Clases y módulos

8. Modelá con una jerarquía de clases algo sencillo que represente la siguiente situación:
   * Tres tipos de vehículo: `Auto`, `Moto` y `Lancha`
   * Los tres tipos arrancan usando una llave.
   * El auto, adicionalmente, requiere que no esté puesto el freno de mano y que el cambio esté en punto muerto. La
     moto, por otra parte, requiere una patada (sin la llave). La lancha arranca con la llave y listo.
   * El arranque de los tres vehículos se prueba en un taller. La especificación de `Taller` es la siguiente:

     ```ruby
     class Taller
       def probar(objeto)
         objeto.arrancar
       end
     end
     ```

     Suponé que, posteriormente, el taller necesita probar una motosierra. ¿Podrías hacerlo? ¿Cómo? ¿Qué concepto
     del lenguaje estás usando para poder realizar esto?

    Solución:

    ```rb
    module Motor
      @llave = true
      @estado = ["arrancó", "no arrancó"]
      def arrancar
        if llave  
          puts estado[0]
        else
          puts estado[1]
    end

    class Auto < ObjetoAMotor
        @freno_de_mano = false
        @cambio = "punto muerto"
        @estados_cambio = ["punto muerto", "1ra", "2da", "3ra", "4ta", "5ta"]
        def arrancar
          if cambio == estados_cambio[0]
            puts estado[0]
          else
            puts estado[1]   
        end
    end

    class Moto < ObjetoAMotor
      def arrancar
        if dar_patada?
          puts estado[0]
        else
          puts estado [1]
      end

      def dar_patada?
        if llave
          false
        else
          true
      end
    end

    class Lancha < ObjetoAMotor
    end
    ```

9. ¿Qué diferencia hay entre el uso de `include` y `extend` a la hora de incorporar un módulo en una clase?
   1. Si quisieras usar un módulo para agregar métodos de instancia a una clase, ¿qué forma usarías a la hora de
      incluirlo en la clase?
   2. Si en cambio quisieras usar un módulo para agregar métodos de clase, ¿qué forma usarías a la hora de incluir el
      módulo en la clase?

    Respuestas:

    * Si se utiliza `extend` los métodos incluídos se incluyen como métodos de clase.
    * Si se utiliza `include` los métodos se incluyen como métodos de instancia.
    1. Usaría `include ModuleName`
    2. Usaría `extend ModuleName`

10. Implementá el módulo `Reverso` para utilizar como _Mixin_ e incluilo en alguna clase para probarlo. `Reverso` debe
    contener los siguientes métodos:
    1. `#di_tcejbo`: Imprime el `object_id` del receptor en espejo (en orden inverso).
    2. `#ssalc`: Imprime el nombre de la clase del receptor en espejo.

    ```rb
    module Reverso
      def di_tcejbo
        puts self.object_id
      end
    
      def ssalc
        self.class.to_s.reverse
      end
    end
    ```

11. Implementá el Mixin `Countable` que te permita hacer que cualquier clase cuente la cantidad de veces que los métodos de instancia definidos en ella es invocado. Utilizalo en distintas clases, tanto desarrolladas por vos como clases de la librería standard de Ruby, y chequeá los resultados. El Mixin debe tener los siguientes métodos:
    
    1. `count_invocations_of(sym)`: método de clase que al invocarse realiza las tareas necesarias para contabilizar las invocaciones al método de instancia cuyo nombre es `sym` (un símbolo).
    2. `invoked?(sym)`: método de instancia que devuelve un valor booleano indicando si el método llamado `sym` fue invocado al menos una vez en la instancia receptora.
    3. `invoked(sym)`: método de instancia que devuelve la cantidad de veces que el método identificado por `sym` fue invocado en la instancia receptora.

    ```rb
    module Countable
      def invocations
          @invocations ||= Hash.new(0)
      end

      module ClassMethods
        def count_invocations_of(sym)
          alias_method(":original_#{sym}", sym) 
          define_method "#{sym}" do
            invocations[__method__] += 1
            send(":original_#{sym}")
          end
        end
      end

      def invoked?(sym)
        if @invocations
          @invocations[sym] > 0
        else
          false
        end
      end

      def invoked(sym)
        if @invocations
          @invocations[sym]
        else
          0
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end
    end

    class Prueba
      include Countable
      def fun1
      end

      def fun2
      end
    end

    #Probando
    Prueba.count_invocations_of :fun1
    p = Prueba.new
    p.invoked? :fun1 #=> false
    p.invoked :fun1 #=> 0
    p.fun1
    p.fun1 
    p.fun1
    p.invoked? :fun1 #=> true
    p.invoked :fun1 #=> 3
    p.fun2 #No fue añadida en count_invocations
    p.invoked? :fun2 #=> false
    p.invoked :fun2 #=> 0
    #--------------------------
    String.include Countable
    String.count_invocations_of :upcase
    s = "Hola mundo"
    s.upcase #=> "HOLA MUNDO"
    s.invoked? :upcase #=> true
    s.invoked :upcase #=> 1
    ```

12. Dada la siguiente clase _abstracta_ `GenericFactory`, implementá subclases de la misma que permitan la creación de instancias de dichas clases mediante el uso del método de clase `.create`, de manera tal que luego puedas usar esa lógica para instanciar objetos sin invocar directamente el constructor `new`.

    ```ruby
    class GenericFactory
      def self.create(**args)
        new(**args)
      end
      def initialize(**args)
        raise NotImplementedError
      end
    end
    ```

    Solución:
    ```rb
    class PokemonFactory < GenericFactory
      def initialize **args
      end
    end
    ```

13. Modificá la implementación del ejercicio anterior para que `GenericFactory` sea un módulo que se incluya como _Mixin_ en las subclases que implementaste. ¿Qué modificaciones tuviste que hacer en tus clases?
    
    ```ruby
    module GenericFactory
      module ClassMethods
        def self.create(**args)
          new(**args)
        end
      end

      def self.included base
        base.extend ClassMethods
      end

      def initialize(**args)
        raise NotImplementedError
      end
    end
    ```

    Solución:
    ```rb
    class PokemonFactory
      include GenericFactory

      def initialize **args
      end
    end
    ```

14. Extendé las clases `TrueClass` y `FalseClass` para que ambas respondan al método de instancia `opposite`, el cual en cada caso debe retornar el valor opuesto al que recibe la invocación al método. Por ejemplo:

    ```ruby
    false.opposite
    # => true
    true.opposite
    # => false
    true.opposite.opposite
    # => true
    ```

    ```rb
    module Opposite
      def opposite
        return !self
      end
    end  
    ```

15. Analizá el script Ruby presentado a continuación e indicá:

    ```ruby
    VALUE = 'global'
   
    module A
      VALUE = 'A'
   
      class B
        VALUE = 'B'
   
        def self.value
          VALUE
        end
   
        def value
          'iB'
        end
      end
   
      def self.value
        VALUE
      end
    end
   
    class C
      class D
        VALUE = 'D'
    
        def self.value
          VALUE
        end
      end
   
      module E
        def self.value
          VALUE
        end
      end
   
      def self.value
        VALUE
      end
    end
   
    class F < C
      VALUE = 'F'
    end
    ```

    1. ¿Qué imprimen cada una de las siguientes sentencias? ¿De dónde está obteniendo el valor?
       1. `puts A.value`
          * Imprime **A** lo obtiene del método `self.value` del módulo A, imprime la variable VALUE del módulo A 
       1. `puts A::B.value`
          * Imprime **B** lo obtiene del método `self.value` de la clase B del módulo A, imprime la variable VALUE de la clase B 
       1. `puts C::D.value`
          * Imprime **D** lo obtiene del método `self.value` de la clase D dentro de la clase C, imprime la variable VALUE de la clase D 
       2. `puts C::E.value`
          * Imprime **global** lo obtiene del método `self.value` del módulo E dentro de la clase C, imprime la variable VALUE global, porque ni el módulo E ni la clase C definió un valor para VALUE 
       3. `puts F.value`
          * Imprime **global** lo obtiene del método `self.value` de la clase C, imprime la variable VALUE global, porque la variable VALUE de la clase F está fuera del alcance del método que es llamado. La búsqueda es hacia arriba, no hacia abajo  
  
    2. ¿Qué pasaría si ejecutases las siguientes sentencias? ¿Por qué?
       1. `puts A::value`
          * Imprime **A** porque ejecuta el método `self.value` del módulo A 
       1. `puts A.new.value`
          * Da error porque no se puede instanciar a un módulo
       2. `puts B.value`
          * Da error porque no se reconoce a la clase B al estar dentro del módulo A. Para acceder a B hay que usar A::B
       3. `puts C::D.value`
          * .. Lo mismo que la primera vez que se llamó en 1.3
       4. `puts C.value`
          * Imprime **global** porque solo se tiene acceso a la variable VALUE global
       5. `puts F.superclass.value`
          * Imprime **global** porque solo se tiene acceso a la variable VALUE global