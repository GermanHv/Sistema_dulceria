CREATE TABLE Devoluciones (
    id_devolucion INT IDENTITY(1,1) NOT NULL,

    id_venta INT NOT NULL,     -- ¿Qué ticket se está reclamando?
    id_corte INT NOT NULL,     -- ¡VITAL! Afecta el dinero de la caja ACTUAL
    id_cliente INT NOT NULL,   -- Para historial de fraude
    id_empleado INT NOT NULL,  -- El Gerente que autoriza
    
    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,

    tipo_devolucion VARCHAR(20) NOT NULL,
    monto_reembolsado DECIMAL(10,2) NOT NULL, -- Total de dinero que salió de la caja
    fecha_devolucion DATETIME DEFAULT GETDATE(),
    observaciones VARCHAR(255),

    -- AUDITORÍA
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- CONSTRAINTS
    CONSTRAINT PK_Devoluciones PRIMARY KEY (id_devolucion),
    
    -- CONSTRAINT FK_Devoluciones_Venta FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    -- CONSTRAINT FK_Devoluciones_Corte FOREIGN KEY (id_corte) REFERENCES Corte_Caja(id_corte),
    -- CONSTRAINT FK_Devoluciones_Cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    -- CONSTRAINT FK_Devoluciones_Empresa FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    -- CONSTRAINT FK_Devoluciones_Sucursal FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    CONSTRAINT CHK_Tipo_Devolucion CHECK (tipo_devolucion IN ('Efectivo', 'Tarjeta', 'Vales', 'Cambio Fisico'))
);

CREATE TABLE Detalle_Devoluciones (
    id_detalle_devolucion INT IDENTITY(1,1) NOT NULL,

    -- RELACIÓN PADRE (Corrección: Apuntamos a la Devolución, no solo a la Venta)
    id_devolucion INT NOT NULL, 

    -- PRODUCTO
    id_proveedor INT NOT NULL,
    id_producto INT NOT NULL,  -- Qué devolvió
    -- Si quieres guardar el nombre por si borras el producto del catálogo (opcional)
    -- Con este ID, el sistema viaja al pasado y sabe qué producto es y cuánto costó.
    id_detalle_venta INT NOT NULL,
    cantidad INT NOT NULL,
    -- 'Apto' = Regresa a Inventario (Stock +1)
    -- 'Danado' = Se va a Merma (Stock no cambia, o va a tabla Mermas)
    estado_producto VARCHAR(20) NOT NULL,
    motivo_especifico VARCHAR(100),

    id_empresa INT NOT NULL,
    id_sucursal INT NOT NULL,
   
    -- Auditoría
    clave_usuario_u VARCHAR(50) NOT NULL,
    Create_date DATE DEFAULT CAST(GETDATE() AS DATE),
    Create_time TIME(0) DEFAULT CAST(GETDATE() AS TIME(0)),

    -- CONSTRAINTS
    CONSTRAINT PK_Detalle_Devoluciones PRIMARY KEY (id_detalle_devolucion),
    
    -- Si borras el encabezado, se borran los detalles
    CONSTRAINT FK_Det_Dev_Padre FOREIGN KEY (id_devolucion) REFERENCES Devoluciones(id_devolucion) ON DELETE CASCADE,
    
    -- CONSTRAINT FK_Det_Dev_VentaOriginal FOREIGN KEY (id_detalle_venta) REFERENCES Detalle_Ventas(id_detalle_venta),
    -- CONSTRAINT FK_Det_Dev_Producto FOREIGN KEY (id_producto) REFERENCES Inventario(id_inventario),
    -- CONSTRAINT FK_Det_Dev_Empresa FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa),
    -- CONSTRAINT FK_Det_Dev_Sucursal FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    CONSTRAINT CHK_Estado_Prod CHECK (estado_producto IN ('Apto', 'Danado', 'Defecto'))
);