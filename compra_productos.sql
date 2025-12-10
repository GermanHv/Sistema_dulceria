CREATE TABLE compra_productos (
    id_cp_solicitud INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
    id_proveedor INT NOT NULL, 
    cantidad_productos_total INT NOT NULL, 
    IVA_total DECIMAL(10,2) NOT NULL,
    costo_total DECIMAL(10,2) NOT NULL,

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME NULL,
    Create_date DATETIME NULL,
    -- Llave Primaria
    CONSTRAINT PK_compra_productos PRIMARY KEY (id_cp_solicitud)
);

CREATE TABLE DetalleCompra (
    id_dc INT IDENTITY(1,1) NOT NULL,
    id_cp_solicitud INT NOT NULL, 
    id_proveedor INT NOT NULL,
    id_producto INT NOT NULL,
    id_empresa INT NULL,  
    id_sucursal INT NULL, 
    -- Cantidades y Costos
    cant_prod DECIMAL(12,3) NOT NULL, -- 3 decimales por si compras por Kilo/Litro (ej. 1.500 kg)
    sub_total DECIMAL(12,2) NOT NULL, -- Dinero (2 decimales)
    iva DECIMAL(10,2) NOT NULL,       -- Impuesto
    
    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME NULL,
    Create_date DATETIME NULL,
    
    -- Llave Primaria
    CONSTRAINT PK_DetalleCompra PRIMARY KEY (id_dc),
);