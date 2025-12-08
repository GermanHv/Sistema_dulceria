
create database Ventas_dulceria;
/*Modulos de usuarios*/

CREATE TABLE Usuarios (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY, -- Int(10) AUTOINCREMENT PK
    id_rol INT NOT NULL,                                -- FK
    id_empresa INT NOT NULL,                            -- FK
    id_sucursal INT,                           -- Puede ser NULL si es admin global
    
    -- Datos personales
    nom VARCHAR(150) NOT NULL,
    app VARCHAR(150) NOT NULL,
    rfc VARCHAR(13) NOT NULL,               
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(40) NOT NULL,            
    
    -- Control de sistema
    type TINYINT NULL,                         -- Int(1) adaptado a TinyInt
    active BIT DEFAULT 1,                      -- 1 = Activo, 0 = Inactivo.
    clave_usuario VARCHAR(50) NOT NULL,        -- Tomar la primeras iniciales de su nombre y el apellido
    
    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE), -- Guarda fecha y hora juntas automáticamente
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0) -- Nota: Podría ser redundante si usas time
);

CREATE TABLE Empleado (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,  -- PK, Auto-incrementable
    id_rol INT NOT NULL,                                 -- FK
    id_empresa INT NOT NULL,                             -- FK
    id_sucursal INT,                            -- FK
    
    nombre_empleado VARCHAR(150) NOT NULL,
    apellido_p_e VARCHAR(150) NOT NULL,
    apellido_m_e VARCHAR(150) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(40) NOT NULL,
    
    pass_user VARCHAR(150) NOT NULL,           
    type TINYINT NULL,
    active BIT,
    
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_user_date DATE DEFAULT CAST (GETDATE() AS DATE),
    Create_user_time TIME(0) DEFAULT CAST (GETDATE() AS TIME(0)
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