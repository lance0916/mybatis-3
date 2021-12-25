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

DROP TABLE product_sku IF EXISTS;
DROP TABLE product_info IF EXISTS;
DROP TABLE product IF EXISTS;

CREATE TABLE product
(
    id   VARCHAR(32)  NOT NULL,
    code VARCHAR(80)  NOT NULL,
    name VARCHAR(240) NOT NULL
);

CREATE TABLE product_sku
(
    id         VARCHAR(32) NOT NULL,
    product_id VARCHAR(32) NOT NULL,
    code       VARCHAR(80) NOT NULL,
    color      VARCHAR(40),
    size       VARCHAR(40)
);

CREATE TABLE product_info
(
    id         INT         NOT NULL,
    product_id VARCHAR(32) NOT NULL,
    other_info VARCHAR(240)
);

INSERT INTO product(id, code, name)
VALUES ('10000000000000000000000000000001', 'P001', 'Product 001');
INSERT INTO product_sku(id, product_id, code, color, size)
VALUES ('20000000000000000000000000000001', '10000000000000000000000000000001', 'S001', 'red', '80');
INSERT INTO product_sku(id, product_id, code, color, size)
VALUES ('20000000000000000000000000000002', '10000000000000000000000000000001', 'S001', 'blue', '10');
INSERT INTO product_info(id, product_id, other_info)
VALUES (1, '10000000000000000000000000000001', 'Sale 50% Off');
