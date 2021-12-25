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

DROP TABLE vehicle IF EXISTS;
DROP TABLE owner IF EXISTS;

CREATE TABLE vehicle
(
    id                INT,
    maker             VARCHAR(20),
    vehicle_type      INT,
    door_count        INT,
    carrying_capacity FLOAT
);

INSERT INTO vehicle (id, maker, vehicle_type, door_count, carrying_capacity)
VALUES (1, 'Maker1', 1, 5, NULL),
       (2, 'Maker2', 2, NULL, 1.5);

CREATE TABLE owner
(
    id           INT,
    name         VARCHAR(20),
    vehicle_type VARCHAR(20),
    vehicle_id   INT
);

INSERT INTO owner (id, name, vehicle_type, vehicle_id)
VALUES (1, 'Owner1', 'truck', 2),
       (2, 'Owner2', 'car', 1);
