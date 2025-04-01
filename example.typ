#import "conf.typ": conf, guia, pronombre
#let mostrar_guias = true
#show: conf.with(
  titulo: "Practicante Desarrollador Web - Evol Services S.A.",
  autor: (nombre: "Sergio Daniel Ignacio Romero Véliz", pronombre: pronombre.el),
  supervisor: (nombre: "Edison Delgado", pronombre: pronombre.el),
  espaciado_titulo: 2fr,
  correo: "sergioromeroiv@gmail.com",
  telefono: "+56 9 5681 4697",
  empresa: "Evol Services S.A.",
  periodo: "Enero - Febrero 2025",
  correo-supervisor: "edison.delgado@evol.energy",
  telefono-supervisor: "+56 9 6593 8746"
)

#guia(visible: mostrar_guias)[Se debe quitar todas las guías (estas cajas grises) antes de entregar el documento.

Para ello, se debe cambiar el valor de la variable `mostrar_guias` a `false` en la segunda línea del archivo.

Además, hay que reemplazar los datos de la portada en los parámetros de la función `conf` en la línea 3 del archivo.

Los parámetros que acepta la función `conf` son:
- título: El título de la práctica.
- autor: Un diccionario con campos `nombre` y `pronombre`. Para los pronombres, importar el diccionario `pronombre` desde `conf.typ`. Los valores disponibles son `pronombre.el`, `pronombre.ella` y `pronombre.elle`.
- practica: 1 o 2 dependiendo de si es la primera o segunda práctica profesional.
- codigo: CC4901 para práctica I, CC5901 para práctica II.
- ingenieria: Nombre de la carrera.
- correo: Correo de autor.
- telefono: Número de teléfono del autor.
- periodo: Período en que se realizó la práctica. Por ejemplo: 'Diciembre 2022 - Enero 2023'.
- empresa: Nombre de la empresa.
- supervisor: Información del supervisor. Es un diccionario con campos `nombre` y `pronombre`.
- correo-supervisor: Correo de supervisor.
- telefono-supervisor: Número de teléfono del supervisor.
- fecha: Fecha de entrega. Si no se especifica, se usa la fecha actual.
- espaciado_titulo: Espaciado extra antes del título y al rededor de autor. Por defecto es `1fr`. Se puede usar `2fr` para un espaciado doble, `3fr` para un espaciado triple, etc.

Como aproximación, se espera que el informe tenga de 8 a 14 páginas.
En las guías de cada sección se mostrará la información de las páginas sugeridas. No olvidar que es una sugerencia.

Se recomienda que el reporte de actividades se redacte en tercera persona.
]

= Resumen

#guia(visible: mostrar_guias)[En el resumen deben enunciarse los temas principales trabajados, problema, solución, reflexión y conclusiones sobre la realización de la práctica.
El resumen debe contener lo esencial de cada sección del informe.

(extensión sugerida: 0.5 páginas)]

= Introducción

#guia(visible: mostrar_guias)[Parte inicial de un texto en donde se informa acerca del contenido del informe.
- Se contextualiza al lector con los antecedentes generales acerca del trabajo de práctica realizado, y que será descrito en los otros capítulos del informe
- Se señala en qué empresa u organización realizaron las labores (se incluyen datos que no requieren de resguardo de confidencialidad por parte del/la estudiante).

(extensión sugerida: 1 página)]

#pagebreak()

Evol Services S.A., anteriormente llamada Ecom Energía, es una empresa de comercialización y administración de contratos de energía, adquirida en 2022 por el holding Empresas Lipigas.

En el departamento de Desarrollo y Tecnología de Evol, se realizan labores de mantención y desarrollo de nuevas funcionalidades del sistema que utiliza la compañía. El sistema se compone de variados servicios modularizados para gestionar la lógica de negocio y facilitar el trabajo a los otros departamentos de la empresa, principalmente a Gestión de Contratos Energéticos, Riesgo y Regulación y Atención al Cliente.  

El pilar de este sistema es una aplicación web (EMER) que gestiona la mayoría de la lógica de negocio de Evol. Desarrollada inicialmente por Altiuz (ahora llamada Atuz), era en un principio un monolito #footnote("
Monolito: Arquitectura que combina la lógica de negocios, interfaz de usuario y capa de acceso de datos en una sola aplicación unificada.") <fn> hecho con Java 8, Spring y AngularJS. Se encarga de gestionar clientes, contratos, medidores energéticos, mediciones y del envío masivo por e-mail de reportes mensuales para cada cliente, detallando su consumo, ahorro, incidencias, etc.

Con el paso del tiempo, la evolución del negocio y escala del mismo, las responsabilidades de desarrollo y mantención del sistema pasaron desde Altiuz hacia el departamento de desarrollo y tecnología de Evol Services. Manteniendo el backend en Java, marcando la segunda iteración del proyecto, EMER 2.0, el frontend pasó del framework AngularJS a un proyecto aparte con React y TypeScript, deshaciendo el monolito @fn de la aplicación web.
El proyecto en Java con Spring, ahora dedicado al backend, está estructurado en distintos módulos (Restful, Server, DOM y Backend), permitiendo la escalabilidad y evolución de la lógica empresarial, pero con el costo de altas cantidades de módulos obsoletos hechos por desarrolladores que ya no tienen relación con la empresa, y de altos tiempos de espera para tareas complejas como la compilación de los reportes. En cuanto al frontend del EMER 2.0, donde se enfocó mi práctica profesional, es un proyecto desarrollado con React que utiliza Vite como herramienta de compilación y servidor de desarrollo, TypeScript para tipado estático, tests E2E #footnote("E2E: Metodología de pruebas que verifica el flujo y experiencia de la aplicación de principio a fin (end to end).") implementados en Cypress, Axios como cliente HTTP y Bootstrap como framework CSS. Complementariamente, el ecosistema tecnológico de Evol incluye otros componentes como bots lectores de facturas energéticas que automatizan la carga de valores a la base de datos relacional PostgreSQL.



= Descripción del problema

#guia(visible: mostrar_guias)[Requerimiento o necesidad a resolver durante el trabajo de práctica:
- Describir el problema específico (u oportunidad desaprovechada), y las consecuencias de éste para la empresa u organización.
- Explicar qué tan crítico y urgente era para la organización resolver dicho problema.
- Además, se deben plantear los desafíos técnicos y organizacionales que representó la labor desarrollada para resolver dicho problema o necesidad.

(extensión sugerida: 0.5 a 1 página)
]

Al comenzar la práctica, el frontend en React utilizaba mayoritariamente la Context API de React, con una arquitectura compleja basada en múltiples Providers, Contexts, contextTypes, useProvider hooks y barrel files para manejar la lógica y los datos provenientes del backend. Aunque esta infraestructura permitía que la aplicación funcionara correctamente en ese momento, presentaba limitaciones en cuanto a extensibilidad, legibilidad y mantenibilidad, lo que dificultaba el desarrollo de nuevas funcionalidades y la corrección de errores existentes o introducidos por actualizaciones de dependencias. Por esta razón, el equipo decidió migrar progresivamente a un modelo de gestión de estado centralizado con Redux, que resultaba más flexible y mantenible para este proyecto en particular.

Durante las primeras seis semanas, mi tarea principal fue avanzar con esta migración, llevándola del 30-40% de completitud al 90-95%, minimizando el uso de la Context API y garantizando una implementación más uniforme en los componentes del proyecto. Debido a la existencia de componentes legados extensos y altamente complejos, la migración completa no era factible dentro del tiempo disponible. El esfuerzo requerido para migrar estos componentes no justificaba los beneficios obtenidos, por lo que se optó por mantenerlos intactos. Dado que estos componentes tenían una estructura frágil, su modificación podría haber introducido errores difíciles de detectar y corregir, lo que hacía inviable su migración dentro del tiempo disponible.

En las últimas semanas de mi práctica, me enfoqué en desarrollar nuevas interfaces para una funcionalidad de la aplicación relacionada con un nuevo tipo de contrato que la empresa iba a ofrecer a sus clientes. A partir de un documento extensivo de requerimientos y un mockup, desarrollé las interfaces requeridas utilizando los componentes reutilizables del proyecto y siguiendo la estructura de manejo de estados con Redux. Este desarrollo permitió que semanas después, una vez lista la lógica de negocio en el backend y la base de datos, el frontend estuviera preparado para una integración fluida, reduciendo la carga de trabajo de los desarrolladores encargados de esta nueva funcionalidad, que ya llevaba cinco meses en desarrollo.

Además, a lo largo de toda la práctica profesional, corregí y mejoré componentes del proyecto, solucioné bugs que llevaban años sin ser atendidos y optimicé la detección de errores en el código. Para ello, implementé un wrapper del compilador de TypeScript que realizaba un análisis de tipos en todo el proyecto antes de hacer push al repositorio remoto. Esta mejora resultó fundamental, ya que anteriormente el proyecto había experimentado problemas por importaciones de componentes fallidas que, debido a las optimizaciones del proceso de compilación de Vite, no eran detectadas hasta que el código ya estaba integrado en la rama de desarrollo.

= Objetivos

#guia(visible: mostrar_guias)[Determinar el objetivo general y los objetivos específicos de la práctica; para ello es preciso considerar lo siguiente:
- El objetivo es una declaración sobre una meta o propósito a cumplir.
- Se debe plantear un objetivo general y los objetivos específicos de cada práctica. Estos se enuncian en infinitivo: por ejemplo, analizar, describir, aplicar.

Es preciso señalar que los objetivos no son tareas a desarrollar. Cada objetivo
específico aporta al logro del objetivo general.

(No hay que poner texto acá. Se puede empezar directamente con el objetivo general.)

(extensión sugerida: 0.5 páginas)]

Participar en el desarrollo y mantenimiento del sistema EMER en Evol Services como desarrollador fullstack, contribuyendo a la mejora del software mediante la optimización del código, la corrección de errores y la implementación de nuevas funcionalidades. Aunque la práctica abarcaba tanto frontend como backend, el enfoque principal estuvo en la refactorización del frontend, migrando la gestión del estado de Context API a Redux para mejorar la mantenibilidad y escalabilidad del proyecto. Además, se desarrollaron nuevas interfaces para la implementación de un nuevo tipo de contrato y se optimizó la detección de errores en el código, facilitando el trabajo del equipo de desarrollo.

== Objetivo General

#guia(visible: mostrar_guias)[
Un _resumen conciso_ (no más de un párrafo) de la meta principal del trabajo, es decir, qué quieres lograr con el trabajo (o qué significa \"éxito\" en el contexto del trabajo).

El objetivo debería ser específico, medible, alcanzable, relevante al problema, y acotado en tiempo.

('Hacer la práctica' no es una repuesta válida. :\))]

Llevar el proyecto del frontend a una estructura homogénea, donde cada módulo de la aplicación siguiese la misma estructura de implementación, mismas convenciones de nombrado y uso de componentes reutilizados, y mejorar componentes y procesos ya existentes en el proyecto.

== Objetivos Específicos

#guia(visible: mostrar_guias)[
Una _lista_ de los hitos principales que se quieren lograr para (intentar) cumplir con el objetivo general. Divide el objetivo general en varios hitos que formarán las etapas del trabajo.

Cada objetivo debería ser específico, medible, alcanzable, relevante al problema, y acotado en tiempo.

No se debería escribir más de un párrafo por hito.

Los objetivos específicos deberían \"sumar\" al objetivo general.]

+ Analizar los desarrollos previos del frontend para entender cómo estaba funcionando y qué cosas debían cambiar
+ Corregir bugs en los desarrollos legados en parches o en las nuevas versiones de los componentes
+ Mejorar la detección de bugs en fase de desarrollo del repositorio del frontend
+ Refactorizar módulos obsoletos y/o defectuosos aplicando el nuevo estándar del equipo par desarrollar en el front
+ Crear interfaces para nuevas funcionalidades de la aplicación

= Metodología

#guia(visible: mostrar_guias)[
Describir la metodología:
- Se deben describir los pasos/etapas seguidos en el trabajo encomendado (tareas a realizar y su secuencia).
- Explicar si la metodología fue dada al/la estudiante por su supervisor/a o jefe directo o fue una propuesta propia (justificar).
- Explicar si la metodología fue la apropiada para alcanzar los objetivos planteados.
- Explicar cómo se puede evaluar la calidad del resultado obtenido en esta práctica.

(extensión sugerida: 0.5 a 1 página)]

La metodología de trabajo utilizada para completar los objetivos de la práctica fue la siguiente:

El equipo seguía una metodología de Daily SCRUM, que se basaba en reuniones diarias cortas (10 a 20 minutos), fuese por Microsoft Teams o en persona, para discutir los avances, compromisos diarios y dificultades en el trabajo de cada uno. Esta forma de trabajar impulsa fragmentar las tareas más generales y complejas en tareas pequeñas, realizables y medibles para cada día. Esta forma de organizar los desarrollos era útil siempre y cuando efectivamente las tareas se podían fragmentar y que no se repitiesen por más de 1 día, lo que no siempre era el caso. De todas formas es una buena metodología para no perder el hilo y la percepción del tiempo en cuanto a los objetivos más generales y poder hacer ajustes a los desarrollos por faltas de tiempo, lo que fue muchas veces necesario por aparición de bugs, vacaciones de miembros, enfermedades u otras incidencias.

En cuanto a la metodología para ocupar GIT, era la siguiente:
1. La rama main (producción) era intocable, sólo tenía permiso el jefe de hacer cambios hacia main mediante pull requests.
1. La rama desarrollo siempre debía estar funcionando correctamente, era el punto común de encuentro entre desarrolladores.
1. Cada desarrollo debía debía hacerse en una rama salida de desarrollo, al terminar el desarrollo, se realizaba un Pull Request detallando todos los cambios y con la checklist pre-revisión completada (haber realizado una revisión propia del código, probar la aplicación en local y crear scripts SQL en caso de ser necesario). Luego, el Pull Request era revisado y mergeado por el jefe del equipo a la rama de desarrollo.
1. Cada Pull Request debe introducir una sola feature hacia desarrollo, esto para controlar los posibles efectos secundarios de los cambios y mantener un historial claro de qué cambios se han hecho hacia desarrollo en la ventana de pull requests.

La metodología ocupada para trabajar específicamente en la refactorización del frontend fue, migrar por partes la aplicación, ejemplo, el menú de administración -> menú de cargas. Cada menú tenía entre 5 y 8 módulos asociados, los cuales eran en su mayoría páginas relacionadas a CRUD, create, read/retrieve, update y delete, lo que son mantenedores de las entidades de la base de datos. Para cada módulo, leía tanto su versión obsoleta como otros módulos ya migrados que eran similares, luego se reescribían los componentes, se probaba manualmente el funcionamiento y el manejo de estado, luego se automatizaba el proceso con Cypress y al terminar y pasar todos los tests existentes, se creaba un Pull Request hacia la rama de desarrollo.

Los tests en Cypress se hacían al final dado que era una tarea intensiva para la computadora de la empresa que se me fue entregada, por lo que se testeaba exhaustivamente usando la aplicación en el servidor de desarrollo local y luego se escribían tests automatizados, que finalmente tenían la utilidad de romperse en caso de que un cambio externo modificara el funcionamiento de la página.

En cuanto a los desarrollos de nuevas interfaces, se siguió una metodología similar, aplicando el mismo estándar de desarrollo, se utilizaban los componentes específicos que ocupaba el proyecto con data estática en el front, pero desarrollando la interfaz anticipando las tareas de integración con el backend, para minimizar los cambios y correcciones del código de la interfaz.


= Descripción de la Solución

#guia(visible: mostrar_guias)[Describir la solución obtenida, en términos de su diseño (si es un producto) y/o en términos de los resultados obtenidos (si es un estudio). Presentar la solución señalando sus fundamentos teórico-técnico.
- Describir la estructura de la solución (estructura macro).
- Describir los componentes de la solución (estructura detallada).
- Describir el comportamiento de la solución (dinámica), cuando corresponda.
- Indicar qué tecnologías se utilizaron y justificar su elección.
- Describir los resultados intermedios y finales obtenidos.
- Indicar las fortalezas y debilidades de la solución.

(extensión sugerida: 3 a 5 páginas)]

La refactorización propuesta para el frontend que se había puesto en marcha antes de mi práctica fue cambiar la estructura de cada módulo desde tener sólo un directorio de componentes y providers a separar cada responsabilidad en un directorio distinto, los componentes debían encargarse únicamente de definir el formato de cada pantalla, features se encargaba de manejar el estado de Redux, definiendo las funciones requeridas para usar la libería, services guardaba las llamadas HTTP hacia el backend de manera localizada, pues anteriormente se guardaban en otro directorio mucho más arriba en el árbol de archivos. Los direcotrios types y utils eran para guardar las declaraciones de tipos de TypeScript y funciones a utilizar en dentro de los otros directorios respectivamente. El archivo `index.tsx` tenía la única responsabilidad de cargar cada componente de manera On-Demand para llamarlos desde el Router.

#grid(columns: 2,  column-gutter: 40%,
```
.
└── Módulo/
    ├── components
    ├── provider
    └── index.tsx
```,
```
.
└── Módulo/
    ├── components
    ├── features
    ├── services
    ├── types
    ├── utils
    └── index.tsx
```
)

La estructura anterior de cada modulo seguía un patrón simple, en el directorio components se alojaban los archivos React TypeScript que se encargaban de las plantillas HTML + CSS, llamando a los providers de cada contexto que fuese necesario; el directorio de provider contenía la lógica de contexto de la entidad que representaba el módulo, ejemplo: Si el módulo era de Distribuidores, en provider debía estar un archivo llamado `ApiDistributorProvider.ts`, que exportaba funciones para manejar las llamadas a la API relacionadas con distrubidoras, como crear, modificar y eliminar. Para la lectura de varias distrubuidoras, se tenía un archivo aparte de provider llamado `ApiDistributorWorklistProvider.ts` que se encargaba de llamar a la API y llevar los datos a una estructura reutilizable definida para todas las listas de entidades de la base de datos. El problema con esta estructura era que en el archivo `index.tsx` se envolvía un componente principal del directorio components en todos los contextos que el módulo iba a utilizar. Además, cada módulo utilizaba una sola URL en el Router, por lo que para cambiar de acción dentro del componente, se había escrito una estructura de montaje de componentes en pantalla, la cual era dificil de leer y debugear dado que para agregar o cambiar cosas de la estructura, había que modificar más de un archivo para hacerlo. 

Mi trabajo como practicante fue llevar esta migración hacia su completitud en 2 meses de trabajo, separando las responsabilidades de cada archivo para seguir la nueva estructura que era mucho más amigable para realizar extensiones y correcciones, pues cada parte de la funcionalidad se implementaba en lugares separados. Antes habían declaraciones de tipos y funciones de manejo de estado dentro de components. En las primeras 2 semanas me enfoqué más que nada en familiarizarme con la librería Redux y con TypeScript, tecnologías que no había ocupado antes, cada módulo tomaba al rededor de 4 o 5 días en reescribirlo, en las siguientes semanas este tiempo se vería reducido a 2 o 3 días por módulo. A mitades de Febrero el 90% del front estaba migrado a la nueva estructura.

Una vez finalizada la refactorización de los principales módulos del EMER 2.0, se me encomendó implementar una maqueta funcional en el front para un nuevo módulo de gestión de contratos, se me fue entragado un mockup y un documento de especificación sobre el nuevo módulo. Debía tener 3 tabs, una para gestionar los datos generales del contrato, una tab para gestionar los periodos del contrato y condiciones asociados a este, y por ultimo una tab de anexos. En la tab de periodos también debía haber un submódulo de bloques horarios para manejar el cóbro de energía por bloques horarios, siguiendo las condiciones descritas por un formulario dinámico. Siguiendo la estructura de manejo de estados con Redux, la maqueta quedó con la siguiente estructura de archivos:

```
.
└── PPAContracts/
    ├── components/
    │   ├── tabs/
    │   │   ├── contract/
    │   │   │   ├── ContractForm.tsx
    │   │   │   └── Chatbox.tsx
    │   │   ├── periods/
    │   │   │   ├── energy-blocks/
    │   │   │   │   ├── forms/
    │   │   │   │   │   ├── FixedPriceForm.tsx
    │   │   │   │   │   ├── MarginalCostForm.tsx
    │   │   │   │   │   └── DecoupledForm.tsx
    │   │   │   │   ├── EnergyBlockForm.tsx
    │   │   │   │   └── EnergyBlockWorklist.tsx
    │   │   │   ├── PeriodWorklist.tsx
    │   │   │   └── PeriodModalForm.tsx
    │   │   └── annexes/
    │   │       ├── AnnexesFrom.tsx
    │   │       └── AnnexesWorklist.tsx
    │   ├── VersionFilter.tsx
    │   └── Main.tsx
    ├── features/
    │   └── PPAContractSlice.ts
    ├── types/
    │   ├── PPAContract.ts
    │   ├── Period.ts
    │   ├── EnergyBlock.ts
    │   └── Annexes.ts
    ├── utils/
    │   ├── utils.ts
    │   ├── pagination.ts
    │   └── validations.ts
    └── index.tsx
```

Creando una maqueta preparada para su integración con el backend que estaría listo semanas después.

Después de desarrollar esta maqueta el mi supervisor de práctica y jefe del equipo me comentó que hubieron errores en la rama de desarrollo por imports defectuosos y tomé la tarea de investigar lo sucedido y buscar una forma de solucionarlo. Primero leí los commits que habían sido la solución de los imports defectuosos y me percaté que la única diferencia eran las mayúsculas en los directorios, en vez de decir `import somecomponent from ./components` decía `import somecomponent from ./Components`, en el servidor local de Vite este import era resuelto sin problemas pero en un servidor de pruebas de Ubuntu, el proyecto no compilaba. Investigué sobre el problema y encontré que el sistema de archivos de Windows, el sistema operativo que usan todos los computadores de los trabajadores de la empresa, no era case sensitive, es decir, que `Components` y `components` para el sistema de archivos no tenía ninguna diferencia, sin embargo en los sistemas operativos basados en Linux, como Ubuntu, estos directorios eran diferentes. Este tipo de problemas en específico ocurrían cuando un desarrollador nombraba por error el directorio `Components` pero la convención era llamarlo `components`, al intentar renombrar el directorio desde un Windows, cambiaba el display del nombre en el explorador de archivos, pero por debajo, el directorio no era renombrado correctamente. Una solución a este problema era pasar por un nombre intermedio como `components-temp` y luego renombrar a `components`, pero esta solución apuntaba a un error ya encontrado, quedaba el problema de detectar estos errores antes de llegar a la rama de desarrollo o posiblemente a producción. Investigando más sobre al situación noté que cada vez que pasaba esto, el compilador de TypeScript mostraba un mensaje de que el import se había resuelto porque la diferencia con el nombre real del directorio era una sola letra. Tambien noté que al construir la aplicación con `npm run build`, aunque la aplicación tuviese errores de TypeScript, el comando se ejecutaba sin error. Al buscar la razón, encontre que en la documentación de Vite se mencionaba que el builder que se ocupaba estaba optimizado para la rapidez de construcción, por lo que no se relaizaba ningún checkeo de tipos o errores en tiempo de building, entonces Vite documentaba que era responsabilidad del desarrollador realizar un checkeo de tipos y errores antes construir el proyecto. Probé distintas alternativas para hacer un checkeo estático de los errores del proyecto como ESLint, pero esta opción no era factible, pues al correr ESLint se arrojaban más de 86 mil warnings y errores en el proyecto, afortunadamente TypeScript tiene un comando para correr el compilador sin crear archivos de output en JavaScript, por lo que probé utilizandolo como type-chekcer antes de construir el proyecto, agregué los comandos al `package.json` del proyecto de la siguiente manera:

```json
scripts: {
    ...
    "linter": "tsc --noEmit",
    "build:dev": "tsc --noEmit && vite build --mode dev",
    "build:prod": "vite build --mode prod"
    ...
}
```

Esta solución detectaba correctamente estos errores en tiempo de compilación del proyecto para las pruebas locales, el compilador de TypeScript sólo detecta errores más graves a comparación de ESLint, que incluye sugerencias de buenas prácticas en el código y los detecta como errores. El problema es que de todas formas el compilador de TypeScript detectaba al rededor de 200 errores de tipado e imports en el proyecto. Al revisar los errores me percaté que la gran mayoría eran fáciles de corregir, puesto que la aplicación en sí no estaba rota, sólo había que declarar más explicitamente algunos casos bordes como declarar variables como `let x: number | null` en vez de sólo number.

El proceso de arreglar todos los estos errores de compilación tomó al rededor de 4 días, una vez hecho se integró hacia la rama de desarrollo como parte del proceso de pruebas antes de crear un Pull Request. 

Días después mi supervisor se contactó conmigo para revisar un problema en la rama de desarrollo, le problema era que uno de los imports defectuosos de los que se debería encargar el script de linting con TypeScript se había colado en la rama de desarrollo y el comando de `npm run build:dev` no funcionaba. Al sugerir a mi supervisor que corriera el script de linting notamos que no decía nada, pues el comando de `tsc --noEmit` es silencioso y sólo imprime lineas en la consola en caso de haber un error, el problema es que el equipo de mi supervisor de práctica estaba funcionando extremadamente lento desde hace días, entoces parecía que no estuviese haciendo nada el comando. Finalmente el import defectuoso que se había colado en desarrollo era un error que ya había arreglado en mi Pull Request de introducir el comando de linting, sin embargo, otro Pull Request fue aprobado y la corrección de ese error fue sobreescrita, porbablemente por no haber actualizado la rama del nuevo Pull Request con desarrollo antes de hacer el merge. Pero el problema de usabilidad estaba presente de todas formas, no había un feedback hacia el usuario de que el comando estuviese haciendo su trabajo o se había quedado congelado. Para solucionar este problema, en vez de llamar directamente a `tsc --noEmit`, implementé un wrapper del comando en JavaScript, mostrando un spinner para mostrar que el comando estaba siendo ejecutado correctamente mientras en un sub-proceso se ejecutaba `tsc --noEmit`, al terminar, el script leía el output del comando y si no se encontraban errores, mostraba un mensaje de éxito, cuando encontraba errores, imprimía exactamente lo mismo que `tsc --noEmit`, que imprimía el tipo de error, el archivo y  la línea en donde se encontró el error, junto con un recuento total de los errores del proyecto y links para abrir directamente los archivos defectuosos en el editor. De esta forma había un feedback mucho más rico entre la herramienta de desarrollo y el usuario, que en este caso eran los desarrolladores.

La decisión de crear el script con JavaScript fue principalmente para hacerlo multiplataforma, pues el equipo tenía computadores con windows pero el proyecto se construía en un ambiente de linux, por lo que un shell script no era la mejor opción. En cambio, los scripts de JavaScript corren sobre el motor de NodeJS, lo que los hace multiplataforma.

= Reflexión

#guia(visible: mostrar_guias)[
- Describir los obstáculos encontrados, cómo fue el proceso y período de práctica y qué cambios no previstos ocurrieron.
- Describir el proceso de inserción en la empresa y la interacción que pudo alcanzar con el equipo.
- Explicar si fue proactivo en la realización de las tareas asignadas en el lugar de práctica y de si fue puntual en su asistencia al lugar de trabajo.
- Mencionar si enfrentó algún dilema ético, describiendo la situación y cómo se resolvió.
- Indicar y explicar qué cursos de la carrera fueron un aporte al momento de realizar la práctica, y cómo estos le ayudaron.
- Dar argumentos acerca de qué habilidades o conocimientos le faltaron para desempeñarse de manera adecuada en la práctica. Asimismo, explicar qué aspectos del ambiente laboral ayudaron (favorecieron) para compensar las debilidades que como practicante traía.
- Describir los nuevos conocimientos adquiridos en la práctica profesional.

*_Se solicita que este apartado pueda señalar su autopercepción del desempeño y las habilidades profesionales que implemento, tales como la ética, la comunicación oral y escrita, trabajo en equipo, entre otras. Respondiendo preguntas tales como_*:
¿qué aspecto de tu actuar en relación con el respeto y la responsabilidad, durante la experiencia de práctica destacarías?
¿En qué sentido su compromiso ético se vio fortalecido a partir de la experiencia de la práctica?
¿Cuáles son los principales desafíos que te planteas para el futuro en relación con lo técnico y personal?

(extensión sugerida: 1 a 3 páginas)]

Durante el transucrso de la práctica pude experimentar lo que es el trabajo en una empresa consolidada y con procesos burocráticos, como lo fue instalar software en el computador empresarial para trabajar. Para esta mundana actividad, se debe inicial un proceso por la Mesa de Ayuda Integral de empresas LipiGas, dado que nadie tiene permisos de administrador en los computadores de la empresa, entonces cada vez que se requiere instalar un software hay que sacar un ticket virtual por la plataforma, esperar aprobación y que un técnico se conecte de manera remota al computador para tipear la clave de administrador en el computador. Este proceso hizo que durante mis primeros 3 días de práctica no pudiera hacer nada más que ver por GitHub cómo estaban estructurados los repositorios y leer un poco de documentación.

Gracias a la modalidad híbrida de trabajo pude convivir con el equipo de desarrolladores de manera presencial en una oficina, la costumbre de todas las mañanas era completar la planilla con la planificación e salir a compar desayuno a un kiosco cercano, tiempos de convivencia que nos acercaron como practicantes al equipo y ayudaba a crear un ambiente de trabajo en equipo grato.

En un principio mi práctica iba a ser de desarrollo FullStack, empezando primero por el frontend, que suele ser más amigable para un principiante y luego pasar a ver algo de backend o AWS. Sin embargo dado mi rendimiento y todo el trabajo que necesitaba el frontend terminé enfocandome ahí. Dado esto, logré familiarizarme con TypeScript y React de una manera mucho más profunda y con esto, resolver problemas más complejos de los que podría haber encontrado si le hubiese dedicado menos tiempo. Para el final de mi práctica también descubrí que en realidad trabajar en el frontend si bien no lo encontraba malo o aburrido, la mayoría de problemas no son tan complejos en su naturaleza, son más de seguir una estructura predefinida y poder escribir código más rápido, hubo un momento en que sentí que ya no estaba aprendiendo tanto y me sentí un poco estancado, la solución que encontré a ese problema fue: si bien la solución del problema de la refactorización esta definida, sigo teniendo que reescribir todos los componentes de todas formas, y muchos de estos eran muy parecidos, no había mayor dificultad en eso, por lo que debía simplemente reescribir los componentes más rápido, entonces programé mis propios snippets para rellenar el código boilerplate de los componentes. Gracias a eso pude demorarme menos en tareas simplemente aburridas en donde no tenía que pensar en lo absoluto a pasar más tiempo solucionando bugs, mejorando los componentes reutilizables y en general dedicandole más tiempo a pensar en cómo hacer el proyecto mejor que en escribir componentes aburridos.

Por otro lado, a ambos practicantes del equipo nos trataron más como desarrolladores comúnes que sólo practicantes, todo nuestro trabajo estaba siendo incorporado directamente en la rama de desarrollo, y en un futuro integrado a producción. Por ende, era nuestra responsabilidad testear de manera exhaustiva nuestros desarrollos porque la empresa no contaba con un departamento de QA y testing de software. Además, como desarrolladores, siempre teníamos acceso a un dump de la base de datos relacional del último mes para fines de desarrollo, estos dumps se compartían libremente por el chat de Devs, por lo que cualquiera puede descargar los códigos fuentes y el dump desde su computadora personal. Como dilema ético, es importante reconocer el valor de los datos, el dump contenía información de contacto de todos los clientes de la empresa, diversas mediciones, etc. Como estudiante de Ingeniería y Ciencias de la Universidad de Chile, no descargué el dump de la base de datos en mi computador personal porque no es lo correcto.

Indagando más sobre la ética profesional, mi compromiso con la calidad de mi trabajo, siempre perseguí la excelencia sobre todos mis desarrollos, que quizás no fueron las óptimas en todas las situaciónes, quizás en 2 años la solución óptima sea otra, pero siempre mantuve un estándar alto en todo mi trabajo, lo que fue reconocido por mi supervisor.

En cuanto a cómo ayudó la universidad en el desempeño de mi práctica, 2 ramos son los destacados por sus enseñanzas, CC3002 - Metodologías de Diseño y Programación, donde se aprende a trabajar en proyectos de una e(scala) un poco mayor a la de los cursos anteriores, se hace una breve introducción a cómo trabajar con GIT, ambas cosas fueron de gran ayuda al llegar a trabajar en un proyecto de casi medio millón de líneas de código de sólo frontend, en donde más de 1 desarrollador trabaja en el repositorio. Por otro lado el curso electivo CC5002 - Desarrollo de Aplicaciones Web se aprende de manera agnóstica a las tecnologías todas las bases de lo que es el desarrollo de aplicaciones web, que si no fuese por este ramo electivo, probablemente no hubiese conseguido el puesto de practicante en primer lugar, estos acercamientos a las áreas de trabajo de ciencias de la computación son muy importantes a la hora de buscar práctica profesional.

= Conclusiones

#guia(visible: mostrar_guias)[
En esta sección se deberá retomar y confirmar de manera sintética los aspectos centrales de la práctica profesional, y dar un cierre a lo expuesto en el informe; se incluye:
- Determinar si se lograron los objetivos planteados.
- Plantear aspectos de mejora a su desempeño y a la solución creada (proyección).

(extensión sugerida: 0.5 a 1 página)]

= Anexos

#guia(visible: mostrar_guias)[
En esta sección se puede incluir material de adicional de apoyo al informe, por
ejemplo, capturas de pantalla, código fuente, o la descripción de casos de uso.
Este acápite es optativo.
]

@CorlessJK97 @NewmanT42

#bibliography("bibliografia.yml", title: "Referencias")
