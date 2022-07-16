use proyecto_integrador_sql_delta;

insert into users(name,document,description,email,date_of_birth,cellphone,photo)
values('kenyer ortiz','CC 1156261635', 'Estudiante con muchas ganas de aprender sobre el mundo de la informatica','kenyer1@gmail.com','1997-07-12','3125895654',0),
('angela martinez', 'CC 102365988', 'Soy Psicologa con buena experiancia en el area del trabajo social y me gusta ayudar siempre a los demas ','angee2341@gmail.com','1990-05-18','3158766542',0),
('anderson sanchez', 'CC 1122214587','Soy el administrador el encargado de los presupuestos,compras,pagos,etc de codigo c13 ','sanchezander453@gmail.com','1988-01-27', '3125785641',0),
('sergio murillo','CC 1035312654', 'Soy profesor del area de backend con muchas ganas de enseñar y aprender de los estudiantes','murillo3451@gmail.com', '1996-11-25','3046523321',0),
('stiven mora','CC 1122622415', 'soy el director de codigo c 13 y estare siempre pendiente de que sea cumpla nuestros objetivos, nuesta mision y vision','stivenm020@gmail.com','1980-08-14','3012012522',0);

insert into roles(name)
values('Estudiante'),('Admistrador'),('Profesor'),('Director'),('Psicologo');

insert into users_roles(user_id,role_id)
 values(1,1),(2,5),(3,2),(4,3),(5,4);

insert into news(title,description,photo,date,user_id)
values('inicio de clases','Así lucen nuestras clases, con caras de interés, curiosidad, sueño de las madrugadas o trasnochadas… clases de mucho esfuerzo pero sobretodo, de muchas ganas. Todas y todos estamos asumiendo un reto muy grande, Gracias por creer y ser parte del sueño. ¡Vamos a lograrlo!',0,'2022-07-01',1),
('Jóvenes de la comuna 13 se formarán como programadores de software con proyecto Código C13','De la mano del grupo cultural Son Batá, en la comuna 13 acaba de nacer Código C13, un proyecto educativo que busca capacitar a jóvenes del territorio en TI (Tecnologías de la Información), con el objetivo de acercarlos a este mundo y que en él enruten sus proyectos de vida. El enfoque será como programadores de software.',0,'2022-04-08',3),
('Se inauguró Escuela de Código en la comuna 13 de Medellín impulsada por Son Batá y empresas','Con el propósito de incentivar el desarrollo de la tecnología y brindar más oportunidades de crecimiento a los jóvenes de Medellín, la Corporación Son Batá y varias empresas y entidades aliadas inauguraron la primera Escuela de Código y Programación de Software en la comuna 13 de la ciudad. Entre ellas se encuentran Distrihogar, Lenovo, Cintatex, Ceipa Business School, Cadena, Grupo Éxito, Error 404 y Prestigio, entre otras, que respaldaron la materialización de esta iniciativa.',0,'2022-04-04',2),
('Transformacion de los espacios hacia un enfoque artistico','Símbolos de libertad a través del arte. Un espacio en la Comuna 13 que vuelve a ser un centro de arte, creación y cambio social gracias a la gestión de @SonBatac13, la comunidad artística y la Alcaldía de Medellín. Flow que cambia vidas, que mueve la cultura y los sueños de los artistas de Medellín.',0,'2022-06-15',5),
('Los cuatro grandes restos de Codigoc13','1. Reducir las brechas de desigualdad social por medio de la empleabilidad, 2. Generar riqueza en el territorio, 3. Vender software para el mundo, 4. Replicar el modelo. Queremos que estas oportunidades lleguen a todo el país por medio de la tecnología.',0,'2022-03-31',4);

insert into modules(name,duration,description,modality)
values('nivelatorio_M','4 semanas ','En este modulo los estudiantes veran los siguientes temas: Algoritmos, Pensamiento lógico, Programación básica, Terminal y línea de comandos, Repositorios,Fundamentos ing. de software, Fundamentos arquitectura de software web','presencial'),
('web','5 semanas','En este modulo los estudiantes veran los siguientes temas: Sitios web estáticos y dinámicos, Aplicaciones web, Lenguajes web, Layouts, Herramientas de desarrollador navegador, Deployando un sitio','presencial'),
('javascrip_T','6 semanas','En este modulo los estudiantes veran los siguientes temas: Conceptos basicos, Variables, Condicionales, Interaciones, Funciones, Objetos, Arrays, DOM, Eventos, JSON, Jquery, MVC','presencial'),
('react','5 semanas', 'En este modulo los estudiantes veran los siguientes temas: Conceptos basicos, Herramientas, JSX, Componentes, Consumo apis, Routes y navegacion, Eventos, Context, Hooks, Firebase','presencial'),
('node','6 semanas','En este modulo los estudiantes veran los siguientes temas: Herramientas, Servidores javascrip, Npm y express, Plantillas, Websockets, Conexcion a diferentes bases de datos: sql, mongo o conceptos avanzados: cookis, mod cluster, nginx, logs y profiling, mails, seguridad, Apix rest, Pruebas con postman, Git, Deploy en la nube','presencial'),
('sql', '6 semanas','En este modulo los estudiantes veran los siguientes temas: SQL, Base de Datos, Modelo Entidad Relación, Línea de comandos, AWS (Pospuesto)','presencial'),
('nivelatorio_T','6 semanas','En este modulo los estudiantes veran los siguientes temas: Algoritmos, Pensamiento lógico, Programación básica, Terminal y línea de comandos, Repositorios,Fundamentos ing. de software, Fundamentos arquitectura de software web','presencial'),
('javascrip_M','6 semanas','En este modulo los estudiantes veran los siguientes temas: Conceptos basicos, Variables, Condicionales, Interaciones, Funciones, Objetos, Arrays, DOM, Eventos, JSON, Jquery, MVC','presencial');

insert into careers(name,cohor,description,photo,working_day)
values('frotend',1,'El Front end es la parte de una web que conecta e interactúa con los usuarios que la visitan. Es la parte visible, la que muestra el diseño, los contenidos y la que permite a los visitantes navegar',0,'mañana'),
('backend',1,'Un backend es un los sistema corporativo que se utilizan para dirigir una web o empresa, tales como sistemas de gestión de pedidos, inventario y procesamiento de suministro',0,'Tarde');

insert into careers_modules(career_id,module_id)
values(1,1),(1,2),(1,8),(1,4),(2,7),(2,3),(2,5),(2,6);

insert into the_groups(code,journey,career_id)
values('F-2022-01','mañana',1),('B-2022-01','tarde',2);

insert into users_groups(group_id,user_id)
values(1,1),(2,1),(1,2),(2,4),(2,3),(1,5);


insert into cities(name)
values('Medellin'),('Envigado'),('itagui'),('Caldas'),('Bello');


insert into the_address(address,city_id,user_id)
values('calle 35a # 59 85 ',3,1),('calle 56 bb # 89-56',1,2),('carrera 115c # 23-56',4,3),
('calle 100 # 8 bb - 34',5,4),('calle 34 # 56-84',2,5);
