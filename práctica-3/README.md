# Práctica 3

## Excepciones

1. Investigá la jerarquía de clases que presenta Ruby para las excepciones. ¿Para qué se utilizan las siguientes clases?
    * `IOError`
      * Se genera cuando falla una operación de E/S
    * `NameError`
      * Se genera cuando un nombre no es válido o no está definido. 
    * `RuntimeError`
      * Una clase de error genérico que se genera cuando se intenta una operación no válida. `Kernel#raise` generará un `RuntimeError` si no se especifica ninguna clase de excepción. 
    * `NotImplementedError`
      * Se genera cuando una función no está implementada en la plataforma actual. Por ejemplo, los métodos que dependen de las llamadas al sistema fsync o fork pueden generar esta excepción si el sistema operativo subyacente o el tiempo de ejecución de Ruby no los admiten. 
    * `StopIteration`
      * Generado para detener la iteración, en particular por `Enumerator#next`. Es rescatado por `Kernel#loop`. 
    * `TypeError`
      * Se genera cuando se encuentra con un objeto que no es del tipo esperado. 
    * `SystemExit`
      * Generado por exit para iniciar la terminación del script. 
    * `SystemStackError`
      * Se genera en caso de desbordamiento de pila. 
        
        ```rb
        def me_myself_and_i
        me_myself_and_i
        end
        me_myself_and_i
        #SystemStackError: stack level too deep
        ```
    * `ZeroDivisionError`
      * Se genera al intentar dividir un número entero entre 0.
        ```rb
        42 / 0   #=> ZeroDivisionError: divided by 0
        ```
      * Solo la división por un 0 entero causará esta excepción
   
        ```rb
        42 /  0.0   #=> Float::INFINITY
        42 / -0.0   #=> -Float::INFINITY
        0  /  0.0   #=> NaN
        ```
    * `StandardError`
      * Los tipos de error más estándar son subclases de StandardError. Una cláusula de rescate sin una clase de excepción explícita rescatará todos los errores estándar (y solo esos). 
    * `ArgumentError`
      * Se genera cuando los argumentos son incorrectos y no hay una clase de excepción más específica. 

2. ¿Cuál es la diferencia entre `raise` y `throw`? ¿Para qué usarías una u otra opción?
    
    * `raise` lanza una excepción nueva o vuelve a lanzar la última excepción ocurrida. Se usa para manejar cualquier tipo de excepción que pueda ocurrir.
    * `throw` genera una excepción y siempre que se cumple, el control del programa pasa a la declaración catch. Se usa para manejar el flujo de control del programa, no para manejar excepciones.
    * `Terminating a single level of control flow, like a while loop, can be done with a simple return. Terminating many levels of control flow, like a nested loop, can be done with throw.`

3. ¿Para qué sirven `begin .. rescue .. else` y `ensure`? Pensá al menos 2 casos concretos en que usarías estas sentencias en un script Ruby.
    * Sirven para manejar excepciones. Con `begin` comienza el bloque que controlará una excepción que pueda ocurrir. `rescue` puede especificar una subclase de `Exception` que se compara con la excepción ocurrida, si es la misma, se ejecuta el código dentro del `rescue`, se puede usar múltiples veces. `else` se ejecuta si no se entró por ningún `rescue`, puede suceder que no haya ocurrido una excepción o que la excepción ocurida haya sido contemplada por ninguno de los `rescue`. `ensure` engloba un código que siempre se ejecutará, sin importar si hubo o no una excepción.

    ```rb
    #Caso 1
    f = File.open("testfile")
    begin
    # .. process
    rescue
    # .. handle error
    else
    puts "Congratulations-- no errors!"
    ensure
    f.close
    end

    #Caso 2
    def my_eval(string)
        begin
            eval string
        rescue SyntaxError, NameError => boom
            print "String doesn't compile: " + boom.message
        rescue StandardError => bang
            print "Error running script: " + bang.message
        end
    end
    ```

4. ¿Para qué sirve `retry`? ¿Cómo evitarías caer en un loop infinito al usarla?
    * Se utiliza para volver a ejecutar la sección de código que fue rescatada en un `rescue`. Si no se proporciona algún mecanismo para limitar los reintentos se generará un bucle infinito
    * Pondría un condicional verificando que la razón causante del problema se modifique y en caso de que no ocurra terminaría el programa

5. ¿Cuáles son las diferencias entre los siguientes métodos?
    ```ruby
    def opcion_1
        a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
        b = 3
        c = a.map do |x|
        x * b
        end
        puts c.inspect
        rescue
            0
    end
    def opcion_2
        c = begin
            a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
            b = 3
            a.map do |x|
                x * b
            end
            rescue
                0
            end
        puts c.inspect
    end
    def opcion_3
        a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
        b = 3
        c = a.map { |x| x * b } rescue 0
        puts c.inspect
    end
    def opcion_4
        a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
        b = 3
        c = a.map { |x| x * b rescue 0 }
        puts c.inspect
    end
    ```
    * `opcion_1`: retorna `0`
    * `opcion_2`: imprime `0` y retorna `nil`
    * `opcion_3`: imprime `0` y retorna `nil`
    * `opcion_4`: imprime `[3, 0, 9, 0, 15, 0, 21, 0, 27, 0]` y retorna `nil`

6. Suponé que tenés el siguiente script y se te pide que lo hagas _resiliente_ (tolerante a fallos), intentando siempre que se pueda recuperar la situación y volver a intentar la operación que falló. Realizá las modificaciones que consideres necesarias para lograr que el script sea más robusto.

    ```ruby
    # Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división de cada número por su entero inmediato anterior.
    # Como primer paso se pide al usuario que indique la cantidad de números que ingresará.
    cantidad = 0
    while cantidad < 15
        puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
        cantidad = gets.to_i
    end
    # Luego se almacenan los números
    numeros = 1.upto(cantidad).map do
        puts 'Ingrese un número'
        numero = gets.to_i
    end
    # Y finalmente se imprime cada número dividido por su número entero inmediato anterior
    resultado = numeros.map { |x| x / (x - 1) }
    puts 'El resultado es: %s' % resultado.join(', ')
    ```

    Solución:
    ```rb
    cantidad = 0
    while cantidad < 15
        puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
        cantidad = gets.to_i
    end
    begin
        # Luego se almacenan los números
        numeros = 1.upto(cantidad).map do
            puts 'Ingrese un número'
            numero = gets.to_i
        end
        # Y finalmente se imprime cada número dividido por su número entero inmediato anterior
        resultado = numeros.map { | x| x / (x - 1)  }
        puts 'El resultado es: %s' % resultado.join(', ')
        rescue ZeroDivisionError
            puts "El número ingresado no puede ser 1 porque generaría una división por 0"
            retry
    end
    ```

7. Partiendo del script del inciso anterior, implementá una nueva clase de excepción que se utilizará para indicar que la entrada del usuario no es un valor numérico entero válido. ¿De qué clase de la jerarquía de `Exception` heredaría?

    ```rb
    class OneInputError < RangeError
        def message
            "The number 1 was entered, which is not correct."
        end    
    end

    cantidad = 0
    while cantidad < 15
        puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
        cantidad = gets.to_i
    end

    begin
        # Luego se almacenan los números
        numeros = 1.upto(cantidad).map do
            puts 'Ingrese un número'
            numero = gets.to_i
            raise OneInputError if numero == 1
            numero
        end
        # Y finalmente se imprime cada número dividido por su número entero inmediato anterior
        rescue OneInputError => e
            puts e.message
            retry
    end    
    resultado = numeros.map { | x| x / (x - 1)  }
    puts 'El resultado es: %s' % resultado.join(', ')
    ```
8. Sea el siguiente código:
   ```ruby
   def fun3
     puts "Entrando a fun3"
     raise RuntimeError, "Excepción intencional"
     puts "Terminando fun3"
    rescue NoMethodError => e
        puts "Tratando excepción por falta de método"
    rescue RuntimeError => e
        puts "Tratando excepción provocada en tiempo de ejecución"
    rescue
        puts "Tratando una excepción cualquiera"
    ensure
        puts "Ejecutando ensure de fun3"
   end

   def fun2(x)
     puts "Entrando a fun2"
     fun3  
     a = 5 / x
     puts "Terminando fun2"
   end

   def fun1(x)
     puts "Entrando a fun1"
     fun2 x
    rescue  
        puts "Manejador de excepciones de fun1"
        raise
    ensure  
        puts "Ejecutando ensure de fun1"
   end

   begin
     x = 0
     begin
       fun1 x
     rescue Exception => e
       puts "Manejador de excepciones de Main"
       if x == 0
         puts "Corrección de x"
         x = 1
         retry
       end
     end
     puts "Salida"
   end
   ```
    1. Seguí el flujo de ejecución registrando la traza de impresiones que deja el programa, analizando por qué partes del código va pasando y justificando esos pasos.
        * Entrando a fun1
        * Entrando a fun2
        * Entrando a fun3
        * Tratando excepción provocada en tiempo de ejecución
        * Ejecutando ensure de fun3
        * Manejador de excepciones de fun1
        * Ejecutando ensure de fun1
        * Manejador de excepciones de Main
        * Corrección de x
        * Entrando a fun1
        * Entrando a fun2
        * Entrando a fun3
        * Tratando excepción provocada en tiempo de ejecución
        * Ejecutando ensure de fun3
        * Terminando fun2
        * Ejecutando ensure de fun1
        * Salida

    2. ¿Qué pasaría si se permuta, dentro de `fun3`, el manejador de excepciones para `RuntimeError` y el manejador de excepciones genérico (el que tiene el rescue vacío)?
       * Cuando se levante la excepción `RuntimeError` será manejada por el raise vacío que por defecto la maneja como una `StandardException`, el resto de la ejecución seguiría igual. 
    3. ¿El uso de `retry` afectaría el funcionamiento del programa si se mueve la línea `x = 0` dentro del segundo `begin` (inmediatamente antes de llamar a `fun1` con `x`)?
        * Si afectaría, entraría dentro del bloque de  código que volvería a ejecutarse, por lo tanto `x` volvería a valer `0`, lo que generaría un bucle infinito.
