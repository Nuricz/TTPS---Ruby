# Práctica 2

## Métodos

1. Implementá un método que reciba como parámetro un arreglo de números, los ordene y devuelva el resultado. Por ejemplo:

    ```ruby
    ordenar_arreglo([1, 4, 6, 2, 3, 0, 10])
    # => [0, 1, 2, 3, 4, 6, 10]
    ```

    Solución:

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

   Solución:

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

    Solución:

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

    Solución:
    
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

    Solución:

    ```rb
    module Opposite
      def opposite
        return !self
      end
    end
      
    #Prueba
    TrueClass.include Opposite
    FalseClass.include Opposite
    false.opposite
    # => true
    true.opposite
    # => false
    true.opposite.opposite
    # => true
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

## Bloques

16. Escribí un método `da_nil?` que reciba un bloque, lo invoque y retorne si el valor de retorno del bloque fue `nil`.
    Por ejemplo:

    ```ruby
    da_nil? { }
    # => true
    da_nil? do
      'Algo distinto de nil'
    end
    # => false
    ```

    Solución:
    ```rb
    def da_nil?
      yield.nil?
    end
    ```

17. Implementá un método que reciba como parámetros un `Hash` y `Proc`, y que devuelva un nuevo `Hash` cuyas claves sean los valores del `Hash` recibido como parámetro, y cuyos valores sean el resultado de invocar el `Proc` con cada clave del `Hash` original.

    Por ejemplo:

    ```ruby
    hash = { 'clave' => 1, :otra_clave => 'valor' }
    procesar_hash(hash, ->(x) { x.to_s.upcase })
    # => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }
    ```

    Solución: 
    ```rb
    def procesar_hash(hash,proc)
      ret_hash = {}
      hash.each_key do |key|
        ret_hash[hash[key]] = proc.call(key)
      end
      return ret_hash
    end
    ```

18. Implementá un método que reciba un número variable de parámetros y un bloque, y que al ser invocado ejecute el bloque recibido pasándole todos los parámetros que se recibieron encapsulando todo esto con captura de excepciones de manera tal que si en la ejecución del bloque se produce alguna excepción, proceda de la siguiente forma:

    * Si la excepción es de clase `RuntimeError`, debe imprimir en pantalla `"Algo salió mal..."`, y retornar `:rt`.
    * Si la excepción es de clase `NoMethodError`, debe imprimir `"No encontré un método: "` más el mensaje original de
      la excepción que se produjo, y retornar `:nm`.
    * Si se produce cualquier otra excepción, debe imprimir en pantalla `"¡No sé qué hacer!"`, y relanzar la excepción
      que se produjo.

    En caso que la ejecución del bloque sea exitosa, deberá retornar `:ok`.

    > Tips: Leer sobre las sentencias `raise` y `rescue`.

    Solución:

    ```rb
    def capture_exceptions(*args)
      begin
        args.each do |arg|
          yield arg
        end
      rescue RuntimeError
        puts 'Algo salió mal...'
        return :rt
      rescue NoMethodError => e
        puts "No encontré un método: #{e.message}"
      rescue 
        puts "¡No sé qué hacer!"
        raise
      else
        return :ok
      end
    end

    #Prueba
    capture_exceptions("hola"){|arg| arg.split} #=> :ok
    capture_exceptions("hola",["a","b"]){|arg| arg.split} #=> No encontré un método: undefined method `split' for ["a", "b"]:Array
    ```

## Enumeradores

20. Si no lo hiciste de esa forma en la práctica 1, escribí un enumerador que calcule la serie de Fibonacci.

    Solución:

    ```rb
    fibonacci = Enumerator.new do | y |
      a = b = 1
      loop do
        y.yield a
        a, b = b, a+b
      end
    end
    ```

21. ¿Qué son los _lazy enumerators_? ¿Qué ventajas les ves con respecto al uso de los enumeradores que no son _lazy_?

    > Tip: Analizalo pensando en conjuntos grandes de datos.
    
    Los _lazy enumerators_ son enumeradores que funcionan como un _productor / consumidor_ de esta forma no necesitan recorrer una colección completa si pueden terminar el trabajo antes. Para grandes cantidades de datos es muy útil ya que si es posible terminar una tarea antes de recorrer la colección completa, con _lazy enumerators_ es posible.

    Si no se utiliza el método `.lazy` de la clase `Enumerator`, siempre que llames a `.each` (método de esta misma clase), el método va a iterar por cada uno de los valores correspondientes antes de poder seguir con otra tarea. 
    
    Si hablamos de la ejecución de un `.each` en una colección extremadamente grande pero quizás lo que necesitamos no necesita recorrer cada uno de los datos, acá es cuando es útil utilizar `.lazy`.
    Otro ejemplo sería el tener que recorrer un arreglo infinito para pedirle sus 5 primeros valores:

    ```rb
    # Este código se "colgará" y tendrás que presionar ctrl-c para salir.
    (1..Float::INFINITY).reject { |i| i.odd? }.map { |i| i*i }.first(5)
    ```

    Esto es porque primero se debe terminar de ejecutar el `.map` antes de seguir con .`first`

    Pero con el uso de `.lazy` ..

    ```rb
    (1..Float::INFINITY).lazy.reject { |i| i.odd? }.map { |i| i*i }.first(5)
    #=> [4, 16, 36, 64, 100]
    ```

    Para más y mejor información al respecto:
    >https://www.honeybadger.io/blog/using-lazy-enumerators-to-work-with-large-files-in-ruby/

    >http://patshaughnessy.net/2013/4/3/ruby-2-0-works-hard-so-you-can-be-lazy

    >https://www.sitepoint.com/implementing-lazy-enumerables-in-ruby/

22. Extendé la clase `Array` con el método `randomly` para que funcione de la siguiente manera:
    * Si recibe un bloque, debe invocar ese bloque con cada uno de los elementos del arreglo en orden aleatorio.
    * Si no recibe un bloque, debe devolver un enumerador que va arrojando, de a uno, los elementos del arreglo en orden aleatorio.

    Solución:

    ```rb
    class Array
      def randomly &block
          shuffle.each &block
      end
    end
    #Prueba
    a.randomly #=> <Enumerator: [6, 2, 3, 5, 9, 0, 7, 8, 1, 4]:each>
    a.randomly {|v| puts v+100}
    #107
    #102
    #103
    #100
    #106
    #105
    #101
    #108
    #109
    #104
    #=> [7, 2, 3, 0, 6, 5, 1, 8, 9, 4]
    ```