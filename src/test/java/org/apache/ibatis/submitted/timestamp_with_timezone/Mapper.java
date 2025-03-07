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
package org.apache.ibatis.submitted.timestamp_with_timezone;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface Mapper {

    @Select("SELECT id, odt, odt ot FROM records WHERE id = #{id}")
    Record selectById(Integer id);

    @Insert("INSERT INTO records (id, odt) VALUES (#{id}, #{odt})")
    int insertOffsetDateTime(Record record);

    @Insert("INSERT INTO records (id, odt) VALUES (#{id}, #{ot})")
    int insertOffsetTime(Record record);

}
