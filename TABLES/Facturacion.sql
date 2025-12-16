use Ventas_dulceria;
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) NOT NULL,

    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,

    nombre_cliente VARCHAR(150) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    
    telefono_1 VARCHAR(20) NOT NULL,
    telefono_2 VARCHAR(20) NULL,
    correo VARCHAR(50) NOT NULL,

    password_cliente VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    activo BIT DEFAULT 1,

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- CONSTRAINTS
    CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente),
    -- CONSTRAINT FK_Clientes_Empresa FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    -- CONSTRAINT FK_Clientes_Sucursal FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    CONSTRAINT UQ_Correo_Cliente UNIQUE (correo)
);

CREATE TABLE Facturacion_Clientes (
    id_datos_facturacion INT IDENTITY(1,1) NOT NULL,
    id_cliente INT NOT NULL,
    
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,

    -- Datos Fiscales (CFDI 4.0)
    rfc VARCHAR(13) NOT NULL,
    razon_social VARCHAR(150) NOT NULL,
    regimen_fiscal VARCHAR(100) NOT NULL, -- Ej: '601 - General de Ley'
    cp_fiscal VARCHAR(10) NOT NULL,
    correo_facturacion VARCHAR(150) NOT NULL,

    -- Dirección Fiscal Detallada
    calle VARCHAR(100) NOT NULL,
    colonia VARCHAR(100) NOT NULL,
    numero_direccion VARCHAR(50) NOT NULL,
    municipio VARCHAR(100) NOT NULL,

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- CONSTRAINTS
    CONSTRAINT PK_Facturacion PRIMARY KEY (id_datos_facturacion),
    CONSTRAINT FK_Facturacion_Cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    -- CONSTRAINT FK_Facturacion_Empresa FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    -- CONSTRAINT FK_Facturacion_Sucursal FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal)
);

CREATE TABLE Detallesfacturas (
    id_factura INT IDENTITY(1,1) NOT NULL,

    -- Relaciones Clave (El triángulo Venta-Factura-Datos)
    id_venta INT NOT NULL,              -- ¿Qué ticket facturamos?
    id_datos_facturacion INT NOT NULL,  -- ¿A qué RFC?
    
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,

    -- Datos del SAT
    uuid VARCHAR(36) NOT NULL, -- Folio Fiscal (Indispensable)
    fecha_timbrado DATETIME DEFAULT GETDATE(),
    monto_total DECIMAL(10,2) NOT NULL,
    
    -- Archivos
    archivo_xml VARCHAR(150) NOT NULL, -- Ruta del archivo
    archivo_pdf VARCHAR(150) NOT NULL, -- Ruta del archivo

    -- Estatus (TINYINT es mejor que INT para opciones pequeñas)
    -- 1=Vigente, 2=Cancelada, 3=En proceso
    estatus TINYINT DEFAULT 1, 

    -- Claves SAT
    uso_cfdi VARCHAR(4),       -- Ej: 'G03'
    forma_pago_sat VARCHAR(3), -- Ej: '01', '04'

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- CONSTRAINTS
    CONSTRAINT PK_DetallesFacturas PRIMARY KEY (id_factura),
    
    -- Importante: Conectar con Venta y Datos Fiscales
    -- CONSTRAINT FK_Facturas_Venta FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    CONSTRAINT FK_Facturas_Datos FOREIGN KEY (id_datos_facturacion) REFERENCES Facturacion_Clientes(id_datos_facturacion),
    
    -- CONSTRAINT FK_Facturas_Empresa FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    -- CONSTRAINT FK_Facturas_Sucursal FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),

    -- Regla: Un UUID no se puede repetir jamás
    CONSTRAINT UQ_UUID_Factura UNIQUE (uuid)
);