CREATE TABLE Inventario (
    id_inventario INT IDENTITY(1,1) NOT NULL,
    id_categoria INT NOT NULL,
    id_proveedor INT NOT NULL,
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
    codigo_barras VARCHAR(50) NOT NULL,
    nom_producto VARCHAR(100) NOT NULL,
    precio_venta_publico DECIMAL(10,2) NOT NULL,
    tipo_unidad VARCHAR(100) NOT NULL, -- Ej: 'Pieza', 'Kg', 'Litro'
    
    -- Inventario
    stock_min INT NOT NULL,
    stock_actual INT NOT NULL DEFAULT 0, -- Se inicializa en 0 si no indicas cantidad
    
    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME NULL,
    Create_date DATETIME NULL,

    -- Restricciones (Constraints)
    CONSTRAINT PK_Inventario PRIMARY KEY (id_inventario),
    CONSTRAINT UQ_CodigoBarras UNIQUE (codigo_barras) -- Evita códigos de barras duplicados
);

