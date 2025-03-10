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
package org.apache.ibatis.submitted.use_actual_param_name;

import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface Mapper {

    @Select("SELECT * FROM users WHERE id = #{foo}")
    User getUserById(Integer id);

    @Select("SELECT * FROM users WHERE id = #{id} AND name = #{name}")
    User getUserByIdAndName(Integer id, String name);

    List<User> getUsersByIdList(List<Integer> ids);

    List<User> getUsersByIdListAndName(List<Integer> ids, String name);

}
