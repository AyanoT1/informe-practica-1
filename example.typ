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

== Objetivo General

#guia(visible: mostrar_guias)[
Un _resumen conciso_ (no más de un párrafo) de la meta principal del trabajo, es decir, qué quieres lograr con el trabajo (o qué significa \"éxito\" en el contexto del trabajo).

El objetivo debería ser específico, medible, alcanzable, relevante al problema, y acotado en tiempo.

('Hacer la práctica' no es una repuesta válida. :\))]

Participar en el desarrollo y mantenimiento del sistema EMER en Evol Services como desarrollador fullstack, contribuyendo a la mejora del software mediante la optimización del código, la corrección de errores y la implementación de nuevas funcionalidades. Aunque la práctica abarcaba tanto frontend como backend, el enfoque principal estuvo en la refactorización del frontend, migrando la gestión del estado de Context API a Redux para mejorar la mantenibilidad y escalabilidad del proyecto. Además, se desarrollaron nuevas interfaces para la implementación de un nuevo tipo de contrato y se optimizó la detección de errores en el código, facilitando el trabajo del equipo de desarrollo.

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