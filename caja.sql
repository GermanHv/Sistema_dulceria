CREATE TABLE Caja (
    id_caja INT IDENTITY(1,1) NOT NULL,
    id_empresa INT, -- Marcado como FK en el diagrama
    id_sucursal INT NOT NULL, -- Marcado como FK en el diagrama
    nombre_caja VARCHAR(150) NOT NULL,
    active BIT, -- Equivalente a Bit(1)
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME,
    Create_date DATETIME,
    
    -- Definición de la Llave Primaria
    CONSTRAINT PK_Caja PRIMARY KEY (id_caja)
);

CREATE TABLE movimientos_caja (
    id_movimiento INT IDENTITY(1,1) NOT NULL,
    id_corte INT NOT NULL,  -- FK hacia la tabla de cortes
    id_empresa INT,         -- FK
    id_sucursal INT,        -- FK
    tipo BIT,               -- 0: pago a proveedor, 1: devolución
    monto DECIMAL(10,2) NOT NULL,
    motivo VARCHAR(50) NOT NULL,
    comprobante VARCHAR(50) NOT NULL,
    hora_movimiento DATETIME,
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME,
    Create_date DATETIME,

    -- Definición de la Llave Primaria
    CONSTRAINT PK_movimientos_caja PRIMARY KEY (id_movimiento)
);

CREATE TABLE Corte_caja (
    id_corte INT IDENTITY(1,1) NOT NULL,
    id_empleado INT NOT NULL,  -- FK hacia tabla Empleados
    id_caja INT NOT NULL,      -- FK hacia tabla Caja
    id_empresa INT NOT NULL,            -- FK
    id_sucursal INT NOT NULL,           -- FK
    fecha_apertura DATETIME,
    fecha_cierre DATETIME,
    saldo_inicial DECIMAL(10,2) NOT NULL,
    saldo_final DECIMAL(10,2) NOT NULL,
    saldo_final_sistema DECIMAL(10,2) NOT NULL, -- Oculto al usuario según diagrama
    diferencia DECIMAL(10,2) NOT NULL,
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME,
    Create_date DATETIME,

    -- Definición de la Llave Primaria
    CONSTRAINT PK_Corte_caja PRIMARY KEY (id_corte)
);
