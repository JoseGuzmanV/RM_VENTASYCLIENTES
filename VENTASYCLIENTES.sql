
CREATE DATABASE VENTASYCLIENTES;
GO

USE VENTASYCLIENTES;
GO

CREATE TABLE CLIENTE (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(150) NOT NULL,
    direccion NVARCHAR(250)
);
GO

CREATE TABLE TELEFONO (
    id_telefono INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    telefono NVARCHAR(30) NOT NULL,
    CONSTRAINT FK_Telefono_Cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);
GO

CREATE TABLE PROVEEDOR (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(150) NOT NULL,
    direccion NVARCHAR(250)
);
GO

CREATE TABLE PRODUCTO (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre_producto NVARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria NVARCHAR(100),
    id_proveedor INT NOT NULL,
    CONSTRAINT FK_Producto_Proveedor FOREIGN KEY (id_proveedor) REFERENCES PROVEEDOR(id_proveedor)
);
GO

CREATE TABLE PEDIDO (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
    -- precio_total removido para evitar redundancia
);
GO

CREATE TABLE DETALLE_PEDIDO (
    id_detalle INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT FK_Detalle_Pedido FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    CONSTRAINT FK_Detalle_Producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);
