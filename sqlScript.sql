CREATE TABLE cliente.Cliente ( 
  "Cedula" VARCHAR(10) NOT NULL , 
  "Direccion" VARCHAR(120) NULL , 
  "DireccionCobro" VARCHAR NULL , 
  "Nombre" VARCHAR(10) NULL , 
  "Apellido" VARCHAR(20) NULL , CONSTRAINT "Cliente_PK" PRIMARY KEY ( "Cedula" ) );

CREATE TABLE prenda.Color ( 
  "idColor" NUMERIC(2) NOT NULL , 
  "descrip" VARCHAR(40) NOT NULL , CONSTRAINT "COLOR_PK" PRIMARY KEY ( "idColor" ) );

CREATE TABLE prenda.Conjunto ( 
  "idConjunto" NUMERIC(4) NOT NULL , 
  "Nombre" VARCHAR(40) NOT NULL , CONSTRAINT "Conjunto_PK" PRIMARY KEY ( "idConjunto" ) );

CREATE TABLE orden.Estado ( 
  "idEstado" NUMERIC(1) NOT NULL , 
  "Estado" VARCHAR(12) NULL , CONSTRAINT "Estado_PK" PRIMARY KEY ( "idEstado" ) );

CREATE TABLE prenda.Estilo ( 
  "idEstilo" NUMERIC(2) NOT NULL , 
  "idColor" NUMERIC(2) NOT NULL , 
  "descrip" VARCHAR(140) NOT NULL , CONSTRAINT "Estilo_PK" PRIMARY KEY ( "idEstilo" ) );

CREATE TABLE proveedor.Extranjero ( 
  "idProveedor" NUMERIC(2) NOT NULL , 
  "nombreBanco" VARCHAR(20) NULL , 
  "numeroCuenta" VARCHAR(12) NULL , CONSTRAINT "Extranjero_PK" PRIMARY KEY ( "idProveedor" ) );

CREATE TABLE receta.Ingrediente ( 
  "idMateria" NUMERIC(4) NOT NULL , 
  "idReceta" NUMERIC(4) NOT NULL , 
  "Cantidad" NUMERIC(4) NULL , CONSTRAINT "Ingrediente_PK" PRIMARY KEY ( "idMateria", "idReceta" ) );

CREATE TABLE receta.MateriaPrima ( 
  "idMaterial" NUMERIC(4) NOT NULL , 
  "Nombre" VARCHAR(20) NULL , 
  "CantidadMin" NUMERIC(3) NULL , 
  "ExistenciaActual" NUMERIC(6) NULL , 
  "CostoUnitario" NUMERIC(4) NULL , 
  "idUnidadMedida" NUMERIC(4) NULL , CONSTRAINT "MateriaPrima_PK" PRIMARY KEY ( "idMaterial" ) );

CREATE TABLE proveedor.MateriaXProveedor ( 
  "idMateria" NUMERIC(4) NOT NULL , 
  "idProveedor" NUMERIC(2) NOT NULL , 
  "CantidadMinima" NUMERIC(4) NULL , 
  "UnidadMedida" NUMERIC(4) NULL , 
  "Costo" NUMERIC(7) NULL , 
  "FechaEntreda" DATE NULL , CONSTRAINT "MateriaXProveedor_PK" PRIMARY KEY ( "idMateria", "idProveedor" ) );

CREATE TABLE proveedor.Nacional ( 
  "idProveedor" NUMERIC(2) NOT NULL , 
  "cedulaJuridica" VARCHAR(12) NULL , 
  "DiasCredito" NUMERIC(2) NULL , CONSTRAINT "Nacional_PK" PRIMARY KEY ( "idProveedor" ) );

CREATE TABLE orden.OrdenProduccion ( 
  "idOrden" NUMERIC(7) NOT NULL , 
  "idPrenda" NUMERIC(4) NULL , 
  "idSolicitud" NUMERIC(6) NULL , 
  "FechaProduccion" DATE NULL , CONSTRAINT "OrdenProduccion_PK" PRIMARY KEY ( "idOrden" ) );

CREATE TABLE prenda.Prenda ( 
  "idPrenda" NUMERIC(4) NOT NULL , 
  "Descripcion" VARCHAR(40) NULL , 
  "idEstilo" NUMERIC(2) NULL , 
  "Talla" VARCHAR(4) NULL , CONSTRAINT "Prenda_PK" PRIMARY KEY ( "idPrenda" ) );

CREATE TABLE prenda.PrendaXConjunto ( 
  "idConjunto" NUMERIC(2) NOT NULL , 
  "idPrenda" NUMERIC(4) NOT NULL , CONSTRAINT "PrendaXConjunto_PK" PRIMARY KEY ( "idConjunto", "idPrenda" ) );

CREATE TABLE orden.PrendaXOrden ( 
  "idPrenda" NUMERIC(4) NOT NULL , 
  "idSolicitud" NUMERIC(6) NOT NULL , 
  "Cantidad" NUMERIC(6) NULL , CONSTRAINT "PrendaXOrden_PK" PRIMARY KEY ( "idPrenda", "idSolicitud" ) );

CREATE TABLE proveedor.Proveedor ( 
  "idProveedor" NUMERIC(2) NOT NULL , 
  "Direccion" VARCHAR(120) NULL , 
  "nombre" VARCHAR(15) NULL , CONSTRAINT "Proveedor_PK" PRIMARY KEY ( "idProveedor" ) );

CREATE TABLE receta.Receta ( 
  "idPrenda" NUMERIC(4) NULL , 
  "idReceta" NUMERIC(4) NOT NULL , 
  "Descripcion" VARCHAR(120) NULL , CONSTRAINT "Receta_PK" PRIMARY KEY ( "idReceta" ) );

CREATE TABLE orden.Solicitud ( 
  "idSolicitud" NUMERIC(6) NOT NULL , 
  "idCliente" VARCHAR(10) NOT NULL , 
  "FechaProduccion" DATE NULL , 
  "FechaRegistro" DATE NOT NULL , CONSTRAINT "Solicitud_PK" PRIMARY KEY ( "idSolicitud" ) );

CREATE TABLE cliente.Telefono ( 
  "idCliente" VARCHAR(10) NOT NULL , 
  "Telefono" NUMERIC(8) NOT NULL , 
  "NombreContacto" VARCHAR(12) NULL , CONSTRAINT "Telefono_PK" PRIMARY KEY ( "idCliente", "Telefono" ) );

CREATE TABLE proveedor.TelefonoProveedor ( 
  "idProveedor" NUMERIC(2) NOT NULL , 
  "Telefono" NUMERIC(8) NOT NULL , 
  "NombreContacto" VARCHAR(20) NULL , CONSTRAINT "TelefonoProveedor_PK" PRIMARY KEY ( "Telefono", "idProveedor" ) );

CREATE TABLE receta.UnidadMedida ( 
  "idUnidad" NUMERIC(4) NOT NULL , 
  "Nombre" VARCHAR(20) NULL , 
  "FactorComun" NUMERIC(4) NULL , CONSTRAINT "UnidadMedida_PK" PRIMARY KEY ( "idUnidad" ) );

ALTER TABLE prenda.Estilo ADD CONSTRAINT "Estilo_FK_COLOR" FOREIGN KEY ( "idColor" )
 REFERENCES prenda.Color ( "idColor" );

ALTER TABLE proveedor.Extranjero ADD CONSTRAINT "Extranjero_FK_Proveedor" FOREIGN KEY ( "idProveedor" )
 REFERENCES proveedor.Proveedor ( "idProveedor" );

ALTER TABLE receta.Ingrediente ADD CONSTRAINT "Ingrediente_FK_Materia" FOREIGN KEY ( "idMateria" )
 REFERENCES receta.MateriaPrima ( "idMaterial" );

ALTER TABLE receta.Ingrediente ADD CONSTRAINT "Ingrediente_FK_Receta" FOREIGN KEY ( "idReceta" )
 REFERENCES receta.Receta ( "idReceta" );

ALTER TABLE receta.MateriaPrima ADD CONSTRAINT "MateriaPrima_FK1" FOREIGN KEY ( "idUnidadMedida" )
 REFERENCES receta.UnidadMedida ( "idUnidad" );

ALTER TABLE proveedor.MateriaXProveedor ADD CONSTRAINT "MateriaXProveedor_FK_MateriaPrima" FOREIGN KEY ( "idMateria" )
 REFERENCES receta.MateriaPrima ( "idMaterial" );

ALTER TABLE proveedor.MateriaXProveedor ADD CONSTRAINT "MateriaXProveedor_FK_Proveedor" FOREIGN KEY ( "idProveedor" )
 REFERENCES proveedor.Proveedor ( "idProveedor" );

ALTER TABLE proveedor.Nacional ADD CONSTRAINT "Nacional_FK_Proveedor" FOREIGN KEY ( "idProveedor" )
 REFERENCES proveedor.Proveedor ( "idProveedor" );

ALTER TABLE orden.OrdenProduccion ADD CONSTRAINT "OrdenProduccion_FK_PrendaXOrden" FOREIGN KEY ( "idPrenda", "idSolicitud" )
 REFERENCES orden.PrendaXOrden ( "idPrenda",  "idSolicitud" );

ALTER TABLE prenda.Prenda ADD CONSTRAINT "Prenda_FK_Estilo" FOREIGN KEY ( "idEstilo" )
 REFERENCES prenda.Estilo ( "idEstilo" );

ALTER TABLE prenda.PrendaXConjunto ADD CONSTRAINT "PrendaXConjunto_FK_Conjunto" FOREIGN KEY ( "idConjunto" )
 REFERENCES prenda.Conjunto ( "idConjunto" );

ALTER TABLE prenda.PrendaXConjunto ADD CONSTRAINT "PrendaXConjunto_FK_Prenda" FOREIGN KEY ( "idPrenda" )
 REFERENCES prenda.Prenda ( "idPrenda" );

ALTER TABLE orden.PrendaXOrden ADD CONSTRAINT "PrendaXOrden_FK_Prenda" FOREIGN KEY ( "idPrenda" )
 REFERENCES prenda.Prenda ( "idPrenda" );

ALTER TABLE orden.PrendaXOrden ADD CONSTRAINT "PrendaXOrden_FK_Solicitud" FOREIGN KEY ( "idSolicitud" )
 REFERENCES orden.Solicitud ( "idSolicitud" );

ALTER TABLE receta.Receta ADD CONSTRAINT "Receta_FK_Prenda" FOREIGN KEY ( "idPrenda" )
 REFERENCES prenda.Prenda ( "idPrenda" );

ALTER TABLE orden.Solicitud ADD CONSTRAINT "Solicitud_FK_Cliente" FOREIGN KEY ( "idCliente" )
 REFERENCES cliente.Cliente ( "Cedula" );

ALTER TABLE orden.Solicitud ADD CONSTRAINT "Solicitud_FK_Estado" FOREIGN KEY ( "idSolicitud" )
 REFERENCES orden.Estado ( "idEstado" );

ALTER TABLE cliente.Telefono ADD CONSTRAINT "Telefono_FK_Cliente" FOREIGN KEY ( "idCliente" )
 REFERENCES cliente.Cliente ( "Cedula" );

ALTER TABLE proveedor.TelefonoProveedor ADD CONSTRAINT "TelefonoProveedor_FK_Proveedor" FOREIGN KEY ( "idProveedor" )
 REFERENCES proveedor.Proveedor ( "idProveedor" );
