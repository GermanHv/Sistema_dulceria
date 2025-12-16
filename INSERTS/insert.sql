USE Ventas_dulceria;
GO

-- =============================================
-- 1. ESTRUCTURA EMPRESARIAL (Admin: 1APELJ)
-- =============================================

-- 1. EMPRESAS
INSERT INTO Empresas (nombre_comercial, empresa_direccion, razon_social, rfc, regimen_fiscal, codigo_postal_fiscal, logo_url, website, telefono_contacto, clave_usuario_u)
VALUES
('Dulces La Golosa',    'Av. Reforma 123, CDMX',         'Dulces La Golosa SA de CV',   'DUL800101AAA', '601 - General de Ley',   '06600', 'logo1.png', 'www.lagolosa.com',   '5512345678', '1APELJ'),
('Caramelos del Norte', 'Calle Industria 45, Monterrey', 'Caramelos del Norte S de RL', 'CDN900202BBB', '601 - General de Ley',   '64000', 'logo2.png', 'www.nortedulce.com', '8112345678', '1APELJ'),
('Chocolates Finos',    'Blvd. Atlixco 99, Puebla',      'Chocolates Finos SA',         'CHO100303CCC', '603 - Personas Morales', '72000', 'logo3.png', 'www.chocofinos.com', '2222345678', '1APELJ'),
('Distribuidora Sugar', 'Calle 5 de Mayo, Merida',       'Sugar Dist SA de CV',         'SUG200404DDD', '601 - General de Ley',   '97000', 'logo4.png', 'www.sugar.com',      '9992345678', '1APELJ'),
('Gomitas y Mas',       'Av. Vallarta 88, Guadalajara',  'Gomitas Gdl SA',              'GOM300505EEE', '626 - Simplificado',     '44100', 'logo5.png', 'www.gomitas.com',    '3332345678', '1APELJ');

-- 2. SUCURSALES
INSERT INTO Sucursal (id_empresa, clave_usuario_u)
VALUES
(1, '1APELJ'),
(1, '1APELJ'),
(2, '1APELJ'),
(3, '1APELJ'),
(4, '1APELJ');

-- DETALLE SUCURSALES
INSERT INTO DetalleSucursales (nombre_sucursal, direccion, telefono, clave_usuario_u)
VALUES
('Matriz Centro',    'Av. Reforma 123',     '5511112222', '1APELJ'),
('Sucursal Sur',     'Av. Insurgentes 400', '5533334444', '1APELJ'),
('Bodega Norte',     'Ind. Monterrey 45',   '8155556666', '1APELJ'),
('Puebla Centro',    'Blvd Atlixco 99',     '2227778888', '1APELJ'),
('Merida Altabrisa', 'Calle 5 de Mayo',     '9990001111', '1APELJ');

-- 3. MODULOS
INSERT INTO Modulos (id_empresa, id_sucursal, nom_modulo, descripcion_modulo, clave_usuario_u)
VALUES
(1, 1, 'Ventas',        'Modulo de punto de venta', '1APELJ'),
(1, 1, 'Compras',       'Adquisición de mercancía', '1APELJ'),
(1, 1, 'Inventario',    'Control de stock',         '1APELJ'),
(1, 1, 'RH',            'Recursos Humanos',         '1APELJ'),
(1, 1, 'Configuracion', 'Ajustes del sistema',      '1APELJ');

-- 4. SUBMODULOS
INSERT INTO Submodulos (id_modulo, nom_submodulo, descripcion_submodulo, clave_usuario_u)
VALUES
(1, 'Nueva Venta',     'Pantalla de cobro',    '1APELJ'),
(1, 'Corte de Caja',   'Cierre de turno',      '1APELJ'),
(2, 'Orden de Compra', 'Solicitar pedido',     '1APELJ'),
(3, 'Ajuste Stock',    'Entradas y salidas',   '1APELJ'),
(4, 'Nomina',          'Pago a empleados',     '1APELJ');

-- =============================================
-- 2. RECURSOS HUMANOS (Admin: 1APELJ)
-- =============================================

-- 5. ROLES (TipoEmpleado)
-- Nota: id_empleado se asigna a 1 temporalmente para inicialización.
INSERT INTO TipoEmpleado (id_empleado, nombre_rol, descripcion_Templeado, id_modulo, clave_usuario_u)
VALUES
(1, 'Administrador', 'Acceso total',          5, '1APELJ'),
(1, 'Cajero',        'Solo ventas',           1, '1APELJ'),
(1, 'Almacenista',   'Inventarios y compras', 3, '1APELJ'),
(1, 'Gerente',       'Reportes y cortes',     1, '1APELJ'),
(1, 'Contador',      'Facturacion y nomina',  4, '1APELJ');

-- 6. EMPLEADOS
INSERT INTO Empleado (id_rol, id_empresa, id_sucursal, nombre_empleado, apellido_p_e, apellido_m_e, rfc, telefono, correo, tipo, active, clave_usuario_u)
VALUES
(1, 1, 1, 'Juan',  'Perez',     'Lopez', 'PELJ800101', '5500000001', 'juan@lagolosa.com',  1, 1, '1APELJ'),
(2, 1, 1, 'Maria', 'Gomez',     'Ruiz',  'GORM900202', '5500000002', 'maria@lagolosa.com', 1, 1, '1APELJ'),
(3, 1, 1, 'Pedro', 'Ramirez',   'Soto',  'RASP850303', '5500000003', 'pedro@lagolosa.com', 1, 1, '1APELJ'),
(4, 1, 2, 'Ana',   'Torres',    'Diaz',  'TODA880404', '5500000004', 'ana@lagolosa.com',   1, 1, '1APELJ'),
(2, 1, 2, 'Luis',  'Hernandez', 'Paz',   'HEPL920505', '5500000005', 'luis@lagolosa.com',  1, 1, '1APELJ');

-- 7. USUARIOS
-- Asignación de claves reales de login.
INSERT INTO Usuarios (id_rol, id_empresa, id_sucursal, nombre_user, pass_user, type, active, clave_usuario, clave_usuario_u)
VALUES
(1, 1, 1, 'admin',       'pass123', 1, 1, '1APELJ', '1APELJ'),
(2, 1, 1, 'caja1',       'pass123', 2, 1, '2AGORM', '1APELJ'),
(3, 1, 1, 'bodega',      'pass123', 2, 1, '3PRAM',  '1APELJ'),
(4, 1, 2, 'gerente_sur', 'pass123', 1, 1, '4ATORD', '1APELJ'),
(2, 1, 2, 'caja2',       'pass123', 2, 1, '5LHERN', '1APELJ');

-- =============================================
-- 3. INVENTARIO (Almacenista: 3PRAM)
-- =============================================

-- 8. CATEGORIAS
INSERT INTO Categorias (nombre_categoria, clave_usuario_u)
VALUES
('Chocolates',        '3PRAM'),
('Dulces Enchilados', '3PRAM'),
('Gomitas a Granel',  '3PRAM'),
('Bebidas y Jugos',   '3PRAM'),
('Botanas Saladas',   '3PRAM');

-- 9. PROVEEDORES
INSERT INTO Proveedores (nombre_proveedor, rfc_prov, telefono, correo, dias_entrega_estimado, clave_usuario_u)
VALUES
('Dulces Vero',     'VER800101000', '5511223344', 'ventas@vero.com',      3, '3PRAM'),
('Barcel',          'BAR900202111', '5599887766', 'contacto@barcel.com',  5, '3PRAM'),
('Ricolino',        'RIC700303222', '5544332211', 'pedidos@ricolino.com', 2, '3PRAM'),
('De la Rosa',      'DLR600404333', '3311223344', 'ventas@delarosa.com',  7, '3PRAM'),
('Coca Cola',       'KO900505444',  '5500011122', 'mx@coca-cola.com',     1, '3PRAM');

-- 10. CATALOGO PROVEEDORES
INSERT INTO Catalogo_proveedores (id_proveedor, nombre_producto, codigo_barras, costo_unitario, tipounidad, clave_usuario_u)
VALUES
(4, 'Mazapan Gigante',   '75010001', 5.50,  'Pieza',      '3PRAM'),
(1, 'Paleta Tarrito',    '75010002', 2.00,  'Bolsa 50pz', '3PRAM'),
(3, 'Panditas Clasicos', '75010003', 12.00, 'Bolsa 60g',  '3PRAM'),
(2, 'Papas Fritas Sal',  '75010004', 15.00, 'Bolsa',      '3PRAM'),
(5, 'Coca Cola 600ml',   '75010005', 14.00, 'Botella',    '3PRAM');

-- 11. INVENTARIO
INSERT INTO Inventario (id_categoria, id_proveedor, id_empresa, id_sucursal, codigo_barras, nom_producto, precio_venta_publico, tipo_unidad, stock_min, stock_actual, clave_usuario_u)
VALUES
(1, 4, 1, 1, '75010001', 'Mazapan Gigante',   10.00, 'Pieza',   50, 200, '3PRAM'),
(2, 1, 1, 1, '75010002', 'Paleta Tarrito',    45.00, 'Bolsa',   10, 50,  '3PRAM'),
(3, 3, 1, 1, '75010003', 'Panditas Clasicos', 18.00, 'Bolsa',   20, 100, '3PRAM'),
(5, 2, 1, 1, '75010004', 'Papas Fritas Sal',  22.00, 'Bolsa',   15, 80,  '3PRAM'),
(4, 5, 1, 1, '75010005', 'Coca Cola 600ml',   19.00, 'Botella', 24, 120, '3PRAM');

-- =============================================
-- 4. OPERACIONES Y VENTAS
-- (Cajero 1: 2AGORM | Cajero 2: 5LHERN)
-- =============================================

-- 12. CLIENTES (Registrados por Admin o Cajeros)
INSERT INTO Clientes (id_empresa, id_sucursal, nombre_cliente, apellidos, telefono_1, correo, password_cliente, clave_usuario_u)
VALUES
(1, 1, 'Publico', 'General', '0000000000', 'publico@general.com', 'na',   '1APELJ'),
(1, 1, 'Carlos',  'Slim',    '5512312312', 'carlos@mail.com',     'pass', '1APELJ'),
(1, 1, 'Maria',   'Felix',   '5598765432', 'maria@mail.com',      'pass', '1APELJ'),
(1, 1, 'Pedro',   'Infante', '5511111111', 'pedro@mail.com',      'pass', '1APELJ'),
(1, 1, 'Frida',   'Kahlo',   '5522222222', 'frida@mail.com',      'pass', '1APELJ');

-- 13. DATOS DE FACTURACION
INSERT INTO Facturacion_Clientes (id_cliente, id_empresa, id_sucursal, rfc, razon_social, regimen_fiscal, cp_fiscal, correo_facturacion, calle, colonia, numero_direccion, municipio, clave_usuario_u)
VALUES
(2, 1, 1, 'XAXX010101000', 'Carlos Slim SA',  '601', '11000', 'facturas@carlos.com', 'Palmas',   'Lomas',    '100', 'Miguel Hidalgo', '1APELJ'),
(3, 1, 1, 'XAXX010101001', 'Maria Felix Inc', '603', '12000', 'conta@maria.com',     'Reforma',  'Centro',   '200', 'Cuauhtemoc',     '1APELJ'),
(4, 1, 1, 'XAXX010101002', 'Pedro Infante SC','612', '13000', 'sat@pedro.com',       'Juarez',   'Centro',   '300', 'Coyoacan',       '1APELJ'),
(5, 1, 1, 'XAXX010101003', 'Frida Kahlo AC',  '603', '14000', 'art@frida.com',       'Londres',  'Coyoacan', '400', 'Coyoacan',       '1APELJ'),
(1, 1, 1, 'XAXX010101000', 'Publico General', '616', '00000', 'sin@correo.com',      'Conocido', 'Centro',   '0',   'CDMX',           '1APELJ');

-- 14. CAJA
INSERT INTO Caja (id_empresa, id_sucursal, nombre_caja, active, clave_usuario_u)
VALUES
(1, 1, 'Caja Principal', 1, '1APELJ'),
(1, 1, 'Caja Dulceria',  1, '1APELJ'),
(1, 1, 'Caja Isla',      1, '1APELJ'),
(1, 2, 'Caja Sur 1',     1, '4ATORD'),
(1, 2, 'Caja Sur 2',     1, '4ATORD');

-- 15. CORTE DE CAJA
INSERT INTO Corte_caja (id_empleado, id_caja, id_empresa, id_sucursal, saldo_inicial, saldo_final, saldo_final_sistema, diferencia, clave_usuario_u)
VALUES
(2, 1, 1, 1, 500.00,  2500.00, 2500.00, 0.00,   '2AGORM'),
(2, 1, 1, 1, 500.00,  1500.00, 1500.00, 0.00,   '2AGORM'),
(2, 1, 1, 1, 500.00,  3000.00, 2950.00, -50.00, '2AGORM'),
(5, 4, 1, 2, 1000.00, 5000.00, 5000.00, 0.00,   '5LHERN'),
(5, 4, 1, 2, 1000.00, 4500.00, 4500.00, 0.00,   '5LHERN');

-- 16. DETALLE DE PAGOS (Debe insertarse previo a Venta por dependencia circular en esquema original)
-- Se asume id_venta 1-5 basado en orden de inserción posterior.
INSERT INTO Detalle_Pagos_Ventas (id_venta, monto_pagado, metodo_pago, referencia, cambio_entregado, id_empresa, id_sucursal, clave_usuario_u)
VALUES
(1, 50.00,  'Efectivo',       NULL,         0.00,  1, 1, '2AGORM'),
(2, 100.00, 'Efectivo',       NULL,         0.00,  1, 1, '2AGORM'),
(3, 25.00,  'Efectivo',       NULL,         0.00,  1, 1, '2AGORM'),
(4, 200.00, 'Tarjeta Debito', 'REF-998877', 0.00,  1, 2, '5LHERN'),
(5, 150.00, 'Efectivo',       NULL,         50.00, 1, 2, '5LHERN');

-- 17. VENTAS (Cabecera)
INSERT INTO Ventas (id_empresa, id_sucursal, id_empleado, id_cliente, id_caja, id_corte, id_dpv, folio_interno, fecha, total_venta, clave_usuario_u)
VALUES
(1, 1, 2, 1, 1, 1, 1, 'V-00001', '2025-01-01', 50.00,  '2AGORM'),
(1, 1, 2, 2, 1, 1, 2, 'V-00002', '2025-01-01', 100.00, '2AGORM'),
(1, 1, 2, 1, 1, 2, 3, 'V-00003', '2025-01-02', 25.00,  '2AGORM'),
(1, 2, 5, 3, 4, 4, 4, 'V-00004', '2025-01-02', 200.00, '5LHERN'),
(1, 2, 5, 1, 4, 5, 5, 'V-00005', '2025-01-03', 150.00, '5LHERN');

-- 18. DETALLE VENTAS
INSERT INTO Detalle_Ventas (id_venta, id_producto, id_empresa, id_sucursal, cantidad, precio_unitario, subtotal, clave_usuario_u)
VALUES
(1, 1, 1, 1, 5,  10.00, 50.00,  '2AGORM'),
(2, 3, 1, 1, 5,  18.00, 90.00,  '2AGORM'),
(3, 4, 1, 1, 1,  22.00, 22.00,  '2AGORM'),
(4, 5, 1, 2, 10, 19.00, 190.00, '5LHERN'),
(5, 2, 1, 2, 3,  45.00, 135.00, '5LHERN');

-- =============================================
-- 5. COMPRAS Y NOMINA (Almacen: 3PRAM | Admin: 1APELJ)
-- =============================================

-- 19. COMPRAS
INSERT INTO Compras (id_empresa, id_sucursal, folio_factura_proveedor, cantidad_productos_total, IVA_total, costo_total, estatus, clave_usuario_u)
VALUES
(1, 1, 'FAC-1001', 100, 160.00, 1160.00, 'Recibido',  '3PRAM'),
(1, 1, 'FAC-1002', 50,  80.00,  580.00,  'Pendiente', '3PRAM'),
(1, 1, 'FAC-1003', 200, 320.00, 2320.00, 'Pagado',    '3PRAM'),
(1, 2, 'FAC-2001', 100, 160.00, 1160.00, 'Recibido',  '4ATORD'), -- Gerente recibe en suc 2
(1, 2, 'FAC-2002', 10,  16.00,  116.00,  'Recibido',  '4ATORD');

-- 20. DETALLE COMPRA
INSERT INTO DetalleCompra (id_compra, id_proveedor, id_producto, id_empresa, id_sucursal, cant_prod, sub_total, iva, clave_usuario_u)
VALUES
(1, 4, 1, 1, 1, 100, 550.00,  88.00,  '3PRAM'),
(2, 1, 2, 1, 1, 50,  100.00,  16.00,  '3PRAM'),
(3, 3, 3, 1, 1, 200, 2400.00, 384.00, '3PRAM'),
(4, 2, 4, 1, 2, 100, 1500.00, 240.00, '4ATORD'),
(5, 5, 5, 1, 2, 10,  140.00,  22.40,  '4ATORD');

-- 21. CATALOGO DE PAGOS
INSERT INTO catalogo_pagos (id_empresa, id_sucursal, nombre_pago, descripcion, monto_base, activo, clave_usuario_u)
VALUES
(1, 1, 'Sueldo Base Semanal', 'Pago ordinario',  2500.00, 1, '1APELJ'),
(1, 1, 'Bono Puntualidad',    'Llegar a tiempo', 200.00,  1, '1APELJ'),
(1, 1, 'Horas Extra',         'Pago por hora',   50.00,   1, '1APELJ'),
(1, 1, 'Vales Despensa',      'Prestacion',      500.00,  1, '1APELJ'),
(1, 1, 'Descuento Faltas',    'Deduccion',       0.00,    1, '1APELJ');

-- 22. PERIODO
INSERT INTO Periodo (descripcion_periodo, clave_usuario_u)
VALUES
('Semana 1 Enero 2025',  '1APELJ'),
('Semana 2 Enero 2025',  '1APELJ'),
('Semana 3 Enero 2025',  '1APELJ'),
('Semana 4 Enero 2025',  '1APELJ'),
('Quincena 1 Enero 2025','1APELJ');

-- 23. NOMINA
INSERT INTO Nomina (id_empresa, id_sucursal, id_empleado, id_detalle_pago, id_periodo, monto_final, clave_usuario_u)
VALUES
(1, 1, 1, 1, 1, 3200.00, '1APELJ'),
(1, 1, 2, 1, 1, 2700.00, '1APELJ'),
(1, 1, 3, 1, 1, 2500.00, '1APELJ'),
(1, 2, 4, 1, 1, 3500.00, '1APELJ'),
(1, 2, 5, 1, 1, 2600.00, '1APELJ');

-- 24. DETALLE DE NOMINA
INSERT INTO Detalledenomina (id_nomina, nom_pago, id_empresa, id_sucursal, id_periodo, sub_monto, clave_usuario_u)
VALUES
(1, 'Sueldo Base', 1, 1, 1, 2500.00, '1APELJ'),
(2, 'Sueldo Base', 1, 1, 1, 2500.00, '1APELJ'),
(3, 'Sueldo Base', 1, 1, 1, 2500.00, '1APELJ'),
(4, 'Sueldo Base', 1, 2, 1, 2500.00, '1APELJ'),
(5, 'Sueldo Base', 1, 2, 1, 2500.00, '1APELJ');

-- =============================================
-- 6. FACTURACION Y DEVOLUCIONES (Gerente: 4ATORD)
-- =============================================

-- 25. DETALLES FACTURAS
INSERT INTO Detallesfacturas (id_venta, id_datos_facturacion, id_empresa, id_sucursal, uuid, monto_total, archivo_xml, archivo_pdf, clave_usuario_u)
VALUES
(2, 1, 1, 1, 'UUID-001-ABC', 100.00, 'fac1.xml', 'fac1.pdf', '1APELJ'),
(3, 2, 1, 1, 'UUID-002-DEF', 25.00,  'fac2.xml', 'fac2.pdf', '1APELJ'),
(4, 3, 1, 2, 'UUID-003-GHI', 200.00, 'fac3.xml', 'fac3.pdf', '1APELJ'),
(5, 4, 1, 2, 'UUID-004-JKL', 150.00, 'fac4.xml', 'fac4.pdf', '1APELJ'),
(1, 5, 1, 1, 'UUID-005-MNO', 50.00,  'fac5.xml', 'fac5.pdf', '1APELJ');

-- 26. DEVOLUCIONES
INSERT INTO Devoluciones (id_venta, id_corte, id_cliente, id_empleado, id_empresa, id_sucursal, tipo_devolucion, monto_reembolsado, observaciones, clave_usuario_u)
VALUES
(1, 1, 1, 4, 1, 1, 'Efectivo',      10.00, 'Cliente devolvió 1 mazapán por error de compra', '4ATORD'),
(2, 1, 2, 4, 1, 1, 'Efectivo',      18.00, 'Bolsa de panditas rota',                         '4ATORD'),
(4, 4, 3, 4, 1, 2, 'Tarjeta',       19.00, 'Coca Cola sin gas, reembolso a tarjeta',         '4ATORD'),
(5, 5, 1, 4, 1, 2, 'Cambio Fisico', 0.00,  'Cambio de sabor de paletas (Mismo precio)',      '4ATORD'),
(3, 2, 1, 4, 1, 1, 'Vales',         22.00, 'Papas caducadas, se entrega vale de tienda',     '4ATORD');

-- 27. DETALLE DEVOLUCIONES
INSERT INTO Detalle_Devoluciones (id_devolucion, id_proveedor, id_producto, id_detalle_venta, cantidad, estado_producto, motivo_especifico, id_empresa, id_sucursal, clave_usuario_u)
VALUES
(1, 4, 1, 1, 1, 'Apto',    'Error del cliente al elegir',         1, 1, '4ATORD'),
(2, 3, 3, 2, 1, 'Danado',  'Empaque abierto al momento de venta', 1, 1, '4ATORD'),
(3, 5, 5, 4, 1, 'Defecto', 'Producto sin gas',                    1, 2, '4ATORD'),
(4, 1, 2, 5, 1, 'Apto',    'Cambio por otro sabor',               1, 2, '4ATORD'),
(5, 2, 4, 3, 1, 'Danado',  'Producto caducado en estante',        1, 1, '4ATORD');