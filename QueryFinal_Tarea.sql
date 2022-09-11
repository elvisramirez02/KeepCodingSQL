select 
      modelos.nombremodelocoche as ModeloCoche
      ,marca.nombremarcacoche as MarcaCoche
      ,gpoemp.nombregrupoempresarial as GrupoEmpresarial
      ,coches.fechadecompra as FechaDeCompra
      ,coches.matricula as Matricula
      ,colores.nombrecolor as Color
      ,rev.kmsalrevisar as TotalKms
      ,aseguradora.nombreaseguradora as Aseguradora
      ,coches.poliza as Poliza
      ,concat(tipomoneda.nombremoneda,rev.importe)  as importe
 from
 	elvisramirez.coches as coches
 	inner join elvisramirez.modelocoche as modelos on coches.idmodelocoche = modelos.idmodelocoche 
 	inner join elvisramirez.marcascoche as marca on coches.idmarcacoche = marca.idmarcacoche 
 	inner join elvisramirez.grupoempresarial as gpoemp on marca.idgpoempresarial = gpoemp.idgpoempresarial 
 	inner join elvisramirez.colorescoches as colores on coches.idcolor = colores.idcolor 
	inner join elvisramirez.revisiones as rev on coches.idcoche = rev.idcoche 
 	inner join elvisramirez.tipomoneda as tipomoneda on rev.idtipomoneda = tipomoneda.idtipomoneda 
 	inner join elvisramirez.aseguradora as aseguradora on coches.idaseguradora = aseguradora.idaseguradora 
