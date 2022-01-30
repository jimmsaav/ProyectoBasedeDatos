use tliving;
drop procedure if exists encontrar_compatibilidad;

DELIMITER //
create procedure encontrar_compatibilidad(in idUsuarioIN int, in nombreActividad varchar(100))
begin 
    select @idAct := idActividad from Actividad where nombre like nombreActividad;
    
    select * from preferenciasporusuario where idActividad = @idAct;    
    
end //

call encontrar_compatibilidad(1, "Futbol");