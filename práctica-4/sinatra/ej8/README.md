## Instrucciones

Se ejecuta con
`ruby app.rb`

El manejo del juego está en el enunciado del ejercicio en la práctica. El problema no es "a prueba de bobos", con esto quiero decir que no contemplo que sucede si se envía reiteradas veces la misma letra o algo que no sea una sola letra o cualquier caso que no sea normal.

Las pruebas las realicé con postman 
>https://www.postman.com

Para saber el id de la palabra en cuestión veo que me dice la terminal en la cual ejecuté la aplicación, para hacer los `put request`.

La app muestra un `_` por cada letra, cada letra adivinada aparecerá en la palabra, si una palabra contiene una letra repetida solo alcanza con mandarla una vez.

Como en un ahorcado a papel hay solo 6 intentos.

Se gana al adivinar todas las letras.

Se pierde si se acaban los intentos.

Para divertirse (seguro más que yo probando la app) pueden cambiar las palabras definitas en `ahorcado.rb` y/o agregar más.

La base de resolución de este ejercicio estuvo inspirada en la resolución de 
>https://github.com/pedrobrost/Informatica-UNLP/blob/master/Ruby/practica4/sinatra/punto8/

con algunas modificaciones para que sea más ameno probarlo/jugarlo.

Si no se entiende como jugarlo me pueden mandar un mensaje y me encargo de hacer unas instrucciones más acordes (?)