CREATE TABLE clientes (
    cliente_id  SERIAL PRIMARY KEY,
    email       VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE productos (
    producto_id  SERIAL PRIMARY KEY,
	nombre_producto VARCHAR(100) NOT NULL,
	precio DECIMAL(10,2) CHECK (precio > 0),
	categoria VARCHAR(50),
	stock INT CHECK (stock >= 0)

);

CREATE TABLE ventas (
    venta_id     SERIAL PRIMARY KEY,
    cliente_id   INT REFERENCES clientes(cliente_id),
    producto_id  INT REFERENCES productos(producto_id),
	cantidad     INT CHECK (cantidad > 0),
    fecha_venta  DATE
);

BEGIN;

INSERT INTO clientes (email)
VALUES
('ana@gmail.com'),('luis@gmail.com'),('carla@gmail.com'),('pedro@gmail.com'),('sofia@gmail.com');

INSERT INTO productos (nombre_producto, precio, categoria, stock)
VALUES
('Collar', 32500.00, 'Cadenas', 10),('Pulsera', 27000.00, 'Cadenas', 12),('Anillo', 15500.00, 'Anillos', 6),('Tobillera', 19100.00, 'Cadenas', 20),('Aros', 35000.00, 'Aros', 9);

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha_venta)
VALUES
(1, 1, 1, '2026-11-01'),
(2, 3, 2, '2026-11-02'),
(3, 2, 1, '2026-11-03'),
(4, 5, 1, '2026-11-04'),
(5, 4, 3, '2026-11-05'),
(1, 2, 1, '2026-11-06');   -- venta de prueba (se borra abajo)

COMMIT;

SELECT * FROM productos
WHERE categoria = 'Cadenas';

BEGIN;
UPDATE productos SET precio = precio * 1.05
WHERE categoria = 'Cadenas';
COMMIT;

SELECT * FROM ventas WHERE venta_id = 6;

DELETE FROM ventas
WHERE venta_id = 6;