CREATE TABLE Nomina (
    id_nomina INT IDENTITY(1,1) NOT NULL,
    id_empresa INT,
    id_sucursal INT,
    id_empleado INT NOT NULL,
    id_detalle_pago INT NOT NULL,
    id_periodo INT,
    monto_final DECIMAL(10,2),
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME,
    Create_date DATETIME,
    
    -- Definición de la Llave Primaria
    CONSTRAINT PK_Nomina PRIMARY KEY (id_nomina)
);