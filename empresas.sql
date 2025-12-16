use Ventas_dulceria;

CREATE TABLE Empresas (
    id_empresa INT IDENTITY(1,1) NOT NULL,
    nombre_comercial VARCHAR(50) NOT NULL,
    empresa_direccion VARCHAR(255), 
    razon_social VARCHAR(50) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    regimen_fiscal VARCHAR(100) NOT NULL,
    codigo_postal_fiscal VARCHAR(5) NOT NULL,
    logo_url VARCHAR(MAX) NOT NULL, -- 'Text' en SQL Server moderno es VARCHAR(MAX)
    website VARCHAR(100) NOT NULL,
    telefono_contacto VARCHAR(10) NOT NULL,
   
   -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL, -- Quién la creó
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    CONSTRAINT PK_Empresas PRIMARY KEY (id_empresa)
);

CREATE TABLE Sucursal (
    id_sucursal INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL, -- FK hacia la tabla Empresas

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- Definición de la Llave Primaria
    CONSTRAINT PK_Sucursal PRIMARY KEY (id_sucursal)
);

CREATE TABLE DetalleSucursales (
    id_sucursal INT IDENTITY(1,1) NOT NULL,
    nombre_sucursal VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NULL,

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    
    -- Definición de la llave primaria
    CONSTRAINT PK_DetalleSucursales PRIMARY KEY (id_sucursal)
);

CREATE TABLE cierre_mensual_sucursales (
    id_cierre_m_s INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL, 
    id_sucursal INT NOT NULL, 
    anio INT NOT NULL,
    mes INT NOT NULL,
    
    total_ventas_brutas DECIMAL(10,2) NOT NULL,
    total_devoluciones DECIMAL(10,2) NOT NULL,
    venta_neta DECIMAL(10,2) NOT NULL,
    cantidad_tickets INT NOT NULL,
    ticket_promedio AS CAST((venta_neta / NULLIF(cantidad_tickets, 0)) AS DECIMAL(10,2)),
    
    posicion_ranking INT NOT NULL,
    fecha_procesado DATETIME NULL,

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),


    -- Definición de llave primaria
    CONSTRAINT PK_cierre_mensual_sucursales PRIMARY KEY (id_cierre_m_s)
);

CREATE TABLE InventarioSucursal (
    id_inventario INT IDENTITY(1,1) NOT NULL,
    id_sucursal INT NOT NULL,
    id_empresa INT NOT NULL,
    
    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),
    
    -- Definición de la llave primaria
    CONSTRAINT PK_InventarioSucursal PRIMARY KEY (id_inventario)
);
