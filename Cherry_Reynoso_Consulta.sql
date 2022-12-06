-- consulta SQL


select m.modelo, m.marca, g.nombre, c.dt_purchase, c.matricula, c.color, c.actual_kilometers, p.policy_number, a.nombre 
from practica_modelado.modelo m 
left join practica_modelado.coche c
on m.idmodelo = c.idmodelo
left join practica_modelado.grupoemp g
on m.idgrupo = g.idgrupo 
left join practica_modelado.poliza p 
on c.idpolicy = p.idpolicy 
left join practica_modelado.aseguradora a 
on p.idaseguradora = a.idaseguradora  

