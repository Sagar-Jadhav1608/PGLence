-- Plant Details
CREATE TABLE plants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(100),
  capacity_tons_per_day NUMERIC(10,2)
);

-- Employees
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  role VARCHAR(50),
  plant_id INTEGER REFERENCES plants(id)
);

-- Shifts (with employee_id)
CREATE TABLE shifts (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id),
  shift_start TIMESTAMP,
  shift_end TIMESTAMP
);

-- Electrolysis Cells
CREATE TABLE cells (
  id SERIAL PRIMARY KEY,
  cell_number VARCHAR(20),
  status VARCHAR(20),
  plant_id INTEGER REFERENCES plants(id)
);

-- Production Logs (matching your 'produced_at' and 'produced_amount_kg')
CREATE TABLE production_logs (
  id SERIAL PRIMARY KEY,
  cell_id INTEGER REFERENCES cells(id),
  produced_at TIMESTAMP,
  produced_amount_kg NUMERIC(10, 2)
);

-- Maintenance Logs (matching your 'maintained_at' and 'notes')
CREATE TABLE maintenance_logs (
  id SERIAL PRIMARY KEY,
  cell_id INTEGER REFERENCES cells(id),
  maintained_at TIMESTAMP,
  notes TEXT
);

-- Materials (matching your 'name' and 'type')
CREATE TABLE materials (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  type VARCHAR(50)
);

-- Material Intake Logs (matching your 'intake_at', 'quantity_kg', 'plant_id')
CREATE TABLE material_intake_logs (
  id SERIAL PRIMARY KEY,
  material_id INTEGER REFERENCES materials(id),
  intake_at TIMESTAMP,
  quantity_kg NUMERIC(10, 2),
  plant_id INTEGER REFERENCES plants(id)
);

-- Sensor Data (matching your 'recorded_at', 'temperature_c', 'voltage', 'current_amp')
CREATE TABLE sensor_data (
  id SERIAL PRIMARY KEY,
  cell_id INTEGER REFERENCES cells(id),
  recorded_at TIMESTAMP,
  temperature_c NUMERIC(6,2),
  voltage NUMERIC(4,2),
  current_amp NUMERIC(10,2)
);




INSERT INTO plants (name, location) VALUES ('Chang-Fisher', 'Tammyfort');
INSERT INTO plants (name, location) VALUES ('Hull-Gallegos', 'Howardborough');
INSERT INTO plants (name, location) VALUES ('Taylor, Taylor and Davis', 'Vanessaside');
INSERT INTO plants (name, location) VALUES ('Patrick, Barrera and Collins', 'Port Gabriellafort');
INSERT INTO plants (name, location) VALUES ('Garcia, Hamilton and Carr', 'New Thomas');
INSERT INTO employees (name, role, plant_id) VALUES ('Debbie Trujillo', 'Technician', 4);
INSERT INTO employees (name, role, plant_id) VALUES ('Alexis Cortez', 'Operator', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Roger Barnett', 'Technician', 4);
INSERT INTO employees (name, role, plant_id) VALUES ('Johnny Dillon', 'Supervisor', 4);
INSERT INTO employees (name, role, plant_id) VALUES ('Frederick Harrell', 'Supervisor', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Keith Allen', 'Engineer', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Regina West', 'Engineer', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Francisco Romero', 'Engineer', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Ashley Arnold', 'Supervisor', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Kimberly Olsen', 'Engineer', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Tracey Morrison', 'Operator', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Jill Carlson', 'Supervisor', 4);
INSERT INTO employees (name, role, plant_id) VALUES ('Kenneth Roberts', 'Operator', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Cody Salazar', 'Technician', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Karen Davis', 'Engineer', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Sherri Mclean', 'Technician', 4);
INSERT INTO employees (name, role, plant_id) VALUES ('Stephanie Leblanc', 'Supervisor', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Jeanne Thornton', 'Operator', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Robert Atkinson', 'Technician', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Leslie Herring', 'Technician', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Joanne Keller', 'Engineer', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Sydney Leon MD', 'Operator', 2);
INSERT INTO employees (name, role, plant_id) VALUES ('Katelyn Mccoy', 'Engineer', 2);
INSERT INTO employees (name, role, plant_id) VALUES ('Dana Dennis', 'Engineer', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Daniel Norton', 'Technician', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Robert Garcia', 'Operator', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Michael Williams', 'Technician', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Susan Ferguson', 'Supervisor', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Alyssa Reid', 'Supervisor', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Laura Myers', 'Supervisor', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('William Johnson', 'Engineer', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Tyler Lopez', 'Supervisor', 4);
INSERT INTO employees (name, role, plant_id) VALUES ('Daniel Owen', 'Operator', 5);
INSERT INTO employees (name, role, plant_id) VALUES ('Allison Coleman', 'Technician', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('David Walker', 'Engineer', 3);
INSERT INTO employees (name, role, plant_id) VALUES ('Hayley White', 'Engineer', 2);
INSERT INTO employees (name, role, plant_id) VALUES ('Amanda Garcia', 'Engineer', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Christina Howard PhD', 'Supervisor', 4);
INSERT INTO employees (name, role, plant_id) VALUES ('Tamara Jackson', 'Operator', 1);
INSERT INTO employees (name, role, plant_id) VALUES ('Tracy Brown', 'Engineer', 2);
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (1, '2025-06-25 06:00:00', '2025-06-25 14:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (1, '2025-06-25 14:00:00', '2025-06-25 22:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (2, '2025-06-25 06:00:00', '2025-06-25 14:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (2, '2025-06-25 14:00:00', '2025-06-25 22:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (3, '2025-06-25 06:00:00', '2025-06-25 14:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (3, '2025-06-25 14:00:00', '2025-06-25 22:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (4, '2025-06-25 06:00:00', '2025-06-25 14:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (4, '2025-06-25 14:00:00', '2025-06-25 22:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (5, '2025-06-25 06:00:00', '2025-06-25 14:00:00');
INSERT INTO shifts (employee_id, shift_start, shift_end) VALUES (5, '2025-06-25 14:00:00', '2025-06-25 22:00:00');
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1001', 'active', 1);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1002', 'active', 1);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1003', 'active', 5);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1004', 'active', 4);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1005', 'active', 5);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1006', 'active', 3);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1007', 'active', 5);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1008', 'active', 2);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1009', 'active', 2);
INSERT INTO cells  (cell_number, status, plant_id) VALUES ('CELL-1010', 'active', 5);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (7, '2025-06-27 07:02:32', 2159.39);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (8, '2025-06-25 17:19:23', 1985.31);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (6, '2025-06-27 19:21:52', 1164.75);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (10, '2025-06-25 17:35:45', 1230.7);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (10, '2025-06-26 06:43:45', 2260.29);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (4, '2025-06-26 20:21:28', 1486.07);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (5, '2025-06-26 00:03:26', 1234.27);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (4, '2025-06-25 14:20:16', 1744.12);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (3, '2025-06-27 01:15:35', 1665.07);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (1, '2025-06-28 00:53:54', 1201.22);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (3, '2025-06-26 14:00:39', 2710.65);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (4, '2025-06-27 06:16:14', 1090.47);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (10, '2025-06-25 18:31:57', 2268.41);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (9, '2025-06-25 06:45:51', 2204.34);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (2, '2025-06-26 16:08:43', 1053.39);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (4, '2025-06-27 07:24:43', 2212.68);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (10, '2025-06-26 11:39:04', 1239.39);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (2, '2025-06-27 23:20:45', 1740.28);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (2, '2025-06-26 23:14:39', 1072.78);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (1, '2025-06-27 21:30:14', 1389.18);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (3, '2025-06-26 18:50:16', 2436.23);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (8, '2025-06-28 00:36:50', 1421.15);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (1, '2025-06-26 04:28:53', 2873.94);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (1, '2025-06-27 05:03:24', 2088.47);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (10, '2025-06-26 07:48:35', 1203.0);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (5, '2025-06-26 10:06:10', 1140.01);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (2, '2025-06-27 18:47:57', 2293.85);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (6, '2025-06-27 05:41:20', 1872.14);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (1, '2025-06-26 00:04:30', 2007.27);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (1, '2025-06-25 16:58:26', 2192.97);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (7, '2025-06-26 22:37:27', 1398.71);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (6, '2025-06-27 08:06:25', 2808.8);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (8, '2025-06-25 06:42:30', 2676.65);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (10, '2025-06-26 15:08:59', 1338.85);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (4, '2025-06-27 11:48:09', 2933.1);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (1, '2025-06-25 11:33:38', 2577.3);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (3, '2025-06-26 06:15:48', 2690.85);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (6, '2025-06-27 11:36:58', 2058.95);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (2, '2025-06-25 09:07:49', 2193.58);
INSERT INTO production_logs (cell_id, produced_at, produced_amount_kg) VALUES (8, '2025-06-26 21:26:20', 2331.21);
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (1, '2025-06-24 22:42:33', 'Drive well good explain.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (8, '2025-06-25 10:06:54', 'Water plant perform resource hold increase practice ability.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (7, '2025-06-24 09:48:35', 'Civil development large report purpose themselves.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (10, '2025-06-23 10:23:48', 'The nothing sign remember close ask.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (9, '2025-06-24 04:46:03', 'Month maintain no sense this manager fine.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (5, '2025-06-26 01:47:55', 'Speak themselves speech.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (6, '2025-06-24 09:10:56', 'Yourself plan base rise would I question.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (7, '2025-06-25 03:50:57', 'Degree response able.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (5, '2025-06-26 10:44:55', 'Best budget power them evidence without beyond take.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (3, '2025-06-25 15:34:33', 'Ball ever laugh society technology card minute practice.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (9, '2025-06-25 08:20:45', 'The everything affect American.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (1, '2025-06-24 19:37:11', 'Fire happen nothing support suffer which parent.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (8, '2025-06-26 05:49:02', 'Policy head Mrs debate onto across character.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (2, '2025-06-25 06:21:32', 'Smile responsibility full per among clearly.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (6, '2025-06-26 18:46:26', 'Guess writer can boy room.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (1, '2025-06-23 12:49:50', 'Conference mission audience idea foreign.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (9, '2025-06-25 18:12:03', 'Between training listen subject.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (5, '2025-06-25 07:51:02', 'Look record interview few.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (3, '2025-06-24 04:28:22', 'Phone heart window police.');
INSERT INTO maintenance_logs (cell_id, maintained_at, notes) VALUES (4, '2025-06-23 15:23:26', 'Cup determine his better.');
INSERT INTO materials (name, type) VALUES ('Bauxite', 'Ore');
INSERT INTO materials (name, type) VALUES ('Cryolite', 'Additive');
INSERT INTO materials (name, type) VALUES ('Alumina', 'Refined');
INSERT INTO materials (name, type) VALUES ('Carbon Anode', 'Consumable');
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-27 23:53:15', 852.23, 3);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (3, '2025-06-27 12:58:24', 1090.28, 5);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-24 18:13:09', 1215.62, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-26 16:27:02', 1328.9, 1);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-27 04:07:23', 1094.58, 3);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-23 21:04:56', 739.42, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-26 09:01:17', 1210.35, 5);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-22 06:10:17', 531.55, 5);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-25 17:05:13', 1272.19, 1);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-23 21:55:21', 945.35, 3);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-24 09:48:00', 946.36, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-23 06:19:22', 1383.88, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (3, '2025-06-26 11:24:18', 812.06, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-23 13:42:38', 1309.05, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-25 14:13:45', 1048.56, 1);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-22 15:18:09', 1486.82, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-22 00:24:09', 816.18, 2);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-21 13:50:50', 1217.32, 1);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-27 14:57:27', 690.46, 5);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-26 17:20:39', 1373.65, 3);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (2, '2025-06-23 16:32:55', 600.18, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-22 16:26:16', 521.85, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-27 06:35:23', 1361.36, 2);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (3, '2025-06-26 01:42:54', 615.11, 2);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (3, '2025-06-24 08:30:28', 1351.24, 1);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-23 18:09:48', 705.74, 3);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (3, '2025-06-21 18:03:56', 1446.5, 5);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (1, '2025-06-23 20:41:11', 1346.36, 5);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-23 00:25:53', 1212.36, 4);
INSERT INTO material_intake_logs (material_id, intake_at, quantity_kg, plant_id) VALUES (4, '2025-06-22 12:16:42', 872.45, 5);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-26 20:13:06', 872.86, 5.09, 100444.85);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-27 15:10:58', 879.85, 4.84, 118360.07);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (2, '2025-06-27 09:19:48', 887.21, 5.12, 102060.15);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-27 08:08:12', 866.44, 5.08, 118045.33);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (9, '2025-06-27 21:35:23', 864.26, 4.61, 136526.09);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (1, '2025-06-26 16:49:21', 883.87, 5.36, 136433.04);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (5, '2025-06-26 13:25:48', 894.35, 4.83, 120736.08);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (2, '2025-06-28 01:13:10', 911.69, 4.98, 116854.03);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-27 17:19:50', 863.68, 4.62, 124886.73);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (1, '2025-06-26 16:36:32', 883.21, 5.23, 144719.99);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-27 22:51:54', 918.94, 4.88, 148728.03);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (2, '2025-06-27 11:21:36', 857.24, 4.58, 137493.48);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (1, '2025-06-28 04:17:13', 892.33, 4.6, 127823.73);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (5, '2025-06-27 12:37:19', 899.34, 4.99, 129244.44);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (4, '2025-06-27 19:45:26', 896.53, 4.87, 149422.95);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (5, '2025-06-27 17:52:37', 914.38, 4.67, 109597.25);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (2, '2025-06-27 05:17:01', 857.02, 5.36, 135100.21);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (9, '2025-06-27 18:05:53', 899.68, 5.18, 105945.51);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (7, '2025-06-27 18:06:47', 878.21, 5.14, 149852.02);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (4, '2025-06-28 04:02:48', 918.58, 4.6, 122920.4);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-26 20:30:40', 910.1, 4.65, 149434.49);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (8, '2025-06-27 21:19:44', 866.32, 4.91, 133996.47);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (9, '2025-06-28 02:12:17', 904.49, 5.42, 116123.02);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (8, '2025-06-26 21:44:00', 959.8, 5.14, 143734.95);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (9, '2025-06-26 06:30:34', 917.07, 4.72, 117011.02);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-27 06:34:36', 939.99, 4.54, 107418.34);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (5, '2025-06-27 04:58:39', 916.28, 4.66, 118950.26);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (5, '2025-06-27 05:14:14', 928.99, 5.31, 103317.96);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (2, '2025-06-26 08:23:07', 906.82, 5.42, 103317.73);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-27 20:02:23', 854.47, 4.52, 142197.73);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-26 16:36:23', 944.81, 5.3, 143434.78);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (8, '2025-06-27 00:30:30', 956.55, 5.0, 145054.52);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (9, '2025-06-28 01:40:54', 853.7, 4.59, 139707.26);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (9, '2025-06-26 17:09:19', 933.36, 5.49, 137348.27);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (4, '2025-06-27 09:24:03', 881.86, 5.4, 120892.03);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (8, '2025-06-28 00:15:06', 943.0, 5.47, 130371.5);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (4, '2025-06-27 03:14:20', 943.64, 5.3, 132849.23);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (1, '2025-06-27 16:03:30', 931.48, 4.8, 128513.33);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-26 10:38:05', 857.22, 5.36, 147147.35);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (5, '2025-06-26 11:57:58', 934.97, 4.88, 119183.97);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-27 19:24:54', 920.51, 4.63, 114354.42);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-26 08:40:22', 856.11, 4.54, 120893.3);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (8, '2025-06-26 10:38:04', 947.9, 5.1, 104080.98);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-26 22:11:36', 939.13, 4.85, 101758.99);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (8, '2025-06-26 15:18:18', 892.54, 4.55, 123544.46);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (3, '2025-06-26 08:45:41', 852.23, 5.1, 106635.1);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-27 03:40:50', 861.58, 5.05, 117333.4);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (7, '2025-06-26 06:54:56', 936.18, 5.28, 105549.85);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (1, '2025-06-27 14:28:04', 917.11, 4.97, 131615.63);
INSERT INTO sensor_data (cell_id, recorded_at, temperature_c, voltage, current_amp) VALUES (6, '2025-06-27 05:52:33', 921.55, 5.47, 135680.84);