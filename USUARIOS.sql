
create database Ventas_dulceria;
/*Modulos de usuarios*/

CREATE TABLE Usuarios (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY, -- Int(10) AUTOINCREMENT PK
    id_rol INT,                                -- FK
    id_empresa INT,                            -- FK
    id_sucursal INT,                           -- FK
    
    nom VARCHAR(150) NOT NULL,
    app VARCHAR(150) NOT NULL,
    rfc VARCHAR(150) NOT NULL,                 -- Nota: El RFC real suele ser de 13 chars
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(20) NOT NULL,               -- Nota: 20 caracteres es muy corto para emails
    
    type TINYINT NULL,                         -- Int(1) adaptado a TinyInt
    active BIT,                                -- Bit(1)
    
    clave_usuario VARCHAR(50) NOT NULL,
    clave_usuario_u VARCHAR(50) NOT NULL,
    
    Create_user_time DATETIME,
    Create_user_date DATETIME                  -- Nota: Podría ser redundante si usas time
);
