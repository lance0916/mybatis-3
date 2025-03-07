--
--    Copyright 2009-2019 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

DROP SCHEMA IF EXISTS mbtest CASCADE;

CREATE SCHEMA mbtest;

CREATE TABLE mbtest.order_detail
(
    order_id         INTEGER               NOT NULL,
    line_number      INTEGER               NOT NULL,
    quantity         INTEGER               NOT NULL,
    item_description CHARACTER VARYING(50) NOT NULL,
    CONSTRAINT order_detail_pkey PRIMARY KEY (order_id, line_number)
)
WITH (
    OIDS= FALSE
);

ALTER TABLE mbtest.order_detail OWNER TO postgres;

CREATE TABLE mbtest.order_header
(
    order_id  INTEGER               NOT NULL,
    cust_name CHARACTER VARYING(50) NOT NULL,
    CONSTRAINT order_header_pkey PRIMARY KEY (order_id)
)
WITH (
    OIDS= FALSE
);

ALTER TABLE mbtest.order_header OWNER TO postgres;

INSERT INTO mbtest.order_header(order_id, cust_name)
VALUES (1, 'Fred');
INSERT INTO mbtest.order_header(order_id, cust_name)
VALUES (2, 'Barney');

INSERT INTO mbtest.order_detail(order_id, line_number, quantity, item_description)
VALUES (1, 1, 1, 'Pen');
INSERT INTO mbtest.order_detail(order_id, line_number, quantity, item_description)
VALUES (1, 2, 3, 'Pencil');
INSERT INTO mbtest.order_detail(order_id, line_number, quantity, item_description)
VALUES (1, 3, 2, 'Notepad');
INSERT INTO mbtest.order_detail(order_id, line_number, quantity, item_description)
VALUES (2, 1, 1, 'Compass');
INSERT INTO mbtest.order_detail(order_id, line_number, quantity, item_description)
VALUES (2, 2, 1, 'Protractor');
INSERT INTO mbtest.order_detail(order_id, line_number, quantity, item_description)
VALUES (2, 3, 2, 'Pencil');

-- @DELIMITER |

CREATE
OR
REPLACE FUNCTION mbtest.get_order(order_number INTEGER)
    RETURNS refcursor AS
    $BODY$
    DECLARE
    mycurs refcursor;
BEGIN OPEN mycurs FOR
SELECT a.*, b.*
FROM mbtest.order_header a
         JOIN mbtest.order_detail b
              ON a.order_id = b.order_id
WHERE a.order_id = ORDER_NUMBER;
RETURN mycurs;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100 |


CREATE OR
REPLACE FUNCTION mbtest.get_order_out_params(order_number INTEGER,
                                             detail_count OUT INTEGER,
                                             header_curs OUT refcursor) AS $BODY$
    DECLARE
    order_exists BOOLEAN;
BEGIN
SELECT order_id IS NOT NULL
INTO order_exists
FROM mbtest.order_header
WHERE order_id = ORDER_NUMBER;
IF order_exists THEN
    OPEN header_curs FOR
SELECT *
FROM mbtest.order_header
WHERE order_id = ORDER_NUMBER;
END IF;
SELECT COUNT(*)
INTO detail_count
FROM mbtest.order_detail
WHERE order_id = ORDER_NUMBER;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100 |

-- @DELIMITER ;

ALTER FUNCTION mbtest.get_order(INTEGER) OWNER TO postgres;
