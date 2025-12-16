use Ventas_dulceria;
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

    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),

    -- Restricciones (Constraints)
    CONSTRAINT PK_Inventario PRIMARY KEY (id_inventario),
    CONSTRAINT UQ_CodigoBarras UNIQUE (codigo_barras) -- Evita códigos de barras duplicados
);

CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) NOT NULL,
    -- Datos
    nombre_categoria VARCHAR(50) NOT NULL,

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL, -- Quién la creó
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- CONSTRAINTS
    CONSTRAINT PK_Categorias PRIMARY KEY (id_categoria),
    CONSTRAINT UQ_Nombre_Categoria UNIQUE (nombre_categoria) -- Para no tener dos categorías iguales
);