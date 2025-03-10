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

CREATE TABLE person
(
    id        INT,
    firstName VARCHAR(100),
    lastName  VARCHAR(100),
    parent    INT DEFAULT NULL
);

INSERT INTO person (id, firstName, lastName, parent)
VALUES (1, 'John sr.', 'Smith', NULL);
INSERT INTO person (id, firstName, lastName, parent)
VALUES (2, 'John', 'Smith', 1);
INSERT INTO person (id, firstName, lastName, parent)
VALUES (3, 'John jr.', 'Smith', 2);
