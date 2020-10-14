# Práctica 5

## Rails

1. El framework está compuesto de diferentes librerías:

    * ActionMailer
    * ActionPack
    * ActionView
    * ActiveJob
    * ActiveRecord
    * ActiveModel
    * ActiveSupport
    * ActionCable
    * ActiveStorage
    * ActionText
    * ActionMailbox

   Para cada una de estas librerías, analizá y respondé las siguientes preguntas:

    1. ¿Qué funcion principal cumple?
    
    2. Citá algún ejemplo donde se te ocurra que podrías utilizarla.

    >**Action Mailer** le permite enviar correos electrónicos desde su aplicación utilizando clases y vistas de correo. https://guides.rubyonrails.org/action_mailer_basics.html

    >**Action Pack** es un framework para manejar y responder a solicitudes web. Proporciona mecanismos para el enrutamiento (mapeo de las URL de solicitud a las acciones), la definición de controladores que implementan acciones y la generación de respuestas mediante la representación de vistas, que son plantillas de varios formatos. En resumen, Action Pack proporciona las capas de vista y controlador en el paradigma MVC. https://api.rubyonrails.org/files/actionpack/README_rdoc.html

    >En Rails, las solicitudes web son manejadas por Action Controller y **Action View**. Por lo general, Action Controller se ocupa de comunicarse con la base de datos y realizar acciones CRUD cuando sea necesario. Action View es entonces responsable de compilar la respuesta. https://guides.rubyonrails.org/action_view_overview.html

    >**Active Job** es un framework para declarar trabajos y hacer que se ejecuten en una variedad de backends encolados. Estos trabajos pueden abarcar desde limpiezas programadas con regularidad hasta cargos de facturación y envíos por correo. Cualquier cosa que pueda dividirse en pequeñas unidades de trabajo y correr en paralelo
    https://guides.rubyonrails.org/active_job_basics.html

    >**Active Record** es la M en MVC, el modelo, que es la capa del sistema responsable de representar la lógica y los datos comerciales. ActiveRecord facilita la creación y el uso de objetos comerciales cuyos datos requieren almacenamiento persistente en una base de datos. Es una implementación del patrón ActiveRecord que en sí mismo es una descripción de un sistema de mapeo relacional de objetos.
    https://guides.rubyonrails.org/active_record_basics.html

    >**Active Model** es una biblioteca que contiene varios módulos utilizados en el desarrollo de clases que necesitan algunas características presentes en Active Record.
    https://guides.rubyonrails.org/active_model_basics.html

    >**Active Support** es una colección de clases de utilidad y extensiones de biblioteca estándar que resultaron útiles para el framework de Rails. Estas adiciones residen en este paquete para que se puedan cargar según sea necesario en proyectos de Ruby fuera de Rails.
    https://github.com/rails/rails/tree/master/activesupport

    >**Action Cable** integra a la perfección WebSockets con el resto de su aplicación Rails. Permite que las características en tiempo real se escriban en Ruby con el mismo estilo y forma que el resto de su aplicación Rails, sin dejar de ser eficiente y escalable. Es un full-stack completo que proporciona un marco de JavaScript del lado del cliente y un marco Ruby del lado del servidor. Tiene acceso a su modelo de dominio completo escrito con Active Record o su ORM de elección.
    https://guides.rubyonrails.org/action_cable_overview.html

    >Active Storage facilita la carga de archivos a un servicio de almacenamiento en la nube como Amazon S3, Google Cloud Storage o Microsoft Azure Storage y adjunta esos archivos a los objetos de Active Record. Viene con un servicio basado en disco local para el desarrollo y las pruebas y admite la duplicación de archivos a servicios subordinados para copias de seguridad y migraciones.
    Con Active Storage, una aplicación puede transformar las cargas de imágenes con ImageMagick, generar representaciones de imágenes de cargas que no son imágenes, como PDF y videos, y extraer metadatos de archivos arbitrarios.
    https://edgeguides.rubyonrails.org/active_storage_overview.html
    
    >**Action Text** trae contenido de texto enriquecido y edición a Rails. Incluye el editor Trix que maneja todo, desde el formateo hasta los enlaces, las citas, las listas, las imágenes y galerías incrustadas. El contenido de texto enriquecido generado por el editor Trix se guarda en su propio modelo RichText que está asociado con cualquier modelo de Active Record existente en la aplicación. Todas las imágenes incrustadas (u otros archivos adjuntos) se almacenan automáticamente utilizando Active Storage y se asocian con el modelo RichText incluido.
    https://edgeguides.rubyonrails.org/action_text_overview.html
    
    >**Action Mailbox** enruta los correos electrónicos entrantes a buzones de correo tipo controlador para procesarlos en Rails. Se envía con ingresos para Mailgun, Mandrill, Postmark y SendGrid. También puede manejar correos entrantes directamente a través de los ingresos incorporados de Exim, Postfix y Qmail.
    Los correos electrónicos entrantes se convierten en registros de InboundEmail usando Active Record y cuentan con seguimiento del ciclo de vida, almacenamiento del correo electrónico original en el almacenamiento en la nube a través de Active Storage y manejo responsable de datos con incineración predeterminada.
    Estos correos electrónicos entrantes se enrutan de forma asincrónica mediante Active Job a uno o varios buzones de correo dedicados, que pueden interactuar directamente con el resto de su modelo de dominio.
    https://guides.rubyonrails.org/action_mailbox_basics.html

2. Investigá cómo se crea una aplicación Rails nueva y enumerá los pasos básicos para tener la aplicación funcionando con una base de datos SQLite.
   >https://guides.rubyonrails.org/v2.3/getting_started.html

    Al crear una nuevo proyecto Rails por defecto usará SQLite, al menos que se especifique otra opción como PostgreSQL o MySQL. Esta puede modificarse a futuro. Sino se encuentra instalada la misma puede instalarse con `gem install sqlite3-ruby`.
    Para crear la nueva app Rails con SQLite alcanza con mandar `rails new app_name`

3. Siguiendo los pasos que enumeraste en el punto anterior, creá una nueva aplicación Rails llamada `practica_cinco` en la cual vas a realizar las pruebas para los ejercicios de esta práctica.

4. ¿Qué es un **ambiente** (`environment`) en una aplicación Rails? ¿Qué sentido considerás que tiene usar diferentes ambientes en tu aplicación? ¿Cuál es el ambiente por defecto?
   >http://teotti.com/use-of-rails-environments/

5. Sobre la configuración de Rails:

    1. ¿De qué forma podés especificar parámetros de configuración del framework en una app Rails?
        >https://guides.rubyonrails.org/configuring.html
    2. ¿Cuáles son los archivos principales? Intentá relacionar este concepto con los ambientes que antes viste.
    3. Modificá el `locale` por defecto de tu aplicación para que sea español.
        Se agrega la línea un archivo `es.yml` en _config/locales_ y se agrega la línea `config.i18n.default_locale = :es` en _config/application.rb_
    4. Modificá la zona horaria de tu aplicación para que sea la de la Argentina.
        Se agrega la línea `config.time_zone = 'Buenos Aires'` en _config/application.rb_ 

6. Sobre los *initializers*:

    1. ¿Qué son y para qué se utilizan?
        >Un inicializador es cualquier archivo de código ruby almacenado en /config/initializers en su aplicación. Puede usar inicializadores para mantener los ajustes de configuración que deben realizarse después de que se carguen todos los frameworks y plugins.
        https://guides.rubyonrails.org/v2.3/configuring.html#using-initializers
    2. ¿En qué momento de la vida de la aplicación se ejecutan?
        * Después de cargar el framework más las gemas y plugins en su aplicación, Rails pasa a cargar los inicializadores.
    3. Si tu app está corriendo y modificás algún initializer, ¿los cambios se reflejan automáticamente? ¿Por qué?
        * No, hay que reiniciar el servidor. Porque los inicializadores se cargan ni bien se levanta la app, por lo cual para que se vuelvan a ejecutar, hay que volver a levantar la app. Además cada inicializador indica que hay que reiniciar el servidor si es modificado.
    4. Creá un initializer en tu aplicación que imprima en pantalla el string `"Booting practica_cinco"`.  
       ¿En qué momento se visualiza este mensaje?

       * Al ejecutar el comando `rails server`:
        ```BASH
        => Booting Puma
        => Rails 6.0.3.4 application starting in development 
        => Run `rails server --help` for more startup options
        Booting practica_cinco
        Puma starting in single mode...
        * Version 4.3.6 (ruby 2.7.1-p83), codename: Mysterious Traveller
        * Min threads: 5, max threads: 5
        * Environment: development
        * Listening on tcp://127.0.0.1:3000
        * Listening on tcp://[::1]:3000
        Use Ctrl-C to stop
        ```

7. Sobre los *generators*:

    1. ¿Qué son? ¿Qué beneficios imaginás que trae su uso?
        * Son scripts que se utilizan para generar distantas coasas para nuestra app, como controllers, models, plugins, etc. El mayor beneficio es automatizar la creación de múltiples archivos para realizar alguna nueva funcionalidad. 
        * Lo mismo que hace el generador se puede hacer a mano creando archivo por archivo.
    2. ¿Con qué comando podés consultar todos los generators disponibles en tu app Rails?
        * `rails generate`
    3. Utilizando el generator adecuado, creá un controller llamado `PoliteController` que tenga una acción `salute` que responda con un saludo aleatorio de entre un arreglo de 5 diferentes, como por ejemplo *"Good day sir/ma'am."*.

8. Sobre *routing*:

    1. ¿Dónde se definen las rutas de la app Rails?
        * _config/routes.rb_
    2. ¿De qué formas se pueden definir las rutas?
        >https://guides.rubyonrails.org/routing.html
    3. ¿Qué ruta(s) agregó el generator que usaste antes?
        * `get 'polite/salute'`
    4. ¿Con qué comando podés consultar todas las rutas definidas en tu app Rails?
        * `rails routes`

## ActiveSupport (AS)

1. ¿De qué forma extiende AS las clases básicas de Ruby para incorporar nuevos métodos?
    >https://guides.rubyonrails.org/active_support_core_extensions.html

2. Investigá qué métodos agrega AS a las siguientes clases:

    1. `String`
    2. `Array`
    3. `Hash`
    4. `Date`
    5. `Numeric`
    
    >https://guides.rubyonrails.org/active_support_core_extensions.html

3. ¿Qué hacen y en qué clase define AS los siguientes métodos?

    1. `blank?`
    2. `present?`
    3. `presence`
    4. `try`
    5. `in?`
    6. `alias_method_chain`
    7. `delegate`
    8. `pluralize`
    9. `singularize`
    10. `camelize`
    11. `underscore`
    12. `classify`
    13. `constantize`
    14. `humanize`
    15. `sum`
    
    >https://guides.rubyonrails.org/active_support_core_extensions.html

4. ¿De qué manera se le puede *enseñar* a AS cómo pasar de singular a plural (o viceversa) los sustantivos que usamos en nuestro código?

   > Tip: Mirá el archivo config/initializers/inflections.rb

   >https://guides.rubyonrails.org/active_support_core_extensions.html#inflections

5. Modificá la configuración de la aplicación Rails para que *aprenda* a pluralizar correctamente en español todas las palabras que terminen en `l`, `n` y `r`.

   > Tip: el uso de expresiones regulares simples ayuda. :)
   
   **Sin hacer**

## ActiveRecord (AR)

1. ¿Cómo se define un modelo con ActiveRecord? ¿Qué requisitos tienen que cumplir las clases para utilizar la lógica de abstracción del acceso a la base de datos que esta librería ofrece?

    >https://guides.rubyonrails.org/active_record_basics.html#creating-active-record-models

2. ¿De qué forma *sabe* ActiveRecord qué campos tiene un modelo?

    >https://guides.rubyonrails.org/active_record_basics.html#creating-active-record-models

3. ¿Qué metodos (*getters* y *setters*) genera AR para los campos escalares básicos (`integer`, `string`, `text`, `boolean`, `float`)?

    * Se accede con el nombre del campo, por ejemplo: Producto.nombre, Producto.precio
    * Se escribe: Producto.nombre = 'Un producto', Producto.precio = 100.99

4. ¿Qué convención define AR para inferir los nombres de las tablas a partir de las clases Ruby? Citá ejemplos.

    >https://guides.rubyonrails.org/active_record_basics.html#naming-conventions

5. Sobre las migraciones de AR:
    1. ¿Qué son y para qué sirven?

        >https://guides.rubyonrails.org/active_record_migrations.html

    2. ¿Cómo se generan?

        >https://guides.rubyonrails.org/active_record_migrations.html

    3. ¿Dónde se guardan en el proyecto?
    
        >https://guides.rubyonrails.org/active_record_migrations.html

    4. ¿Qué organización tienen sus nombres de archivo?
    
        >https://guides.rubyonrails.org/active_record_migrations.html
    
    5. Generá una migración que cree la tabla `offices` con los siguientes atributos:
        * `name`: `string` de `255` caracteres, no puede ser nulo.
        * `phone_number`: `string` de `30` caracteres, no puede ser nulo.
        * `address`: `text`.
        * `available`: `boolean`, por defecto `false`, no puede ser nulo.

        `rails g migration CreateOffice name:string phone_number:string adress:text available:boolean`
        
6. Creá el modelo `Office` para la tabla `offices` que creaste antes, e implementale el método `#to_s`.

7. Utilizando migraciones, creá la tabla y el modelo para la clase `Employee`, con la siguiente estructura:
    * `name`: `string` de `150` caracteres, no puede ser nulo.
    * `e_number`: `integer`, no puede ser nulo, debe ser único.
    * `office_id`: `integer`, foreign key hacia `offices`.

8. Agregá una asociación entre `Employee` y `Office` acorde a la columna `office_id` que posee la tabla `employees`.
    1. ¿Qué tipo de asociación declaraste en la clase `Employee`?
        * *belongs_to*
    2. ¿Y en la clase `Office`?
        * *has_many*
    3. ¿Qué métodos generó AR en el modelo a partir de esto?
        
        `Office.methods - ApplicationRecord.methods`
        ```rb
        => [:before_remove_for_employees, :before_remove_for_employees?, :before_remove_for_employees=, :after_remove_for_employees, :after_remove_for_employees?, :after_remove_for_employees=, :before_add_for_employees, :before_add_for_employees?, :before_add_for_employees=, :after_add_for_employees, :after_add_for_employees?, :after_add_for_employees=]
        ```
    5. Modificá el mapeo de rutas de tu aplicación Rails para que al acceder a `/` se vaya al controller definido antes (`polite#salute`).

        `get '/', action: :salute, controller: 'polite'`

9. Sobre *scopes*:
    1. ¿Qué son los scopes de AR? ¿Para qué los utilizarías?
        
        >Para realizar consultas SQL
        https://guides.rubyonrails.org/active_record_querying.html#scopes
  
    2. Investigá qué diferencia principal existe entre un método estático y un scope.

        * La notación.
         
        ```rb
        scope :published, -> { where(published: true) }

        def self.published
            where(published: true)
        end
        ```

    3. Agregá los siguientes scopes al modelo `Employee`:
        * `vacant`: Filtra los empleados para quedarse únicamente con aquellos que no tengan una oficina asignada (*asociada*).
        * `occupied`: Complemento del anterior, devuelve los empleados que sí tengan una oficina asignada.
    
    4. Agregá este scope al modelo `Office`:
        * `empty`: Devuelve las oficinas que están disponibles (`available = true`) que no tienen empleados asignados.

10. Sobre *scaffold controllers*:
    1. ¿Qué son? ¿Qué operaciones proveen sobre un modelo?

        >https://guides.rubyonrails.org/v3.2.18/getting_started.html#getting-up-and-running-quickly-with-scaffolding

    2. ¿Con qué comando se generan?

        `rails g scaffold`

        >https://guides.rubyonrails.org/v3.2.18/getting_started.html#creating-a-resource

    3. Utilizando el generator anterior, generá un controlador de scaffold para el modelo `Office` y otro para el modelo `Employee`.
     
    4. ¿Qué rutas agregó este generator?
     
    5. Analizá el código que se te generó para los controllers y para las vistas, y luego modificalo para que no permita el borrado de ninguno de los elementos. ¿Qué cambios debés hacer para que las vistas no muestren la opción, el controller no tenga la acción `destroy` y las rutas de borrado dejen de existir en la aplicación?
