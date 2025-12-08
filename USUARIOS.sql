
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

CREATE TABLE Empleado (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,  -- PK, Auto-incrementable
    id_rol INT,                                 -- FK
    id_empresa INT,                             -- FK
    id_sucursal INT,                            -- FK
    
    nom VARCHAR(150) NOT NULL,
    app VARCHAR(150) NOT NULL,
    rfc VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(20) NOT NULL,
    
    pass_user VARCHAR(150) NOT NULL,           
    type TINYINT NULL,
    active BIT,
    
    clave_usuario_u VARCHAR(50) NOT NULL,
    
    Create_user_time DATETIME,
    Create_user_date DATETIME
);

CREATE TABLE DetalleAlerta (
    id_alerta INT IDENTITY(1,1) PRIMARY KEY,   -- Int(11) AUTO_INCREMENT
    id_empleado INT NOT NULL,                  -- FK hacia Empleado
    mensaje_alerta VARCHAR(MAX),               -- 'text' se convierte a VARCHAR(MAX)
    Create_time DATETIME,
    Create_date DATETIME
);

CREATE TABLE ImgPerfil (
    Id_img INT IDENTITY(1,1) PRIMARY KEY,      -- Int(10) AUTOINCREMENT
    url_img VARCHAR(MAX) NOT NULL,           
    id_empleado_r INT NOT NULL,                -- FK
    Create_time DATETIME,
    Create_date DATETIME
);

CREATE TABLE registro_asistencia (
    id_asistencia INT IDENTITY(1,1) PRIMARY KEY, -- PK Auto-incrementable
    id_empleado INT NOT NULL,                    -- FK 
    id_sucursal INT,                             -- FK
    
    fecha DATE,
    hora_entrada TIME(0),                        -- TIME(0) elimina nanosegundos innecesarios
    hora_salida TIME(0),
    
    retardo BIT,                                 -- Bit(1)
    falta BIT,                                   -- Bit(1)
    
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME,
    Create_date DATETIME
);

CREATE TABLE TipoEmpleado (
    Id_rol INT IDENTITY(1,1) PRIMARY KEY,        -- PK 
    Id_empleado INT NOT NULL,                    -- FK
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    id_modulo INT NOT NULL,                      -- FK
    
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_time DATETIME,
    Create_date DATETIME
);