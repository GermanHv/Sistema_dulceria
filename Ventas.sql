CREATE TABLE Ventas (
    id_venta INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
    
    id_empleado INT NOT NULL, 
    id_cliente INT NOT NULL,  
    id_caja INT NOT NULL,     
    id_corte INT NOT NULL,    -- En qué turno (Tabla Corte_Caja)
    id_dpv INT NOT NULL,
    id_cupon INT NULL,   

    folio_interno VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL, 
    total_venta DECIMAL(10,2) NOT NULL, -- Dinero total del ticket
    fecha_venta DATETIME DEFAULT GETDATE(),

    clave_usuario_u VARCHAR(50) NOT NULL, 
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    CONSTRAINT PK_Ventas PRIMARY KEY (id_venta),
    -- 2. La regla de negocio:
    -- "En la sucursal X, el folio Y solo puede existir una vez".
    -- Esto permite que la Sucursal norte tenga el folio 'N001' y la Sucursal sur TAMBIÉN tenga el folio 'S001'.
    CONSTRAINT UQ_Folio_Sucursal UNIQUE (id_sucursal, folio_interno)
);

CREATE TABLE Detalle_Ventas (
    id_detalle_venta INT IDENTITY(1,1) NOT NULL, -- PK

    id_venta INT NOT NULL,    
    id_producto INT NOT NULL,  
    
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,

    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL, 
    
    subtotal DECIMAL(10,2) NOT NULL, 

    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),
    
    -- 1. Llave Primaria
    CONSTRAINT PK_Detalle_Ventas PRIMARY KEY (id_detalle_venta),

);

CREATE TABLE Detalle_Pagos_Ventas (
    id_dpv INT IDENTITY(1,1) NOT NULL, 
    id_venta INT NOT NULL,

    monto_pagado DECIMAL(10,2) NOT NULL,
    
    -- Ejemplos: 'Efectivo', 'Tarjeta Debito', 'Vales', 'Transferencia'
    metodo_pago VARCHAR(50) NOT NULL, 
    
    -- Referencia bancaria (Opcional, solo si es tarjeta/transferencia)
    referencia VARCHAR(50) NULL, 
    
    -- Cambio entregado (Solo si es efectivo)
    cambio_entregado DECIMAL(10,2) DEFAULT 0,

    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,

    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- CONSTRAINTS
    CONSTRAINT PK_Detalle_Pagos PRIMARY KEY (id_dpv),
    
);

CREATE TABLE Cupones (
    id_cupon INT IDENTITY(1,1) NOT NULL,
    id_empresa INT NOT NULL,
 
    -- Si es null = Válido en todas las tiendas.
    -- Si tiene valor = Válido solo en esa tienda.
    id_sucursal INT NULL, 
    codigo VARCHAR(50) NOT NULL, -- Ej: 'BUENFIN2025'
    
    -- 1 = Porcentaje (Ej: 10 significa 10% de descuento)
    -- 2 = Monto Fijo (Ej: 10 significa $10 pesos de descuento)
    tipo_descuento TINYINT NOT NULL, 
    
    valor DECIMAL(10,2) NOT NULL, -- El número a descontar
    
    -- Vigencia
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    
    -- Límites
    usos_maximos INT DEFAULT 100, -- Cuántas veces se puede canjear en total
    usos_actuales INT DEFAULT 0,  -- Contador de cuántas veces se ha usado ya
    
    -- Estado
    active BIT DEFAULT 1, -- Interruptor manual de apagado

    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),
    
    -- 1. Primary Key
    CONSTRAINT PK_Cupones PRIMARY KEY (id_cupon),

    -- No permite crear dos cupones con el mismo código textual (Ej: 'HOLA' y 'HOLA')
    CONSTRAINT UQ_Codigo_Cupon UNIQUE (codigo),

    -- Validación extra (Opcional): Que la fecha fin no sea menor a la inicio
    CONSTRAINT CHK_Fechas_Validas CHECK (fecha_fin >= fecha_inicio)
);