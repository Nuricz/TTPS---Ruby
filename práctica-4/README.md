# Práctica 4

## Gemas y Bundler

1. ¿Qué es una gema? ¿Para qué sirve? ¿Qué estructura tienen?
   
    >https://guides.rubygems.org/what-is-a-gem/
   
2. ¿Cuáles son las principales diferencias entre el comando `gem` y Bundler? ¿Hacen lo mismo?

    >https://stackoverflow.com/questions/6162047/difference-between-bundle-and-gem-install

3. ¿Dónde instalan las gemas los comandos `gem` y `bundle`?
   
   >https://stackoverflow.com/questions/6162047/difference-between-bundle-and-gem-install

4. ¿Para qué sirve el comando `gem server`? ¿Qué información podés obtener al usarlo?
   
   >https://guides.rubygems.org/run-your-own-gem-server/

5. Investigá un poco sobre *Semantic Versioning* (o *SemVer*). ¿Qué finalidad tiene? ¿Cómo se compone una versión? ¿Ante qué situaciones debería cambiarse cada una de sus partes?
   
   >https://semver.org/

6. Creá un proyecto para probar el uso de Bundler:
    1. Inicializá un proyecto nuevo en un directorio vacío con el comando `bundle init`
    2. Modificá el archivo `Gemfile` del proyecto y agregá la gema `colorputs`
    3. Creá el archivo `prueba.rb` y agregale el siguiente contenido:

        ```ruby
        require 'colorputs'
        puts "Hola!", :rainbow_bl
        ```
    4. Ejecutá el archivo anterior de las siguientes maneras:
        - `ruby prueba.rb`
        - `bundle exec ruby prueba.rb`
    
    5. Ahora utilizá el comando `bundle install` para instalar las dependencias del proyecto
    
    6. Volvé a ejecutar el archivo de las dos maneras enunciadas en el paso **4**.
    
    7. Creá un nuevo archivo `prueba_dos.rb` con el siguiente contenido:
    
        ```ruby
        Bundler.require
        puts "Chau!", :red
        ```
    
    8. Ahora ejecutá este nuevo archivo:
        - `ruby prueba_dos.rb`
        - `bundle exec ruby prueba_dos.rb`

            El primer caso imprime
            `uninitialized constant Bundler (NameError)`

            El segundo imprime 'Chau!' en rojo

7. Utilizando el proyecto creado en el punto anterior como referencia, contestá las siguientes preguntas:
    1. ¿Qué finalidad tiene el archivo `Gemfile`?
        * Es utilizado por `Bundler` para denifir las dependencias de nuestra aplicación
    2. ¿Para qué sirve la directiva `source` del  `Gemfile`? ¿Cuántas pueden haber en un mismo archivo?
        * Sirve para indicar en donde buscar las gemas que se instalarán
        > https://bundler.io/gemfile.html
    3. Acorde a cómo agregaste la gema `colorputs`, ¿qué  versión se instaló de la misma? Si mañana se publicara  la versión `7.3.2`, ¿esta se instalaría en tu proyecto? ¿Por qué? ¿Cómo podrías limitar esto y hacer que sólo se instalen *releases* de la gema en las que no cambie la *versión mayor* de la misma?
        * Se instaló la versión 0.2.3. (la última disponible)
        * Sinceramente no creo que ocurra porque esa gema no se toca desde el 2013, pero nunca se sabe.
        * Por como son las preguntas que siguen asumo que se actualiza solo.
        * Se podría evitar indicando la versión de esta forma `gem 'colorputs', '~>0.2'`
    4. ¿Qué ocurrió la primera vez que ejecutaste `prueba.rb`? ¿Por qué?
        * Se ejecutó correctamente
    5. ¿Qué cambió al ejecutar `bundle install`?
        * `bundle install` instaló la gema en el sistema, previamente especificada en el archivo `Gemfile`
    6. ¿Qué diferencia hay entre `bundle install` y  `bundle update`?

        `$ bundler help install`
        ```
        Description:

        Install will install all of the gems in the current bundle, making them available
        for use. In a freshly checked out repository, this command will give you the
        same gem versions as the last person who updated the Gemfile and ran `bundle
        update`.

        Passing [DIR] to install (e.g. vendor) will cause the unpacked gems to be installed
        into the [DIR] directory rather than into system gems.

        If the bundle has already been installed, bundler will tell you so and then
        exit.
        ```
        `$ bundler help update`
        ```
        Description:
        
        Update will install the newest versions of the gems listed in the Gemfile. Use
        update when you have changed the Gemfile, or if you want to get the newest
        possible versions of the gems in the bundle.
        ```
    7. ¿Qué ocurrió al ejecutar `prueba_dos.rb` de las  distintas formas enunciadas? ¿Por qué? ¿Cómo  modificarías el archivo `prueba_dos.rb` para que funcione correctamente?
        * Al ejecutarlo con `ruby` dió el siguiente error: `uninitialized constant Bundler (NameError)` esto debido a (como indica el error) que no se encuentra la constante `Bundler`
        * Con `bundle exec ruby prueba_2.rb` anduvo correctamente debido a que `bundle exec` ejecuta el script en el contexto del bundle actual definido por `Gemfile`
        * Para poder ejecutar `prueba_dos.rb` con `ruby` alcanza con agregar en el archivo la siquiente línea: `require 'bundler/setup'`

8. Desarrollá una gema (llamada `MethodCounter`, por ejemplo) que empaquete toda la funcionalidad implementada en el ejercicio 11 de la práctica 2 (el módulo `Countable`).
   La forma de usarla sería algo similar a esto:

   ```ruby
    require 'method_counter'
    class MiClase
        include MethodCounter::Countable
        def hola
            puts "Hola"
        end
        def chau
            puts "Chau"
        end
        count_invocations_of :hola
        count_invocations_of :chau
    end
    ```
    ```rb
    #Prueba
    m = MiClase.new
    m.invoked? :hola 
    # => false
    m.hola
    # Hola => nil
    m.invoked? :hola 
    # true
    m.invoked :hola 
    # 1
    ```
    La gema está en la carpeta ../ej8
    Para instalarla:
    ```bash
    $ gem build method_counter.gemspec
    $ gem install method_counter
    ```
    