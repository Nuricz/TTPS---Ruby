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

