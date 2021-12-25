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
package org.apache.ibatis.submitted.postgres_genkeys;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface Mapper {
    @Insert("INSERT INTO mbtest.sections (section_id, name) VALUES (#{sectionId}, #{name})")
    int insertSection(Section section);

    @Update("UPDATE mbtest.users SET name = #{name} WHERE user_id = #{userId}")
    int updateUser(User user);

    @Insert("INSERT INTO mbtest.users (name) VALUES (#{name})")
    int insertUser(@Param("name") String name);
}
