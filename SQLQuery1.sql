/* Создание таблицы контейнеров */
CREATE TABLE containers (
    id				UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    number			INT,
    container_type	VARCHAR(50),
    length			INT,
    width			INT,
    height			INT,
    weight			INT,
    empty_status	BIT,
    receipt_date	DATETIME
);

/* Заполнение таблицы контейнеров тестовыми данными*/
INSERT INTO containers (number, container_type, length, width, height, weight, empty_status, receipt_date)
VALUES (13462, '20'' DRY CONTAINER', 5898, 2350, 2390, 2200, 0, '20221012 01:01:01 AM'),
	   (20273, '40'' DRY CONTAINER', 12035, 2359, 2393, 3700, 0, '20221006 01:01:01 AM'),
	   (33472, '40'' REEFER CONTAINER', 11577, 2294, 2210, 3950, 0, '20220930 01:01:01 AM'),
	   (47235, 'OPEN TOP CONTAINER', 5893, 2346, 2353, 2200, 0, '20220823 01:01:01 AM'),
	   (56920, 'FLAT RACK CONTAINER', 5935, 2398, 2327, 2560, 0, '20220814 01:01:01 AM'),
	   (60159, '20'' TANK CONTAINER', 6058, 2436, 2576, 9600, 0, '20220725 01:01:01 AM');

/* Создание таблицы операций */
CREATE TABLE operations (
    id				UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    container_id	UNIQUEIDENTIFIER FOREIGN KEY REFERENCES containers(id),
    begin_date		DATETIME,
    end_date		DATETIME,
    operation_type	VARCHAR(50),
    operator		VARCHAR(50),
    inspection_addr	VARCHAR(50),
);

/* Заполнение таблицы операций тестовыми данными*/
INSERT INTO operations (container_id, begin_date, end_date, operation_type, operator, inspection_addr)
VALUES ((SELECT TOP 1 id FROM containers), '20220714 01:01:01 AM', '20220715 01:01:01 AM', 'Cargo loading', 'Joaquin Ramirez', 'Tokio'),
	   ((SELECT TOP 1 id FROM containers), '20220716 01:01:01 AM', '20221012 01:01:01 AM', 'Shipment', 'Krystal Conrad', 'Tokio'),
	   ((SELECT TOP 1 id FROM containers), '20221012 01:01:01 AM', '20221013 01:01:01 AM', 'Cargo unloading', 'Zander Stuart', 'Seul');

/* Запрос, выбирающий из первой таблицы все данные по контейнерам в формате JSON */
SELECT *
  FROM containers
FOR JSON AUTO;

/* Запрос, выбирающий из второй таблицы все данные по операциям для определенного контейнера в формате JSON */
SELECT *
  FROM operations
 WHERE container_id = (SELECT TOP 1 id FROM containers)
FOR JSON AUTO;