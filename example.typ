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

Evol Services S.A., anteriormente llamada Ecom Energía es una empresa de comercialización y administración de contratos de energía, adquirida en 2022 por el holding Empresas Lipigas.

En el departamento de Desarrollo y Tecnología de Evol se realizan labores de mantención y desarrollo de nuevas funcionalidades del sistema que utiliza la compañía. El sistema se compone de varios servicios modularizados para gestionar la lógica de negocio y facilitar el trabajo a los otros departamentos de la empresa, principalmente a Gestión de Contratos Energéticos, Riesgo y Regulación y Atención al Cliente.  

El pilar de este sistema es una aplicación web (EMER) que gestoina la mayoría de la lógica de negocio de Evol. Desarrollada inicialmente por Altiuz (ahora llamada Atuz), era en un principio un monolito hecho con Java 8, Spring y AngularJS, se encarga de gestionar clientes, contratos, medidores energéticos, mediciones y lo más importante, envío por email de reportes mensuales para cada cliente, detallado su consumo, ahorro, incidencias, etc.

Con el crecimiento de la empresa y la evolución de sus necesidades tecnológicas, eventualmente la responsabilidad del mantenimiento y desarrollo del EMER fue transferida desde Altiuz hacia el equipo interno de Evol Services. Esta transición permitió a la empresa tener mayor control sobre su infraestructura tecnológica y adaptarla más ágilmente a los cambiantes requerimientos del negocio. El equipo de desarrollo de Evol mantuvo la base del backend en Java con Spring, pero tomó la decisión estratégica de modernizar el frontend, migrando de AngularJS a una aplicación separada desarrollada con React y Vite, dando origen a lo que hoy se conoce como EMER 2.0.

El proyecto en Java con Spring, ahora dedicado al backend, está estructurado en distintos módulos (Restful, Server, DOM y Backend) que han permitido la escalabilidad y evolución de la lógica empresarial. En cuanto al frontend del EMER 2.0, donde se enfocó mi práctica profesional, es un proyecto desarrollado con React que utiliza Vite como herramienta de compilación y servidor de desarrollo, TypeScript para tipado estático, tests E2E (end to end) implementados en Cypress, Axios como cliente HTTP y Bootstrap como framework CSS. Complementariamente, el ecosistema tecnológico de Evol incluye otros componentes como bots lectores de facturas energéticas que automatizan la carga de valores a la base de datos relacional PostgreSQL.

Actualmente, el departamento de Desarrollo y Tecnología está impulsando una migración estratégica del backend hacia un modelo serverless en AWS, contemplando también la transición de PostgreSQL a DynamoDB, con el objetivo de optimizar recursos y mejorar la escalabilidad del sistema.

Este contexto tecnológico en evolución constituyó el escenario donde desarrollé mi práctica profesional, participando activamente en el desarrollo del frontend y contribuyendo a la modernización de las soluciones que son fundamentales para la operación de Evol Services S.A.


= Descripción del problema

#guia(visible: mostrar_guias)[Requerimiento o necesidad a resolver durante el trabajo de práctica:
- Describir el problema específico (u oportunidad desaprovechada), y las consecuencias de éste para la empresa u organización.
- Explicar qué tan crítico y urgente era para la organización resolver dicho problema.
- Además, se deben plantear los desafíos técnicos y organizacionales que representó la labor desarrollada para resolver dicho problema o necesidad.

(extensión sugerida: 0.5 a 1 página)
]

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

== Objetivos Específicos

#guia(visible: mostrar_guias)[
Una _lista_ de los hitos principales que se quieren lograr para (intentar) cumplir con el objetivo general. Divide el objetivo general en varios hitos que formarán las etapas del trabajo.

Cada objetivo debería ser específico, medible, alcanzable, relevante al problema, y acotado en tiempo.

No se debería escribir más de un párrafo por hito.

Los objetivos específicos deberían \"sumar\" al objetivo general.]

+ ...
+ ...

= Metodología

#guia(visible: mostrar_guias)[
Describir la metodología:
- Se deben describir los pasos/etapas seguidos en el trabajo encomendado (tareas a realizar y su secuencia).
- Explicar si la metodología fue dada al/la estudiante por su supervisor/a o jefe directo o fue una propuesta propia (justificar).
- Explicar si la metodología fue la apropiada para alcanzar los objetivos planteados.
- Explicar cómo se puede evaluar la calidad del resultado obtenido en esta práctica.

(extensión sugerida: 0.5 a 1 página)]

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