CREATE TABLE Proveedores (
    id_proveedor INT IDENTITY(1,1) NOT NULL,
    nombre_proveedor VARCHAR(150) NOT NULL,
    nombre_contacto VARCHAR(150) NULL, 
    rfc_prov VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(50) NOT NULL, 
    
    -- Logística
    dias_entrega_estimado INT NOT NULL, 
    ultima_entrega DATE NULL,
    
    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),
    
    -- Llave Primaria
    CONSTRAINT PK_Proveedores PRIMARY KEY (id_proveedor)
);

CREATE TABLE Catalogo (
    id_producto INT IDENTITY(1,1) NOT NULL,
    
    -- Relación con Proveedor (FK)
    id_proveedor INT NOT NULL, 
    
    -- Detalles del Producto
    nombre_producto VARCHAR(50) NOT NULL,
    codigo_barras VARCHAR(50) NOT NULL,
    caducidad DATE NULL, -- Puede ser NULL si el producto no perece
    costo_unitario DECIMAL(10,2) NOT NULL, -- Costo de compra
    tipounidad VARCHAR(100) NOT NULL, -- Ej: Pieza, Kg, Caja
    
    -- auditoria
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)),
    
    -- Restricciones
    CONSTRAINT PK_Catalogo PRIMARY KEY (id_producto),
    CONSTRAINT UQ_Catalogo_CodigoBarras UNIQUE (codigo_barras), -- Código único obligatoriamente
);