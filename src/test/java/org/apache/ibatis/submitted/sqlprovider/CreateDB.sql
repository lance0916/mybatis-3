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

DROP TABLE users IF EXISTS;
DROP TABLE memos IF EXISTS;

CREATE TABLE users
(
    id             INT,
    name           VARCHAR(20),
    logical_delete BOOLEAN DEFAULT FALSE
);

CREATE TABLE memos
(
    id   INT,
    memo VARCHAR(1024),
);

INSERT INTO users (id, name)
VALUES (1, 'User1');
INSERT INTO users (id, name)
VALUES (2, 'User2');
INSERT INTO users (id, name)
VALUES (3, 'User3');
INSERT INTO users (id, name, logical_delete)
VALUES (4, 'User4', TRUE);

INSERT INTO memos (id, memo)
VALUES (1, 'memo1');
