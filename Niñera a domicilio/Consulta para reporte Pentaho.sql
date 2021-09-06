-----------------------------Reporte-------------------------------------------------------------------------------------------------------------------------------------
---Realizar un reporte que permita visualizar los clientes que cuentan con servicios de niñera a domicilio de acuerdo a cada alergia se le enviara un tratamiento -------  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select cliente.id_cliente as codigo_de_cliente,
concat(cliente.nombre_cliente ||' '|| cliente.apellido_cliente) as Cliente,
cliente.telefono_cliente as telefono,
concat(niñera.nombre_niñera ||' '|| niñera.apellido_niñera) as Niñera,
niñera.cedula_niñera as cedula_niñera,
concat(niño.nombre_niño ||' '|| niño.apellido_niño) as Niño, 
servicio.horas_servicio as Horas_de_servicio,
servicio.id_servicio as codigo_servicio,
servicio.inconveniente_servicio as Inconveniente,
alergia.nombre_alergia as Alergia,
alergia.sintoma_alergia as Sintoma,
tratamiento.descripcion_tratamiento as Descripcion_de_tratamiento
from cliente inner join servicio on id_cliente=servicio_cliente_id
inner join niñera on id_niñera=servicio_niñera_id 
inner join niño on cliente_niño_id = cliente.id_cliente 
inner join alergia_niño on niño.id_niño = alergia_niño.alergia_niño_niño_id 
inner join alergia on alergia.id_alergia = alergia_niño.alergia_niño_alergia_id
inner join tratamiento on  tratamiento_alergia_id = alergia.id_alergia 
where  cliente.id_cliente = 'C003';
