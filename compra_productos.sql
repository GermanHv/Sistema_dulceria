use Ventas_dulceria;
CREATE TABLE Compras (
    id_compra INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,

    folio_factura_proveedor VARCHAR(50),
    fecha_compra DATETIME DEFAULT GETDATE(),
    fecha_recepcion DATETIME,

    cantidad_productos_total INT NOT NULL, 
    IVA_total DECIMAL(10,2) NOT NULL,
    costo_total DECIMAL(10,2) NOT NULL,

     -- ESTATUS
    -- 'Pendiente', 'Recibido', 'Pagado'
    estatus VARCHAR(20) DEFAULT 'Pendiente',

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- Llave Primaria
    CONSTRAINT PK_compra_productos PRIMARY KEY (id_compra)
);

CREATE TABLE DetalleCompra (
    id_detalle_compra INT IDENTITY(1,1) NOT NULL,
    id_compra INT NOT NULL, 
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
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    
    -- Llave Primaria
    CONSTRAINT PK_DetalleCompra PRIMARY KEY (id_detalle_compra),
);