#import "constants.typ": pronombre

// nota: cuando se habla del diccionario de una persona se refiere a un diccionario con los campos nombre, pronombre, correo y teléfono. 

#let example-metadata = (
  // El título de la práctica, en mayúsculas
  titulo: "DESARROLLO WEB - EVOL SERVICES",

  // El diccionario con información de la persona que escribe el documento
  autoria: (
    nombre: "Sergio Daniel Ignacio Romero Véliz",
    pronombre: pronombre.el,
    correo: "sergioromeroiv@gmail.com",
    telefono: "+56 9 5681 4697",
  ),

  // El diccionario con información de la persona que realizó la supervisión
  supervision: (
    nombre: "Edison Delgado Aguilera",
    pronombre: pronombre.el,
    correo: "edison.delgado@evol.energy",
    telefono: "+56 9 6593 8746",
  ),

  // Información sobre la práctica
  practica: (
    // Número de la práctica, 1 o 2
    numero: 1,

    // Código de la práctica, CC4901 para la práctica I, CC5901 para la práctica II
    codigo: "CC4901",

    // Nombre de la carrera
    carrera: "Ingeniería Civil en Computación",

    // Nombre de la empresa
    empresa: "Evol Services S.A.",

    // Período en que se realizó la práctica
    periodo: "Enero - Febrero 2025",
  ),

  // Un string para una fecha, o la fecha actual si no se especifica
  fecha: none,

  // Espaciado extra antes del título y al rededor de autor
  espaciado-titulo: 1fr,
)