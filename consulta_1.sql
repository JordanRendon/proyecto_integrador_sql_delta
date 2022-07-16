select users.name as 'nombre', users.document as 'documento', users.description as 'descripcion usuario', users.email as 'correo',
roles.id as 'id', roles.name as 'rol'
from users
 join users_roles on users_roles.user_id = users.id
 join roles on users_roles.role_id = roles.id
where users.id > 2; 