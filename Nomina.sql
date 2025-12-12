CREATE TABLE Nomina (
    id_nomina INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
    id_empleado INT NOT NULL,
    id_detalle_pago INT NOT NULL,
    id_periodo INT,
    monto_final DECIMAL(10,2),

    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),
    
    -- Definición de la Llave Primaria
    CONSTRAINT PK_Nomina PRIMARY KEY (id_nomina)
);

CREATE TABLE Detalledenomina (
    id_detallenomina INT IDENTITY(1,1) NOT NULL,
    id_nomina INT NOT NULL, -- FK: Viene de la tabla Nomina
    nom_pago VARCHAR(50) NOT NULL, 
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
    id_periodo INT NOT NULL,         -- FK: Viene de la tabla Periodo
    sub_monto DECIMAL(10,2),
    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),

    -- Definición de la Llave Primaria
    CONSTRAINT PK_DetalleNomina PRIMARY KEY (id_detallenomina)
);

CREATE TABLE Periodo (
    id_periodo INT IDENTITY(1,1) NOT NULL,
    descripcion_periodo VARCHAR(50), -- Para 'semanal', 'quincenal', etc.

    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),

    -- Definición de la Llave Primaria
    CONSTRAINT PK_Periodo PRIMARY KEY (id_periodo)
);

CREATE TABLE catalogo_pagos (
    id_tipo_pago INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
    nombre_pago VARCHAR(150) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    monto_base DECIMAL(10,2),
    activo BIT, -- 1 para activo, 0 para inactivo

    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),

    CONSTRAINT PK_CatalogoPagos PRIMARY KEY (id_tipo_pago)
);

CREATE TABLE cuentasBancarias (
    id_bancaria INT IDENTITY(1,1) NOT NULL,
    id_empleado INT NOT NULL, 
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
    clave_bancaria VARCHAR(20) NOT NULL, 
    nom_banco VARCHAR(150) NOT NULL,

    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),

    -- Definición de la Llave Primaria
    CONSTRAINT PK_CuentasBancarias PRIMARY KEY (id_bancaria)
);