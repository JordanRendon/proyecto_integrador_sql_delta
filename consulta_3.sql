select users.id as 'id', users.name as 'nombre', users.document as 'documento', the_groups.code as 'codigo', the_groups.journey as 'jornada',
careers.name as 'carrera', careers.description as 'descripcion de carrera', modules.name as 'nombre del modulo', modules.description as 'descripcion modulo',
modules.duration as 'duracion'
from users 
 join users_groups on users_groups.user_id = users.id
 join the_groups on users_groups.group_id = the_groups.id
 join careers on the_groups.career_id = careers.id
 join careers_modules on careers.id = careers_modules.career_id
 join modules on careers_modules.module_id = modules.id
 where users.name like '%an%';