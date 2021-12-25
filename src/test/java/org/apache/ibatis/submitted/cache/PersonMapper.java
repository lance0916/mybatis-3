/*
 *    Copyright 2009-2021 the original author or authors.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */
package org.apache.ibatis.submitted.cache;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Options.FlushCachePolicy;

import java.util.List;

@CacheNamespace
public interface PersonMapper {

    @Insert("INSERT INTO person (id, firstname, lastname) VALUES (#{id}, #{firstname}, #{lastname})")
    void create(Person person);

    @Insert("INSERT INTO person (id, firstname, lastname) VALUES (#{id}, #{firstname}, #{lastname})")
    @Options
    void createWithOptions(Person person);

    @Insert("INSERT INTO person (id, firstname, lastname) VALUES (#{id}, #{firstname}, #{lastname})")
    @Options(flushCache = FlushCachePolicy.FALSE)
    void createWithoutFlushCache(Person person);

    @Delete("DELETE FROM person WHERE id = #{id}")
    void delete(int id);

    @Select("SELECT id, firstname, lastname FROM person")
    List<Person> findAll();

    @Select("SELECT id, firstname, lastname FROM person")
    @Options(flushCache = FlushCachePolicy.TRUE)
    List<Person> findWithFlushCache();
}
