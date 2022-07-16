select users.id as 'id', users.name as 'nombre', users.document  as 'documento', users.description as 'descripcion usuario', users.email as 'correo',
users.date_of_birth as 'fecha de nacimiento', users.cellphone as 'celular', the_address.address as 'direccion hogar', cities.name as 'ciudad',
roles.name as 'rol', the_groups.code as 'codigo', the_groups.journey as 'jornada', careers.name as 'carrera', careers.description as 'descripcion de carrera',
modules.name as 'nombre del modulo', modules.description as 'descripcion modulo', modules.duration as 'duracion'
from users
 join users_roles on users_roles.user_id = users.id
 join roles on users_roles.role_id = roles.id
 join the_address on the_address.user_id = users.id
 join cities on cities.id = the_address.city_id
 join users_groups on users_groups.user_id = users.id
 join the_groups on users_groups.group_id = the_groups.id
 join careers on the_groups.career_id = careers.id
 join careers_modules on careers.id = careers_modules.career_id
 join modules on careers_modules.module_id = modules.id;
 