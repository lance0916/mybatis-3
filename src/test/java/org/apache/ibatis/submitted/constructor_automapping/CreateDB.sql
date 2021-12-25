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

DROP TABLE articles IF EXISTS;
DROP TABLE authors IF EXISTS;

CREATE TABLE articles
(
    id        INT,
    title     VARCHAR(20),
    author_id INT
);

CREATE TABLE authors
(
    id   INT,
    name VARCHAR(20)
);

INSERT INTO articles (id, title, author_id)
VALUES (1, 'Article1', 100),
       (2, 'Article2', 200);

INSERT INTO authors (id, name)
VALUES (100, 'Author1'),
       (200, 'Author2');
