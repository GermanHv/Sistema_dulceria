CREATE TABLE Modulos (
	id_modulo INT IDENTITY(1,1),
	
	id_empresa INT NOT NULL,
	id_sucursal INT NOT NULL,

	nom_modulo VARCHAR (50) NOT NULL,
	descripcion_modulo VARCHAR (50),

	-- permisos de usuario
	acceso_mod BIT DEFAULT 0, 
	crear_mod BIT DEFAULT 0,
	editar_mod BIT DEFAULT 0,
	eliminar_mod BIT DEFAULT 0,

	-- auditoría
	clave_usuario_u VARCHAR(50) NOT NULL,
    create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0),

	CONSTRAINT PK_Modulos PRIMARY KEY (id_modulo)
);

CREATE TABLE Submodulos (
	id_submodulo INT IDENTITY(1,1),
	id_modulo INT NOT NULL,
	nom_submodulo VARCHAR (50) NOT NULL,
	descripcion_submodulo VARCHAR(50) NOT NULL,

	-- permisos de usuario
	acceso_sub BIT DEFAULT 0, 
	crear_sub BIT DEFAULT 0,
	editar_sub BIT DEFAULT 0,
	eliminar_sub BIT DEFAULT 0,

	-- auditoría
	clave_usuario_u VARCHAR(50) NOT NULL,
    create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0),
	
	CONSTRAINT PK_Submodulo PRIMARY KEY (id_submodulo)
	);