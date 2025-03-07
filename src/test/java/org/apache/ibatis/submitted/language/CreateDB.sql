--
--    Copyright 2009-2016 the original author or authors.
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

CREATE TABLE names
(
    id        INT,
    firstName VARCHAR(20),
    lastName  VARCHAR(20)
);

INSERT INTO names (id, firstName, lastName)
VALUES (1, 'Fred', 'Flintstone');
INSERT INTO names (id, firstName, lastName)
VALUES (2, 'Wilma', 'Flintstone');
INSERT INTO names (id, firstName, lastName)
VALUES (3, 'Pebbles', 'Flintstone');
INSERT INTO names (id, firstName, lastName)
VALUES (4, 'Barney', 'Rubble');
INSERT INTO names (id, firstName, lastName)
VALUES (5, 'Betty', 'Rubble');
