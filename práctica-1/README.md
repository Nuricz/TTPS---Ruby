# Práctica 1

## Repaso de git

### Ejercicios

1. Ejecutá `git` o `git help` en la línea de comandos y mirá los subcomandos que tenés disponibles.

```
Estos son comandos comunes de Git usados en varias situaciones:

comienza un área de trabajo (ver también: git help tutorial)
   clone             Clona un repositorio dentro de un      nuevo directorio
   init              Crea un repositorio de Git vacío o reinicia el que ya existe

trabaja en los cambios actuales (ver también: git help everyday)
   add               Agrega contenido de carpetas al índice
   mv                Mueve o cambia el nombre a archivos, directorios o enlaces simbólicos
   restore           Restaurar archivos de árboles de trabajo
   rm                Borra archivos del árbol de trabajo y del índice
   sparse-checkout   Inicializa y modifica el sparse-checkout

examina el historial y el estado (ver también: git help revisions)
   bisect            Use la búsqueda binaria para encontrar el commit que introdujo el bug
   diff              Muestra los cambios entre commits, commit y árbol de trabajo, etc
   grep              Imprime las líneas que concuerdan con el patron
   log               Muestra los logs de los commits
   show              Muestra varios tipos de objetos
   status            Muestra el estado del árbol de trabajo

crece, marca y ajusta tu historial común
   branch            Lista, crea, o borra ramas
   commit            Graba los cambios en tu repositorio
   merge             Junta dos o más historiales de desarrollo juntos
   rebase            Vuelve a aplicar commits en la punta de otra rama
   reset             Reinicia el HEAD actual a un estado especifico
   switch            Cambiar branches
   tag               Crea, lista, borra o verifica un tag de objeto firmado con GPG

colabora (mira también: git help workflows)
   fetch             Descarga objetos y referencias de otro repositorio
   pull              Realiza un fetch e integra con otro repositorio o rama local
   push              Actualiza referencias remotas junto con sus objetos asociados

'git help -a' y 'git help -g' listan los subcomandos disponibles y algunas
guías de concepto. Consulte 'git help <command>' o 'git help <concepto>'
para leer sobre un subcomando o concepto específico.
Mira 'git help git' para una vista general del sistema.
```

1. Ejecutá el comando `git help help`. ¿Cuál fue el resultado?

    Muestra la man page de git. Lo mismo que ejecutar `man git`

3. Utilizá el subcomando `help` para conocer qué opción se puede pasar al subcomando `add` para que ignore errores al agregar archivos.

```
--ignore-errors
           If some files could not be added because of errors indexing them,
           do not abort the operation, but continue adding the others. The
           command shall still exit with non-zero status. The configuration
           variable add.ignoreErrors can be set to true to make this the
           default behaviour.
```

4. ¿Cuáles son los estados posibles en Git para un archivo? ¿Qué significa cada uno?

    untraked files/archivos sin seguimiento: estos son archivos que no están siendo rastreados, es decir, git no sabe de la existencia de estos archivos. Puedes cambiar el estado de estos archivos a "tracked – staged" usando el comando "add" de git  

    unmodified/sin modificar: estos son los archivos que no se han modificado desde el último commit. Todavía se incluirán en el próxima commit, pero permanecerán como están.

    modified/modificado: estos son archivos que se han modificado desde el último commit (probablemente los modificamos como parte de las correcciones de errores). Estos archivos se incluirán en el próximo commit, pero se incluirán con sus respectivas modificaciones.

    staged: estos son archivos que no estaban presentes en el último commit (por ejemplo, archivos recién creados) o son archivos "modificados" que le decimos a git que incluya en el siguiente commit. Los archivos se agregan a staging mediante el comando "add" de git.  

![Gráfico que muestra el ciclo de vida de los archivos usando git](https://git-scm.com/book/en/v2/images/lifecycle.png)

5. Cloná el repositorio de materiales de la materia: `https://github.com/TTPS-ruby/capacitacion-ruby-ttps.git`. Una vez finalizado, ¿cuál es el hash del último commit que hay en el repositorio que clonaste?

`commit 4867a719bf588afa8a5dd85c3a660731b1d4065d`

6. ¿Para qué se utilizan los siguientes subcomandos?

* init
  
    Crea un repositorio vacío o re-inicializa uno ya existente

* status

    Muestra el estado del árbol de trabajo

* log

    Muestra el registro de commits

* fetch

    Descarga objetos y referencias de otro repositorio

* merge
  
    Une 2 o más historiales de desarrollo, permite tomar las líneas independientes de desarrollo creadas por `git branch` e integrarlas en una sola rama

* pull

    Incorpora cambios de un repositorio remoto en la rama actual

* commit

    Crea un nuevo commit que contiene el contenido actual del índice (archivos agregados previamente con el comando `git add`) y un mensaje de registro dado que describe los cambios

* stash

    Utilice `git stash` cuando desee registrar el estado actual del directorio de trabajo y el índice, pero desea volver a un directorio de trabajo limpio

* push
  
    Actualiza referencias remotas usando referencias locales, mientras envía los objetos necesarios para completar las referencias dadas

* rm

    Elimina archivos del árbol de trabajo y del índice

* checkout

    Cambiar de rama o restaurar archivos de árbol de trabajo

7. Creá un archivo de texto en el repositorio que clonaste en el ejercicio 5 y verificá el estado de tu espacio de trabajo con el subcomando `status`. ¿En qué estado está el archivo que agregaste?

    Está untracked

8. Utilizá el subcomando `log` para ver los commits que se han hecho en el repositorio, tomá cualquiera de ellos y copiá su hash (por ejemplo, `800dcba6c8bb2881d90dd39c285a81eabee5effa`), y luego utilizá el subcomando `checkout` para viajar en el tiempo (apuntar tu copia local) a ese commit. ¿Qué commits muestra ahora `git log`? ¿Qué ocurrió con los commits que no aparecen? ¿Qué dice el subcomando `status`?

    1. Muestra los commits desde el cual viajé hacia atrás.
    
    2. No se van a mostrar hasta que vuelva al "presente".
    
    3. Aparece: HEAD desacoplada en c71d75d

9. Volvé al último commit de la rama principal (master) usando nuevamente el subcomando checkout. Corroborá que efectivamente haya ocurrido esto.

    Listo

10. Creá un directorio vacío en el raiz del proyecto clonado. ¿En qué estado aparece en el git status? ¿Por qué?

    No aparece, porque git solo reconoce archivos, no directorios vacíos. Esto se puede solucionar creando dentro del repositorio un archivo `.gitkeep`, en síntesis, te permite commitear un directorio

11. Creá un archivo vacío dentro del directorio que creaste en el ejercicio anterior y volvé a ejecutar el subcomando `status`. ¿Qué ocurre ahora? ¿Por qué?

    Indica que hay archivos sin seguimiento que deben ser agregados con el comando `add`. Esto sucede porque ahora si git reconoce el directorio al haber un archivo dentro

12. Utilizá el subcomando `clean` para eliminar los archivos no versionados (untracked) y luego ejecutá `git status`. ¿Qué información muestra ahora?

    Quedó como antes de haber creado el directorio, o sea, con ningún archivo untracked

13. Actualizá el contenido de tu copia local mediante el subcomando `pull`.

    Lesto - Ya está actualizado - No hubo cambios

## Ruby: sintaxis y tipos básicos
### Ejercicios

1. Investigá y probá en un intérprete de Ruby cómo crear objetos de los siguientes tipos básicos usando literales y
   usando el constructor `new` (cuando sea posible):
   * Arreglo (`Array`)
   * Diccionario o _hash_ (`Hash`)
   * String (`String`)
   * Símbolo (`Symbol`)

    ```rb
    array = Array.new(10)
    array = ["a", "b", "c"]
    ```
    ```rb
    hash = Hash.new
    hash = {one: "one", two: "two"}
    ```
    ```rb
    string = String.new
    string = "Hola mundo!"
    ```
    ```rb
    symbol = Symbol.new #Esto es incorrecto, da error porque no se puede instanciar a Symbol
    :symbol #Esto es un símbolo
    ```
2. ¿Qué devuelve la siguiente comparación? ¿Por qué?

   ```ruby
   'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id
   ```

   Devuelve falso porque cada string, a pesar de que su contenido sea el mismo, son instancias **distintas** de la clase String

3. Escribí una función llamada `reemplazar` que reciba un `String` y que busque y reemplace en el mismo cualquier
   ocurrencia de `{` por `do\n` y cualquier ocurrencia de `}` por `\nend`, de modo que convierta los bloques escritos
   con llaves por bloques multilínea con `do` y `end`. Por ejemplo:

   ```ruby
   reemplazar("3.times { |i| puts i }")
   # => "3.times do\n |i| puts i \nend"
   ```

    Solución:
    ```rb
    def reemplazar(string)
        string.gsub(/[{}]/, '{' => "do\n", '}' => "\nend") #=> "Hdo\\nlldo\\no \\nendwdo\\no\\nendrd!"
    end
    ```

4. Escribí una función que convierta a palabras la hora actual, dividiendo en los siguientes rangos los minutos:
   * Si el minuto está entre 0 y 10, debe decir "en punto",
   * si el minuto está entre 11 y 20, debe decir "y cuarto",
   * si el minuto está entre 21 y 34, debe decir "y media",
   * si el minuto está entre 35 y 44, debe decir "menos veinticinco" (de la hora siguiente),
   * si el minuto está entre 45 y 55, debe decir "menos cuarto" (de la hora siguiente),
   * y si el minuto está entre 56 y 59, debe decir "casi las" (y la hora siguiente)

```rb
time = Time.now.to_s[11..18] #Por el formato       que retorna Time.now, de esta forma me quedo con hh:mm:ss
minutes = time[3..4]
hour = time[0..1] 
case minutes.to_i
when 0..10
    "En punto"
when 11..20
    "Y cuarto"
when 21..34
    "Y media"
when 35..44
    "Menos veinticinco"
when 45..55
    "Menos cuarto"
when 56..59
    "Casi las #{hour.to_i + 1}"
end
```

   Esta es una forma muy sucia de resolver el ejercicio pero efectiva, el código funciona. Si revisamos la documentación de la clase Time de Ruby, podemos ver que existen métodos `hour, min, sec` para obtener hora, minutos y segundos respectivamente. De esta forma el código quedaría: 

```rb
case Time.now.min
when 0..10
    "En punto"
when 11..20
    "Y cuarto"
when 21..34
    "Y media"
when 35..44
    "Menos veinticinco"
when 45..55
    "Menos cuarto"
when 56..59
    "Casi las #{Time.hour + 1}"
end
```

5. Escribí una función llamada `contar` que reciba como parámetro dos `string` y que retorne la cantidad de veces que
   aparece el segundo `string` en el primero, sin importar mayúsculas y minúsculas. Por ejemplo:

   ```ruby
   contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")
   # => 5
   ```

   Solución con regex:

   ```rb
   #Al uso de (?=word) (word puede ser cualquier cosa) se le llama "Positive lookahead" permite encontrar un substring word sin que ese substring forme parte de la coincidencia
   def contar(str, str_search)
        str.scan(/(?=#{str_search})/i).count
   end
   ```
   Para más información:
   >https://www.regular-expressions.info/lookaround.html

6. Modificá la función anterior para que sólo considere como aparición del segundo `string` cuando se trate de palabras
   completas. Por ejemplo:

   ```ruby
   contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")
   # => 4
   ```

    Solución:

   ```rb
   def contar(str, str_search)
        str.downcase.split.count(str_search)   
   end
   ```

   Solución con regex:

   ```rb
   #\bword\b es una expresion regular que permite buscar word al estar entre "\b"
   def contar_palabras(str, str_search)
        str.scan(/\b#{str.search}\b/i).size
   end
   ```
   Para más información:
   >https://www.regular-expressions.info/wordboundaries.html
   
7. Dada una cadena cualquiera, y utilizando los métodos que provee la clase `String`, realizá las siguientes
   operaciones sobre el `string`:
   * Imprimilo con sus caracteres en orden inverso.

    ```rb
    "Nuria".reverse #=> "airuN"
    ```

   * Eliminá los espacios en blanco que contenga.
   
    ```rb
    "Había una vez".delete(' ') #=> "Habíaunavez"
    ```
   
   * Convertí cada uno de sus caracteres por su correspondiente valor ASCII.
   
    ```rb
    "string".each_byte do |c|
        puts c
    end
    #=> 115 116 114 105 110 103
    ```
   
   * Cambiá las vocales por números (`a` por `4`, `e` por `3`, `i` por `1`, `o` por `0`, `u` por `6`).

    ```rb
    string = "murcielago"
    string.gsub(/[aeiou]/, 'a' => '4', 'e' => '3', 'i' => '1', 'o' => '0', 'u' => '6')
    string #=> "m6rc13l4g0"
    ```

8. ¿Qué hace el siguiente código?

   ```ruby
   [:upcase, :downcase, :capitalize, :swapcase].map do |meth|
     "TTPS Ruby".send(meth)
   end
   ```
   El método `send` de la clase `Object` invoca al método identificado por un símbolo pasándole los parámetros especificados.
   En este caso el `string` 'TTPS Ruby' invoca 4 métodos en forma de símbolo guardados en un arreglo. 
   
   El resultado es:
   ```rb
   ["TTPS RUBY", "ttps ruby", "Ttps ruby", "ttps rUBY"]
   ```

9. Escribí una función que dado un arreglo que contenga varios `string` cualesquiera, retorne un nuevo arreglo donde
   cada elemento es la longitud del `string` que se encuentra en la misma posición del arreglo recibido como parámetro.
   Por ejemplo:

    ```ruby
    longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2019'])
    # => [4, 6, 4, 12]
    ```

    Solución:
    ```rb
    def longitud(array_str)
        array_length = []
        array_str.each do |str|
            array_length.push(str.length)
        end
        array_length
    end
    ```