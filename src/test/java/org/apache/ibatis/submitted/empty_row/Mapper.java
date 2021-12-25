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
package org.apache.ibatis.submitted.empty_row;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

public interface Mapper {

    @Select("SELECT NULL FROM (VALUES(0))")
    String getString();

    @ResultMap("parentRM")
    @Select("SELECT col1, col2 FROM parent WHERE id = #{id}")
    Parent getBean(Integer id);

    @Select("SELECT col1, col2 FROM parent WHERE id = #{id}")
    Map<String, String> getMap(Integer id);

    @ResultMap("associationRM")
    @Select({"SELECT p.id, c.name child_name FROM parent p",
            "left join child c on c.parent_id = p.id where p.id = #{id}"})
    Parent getAssociation(Integer id);

    @ResultMap("associationWithNotNullColumnRM")
    @Select({"SELECT p.id, c.id child_id, c.name child_name FROM parent p",
            "left join child c on c.parent_id = p.id where p.id = #{id}"})
    Parent getAssociationWithNotNullColumn(Integer id);

    @ResultMap("nestedAssociationRM")
    @Select("SELECT 1 id, NULL child_name, NULL grandchild_name FROM (VALUES(0))")
    Parent getNestedAssociation();

    @ResultMap("collectionRM")
    @Select({"SELECT p.id, c.name child_name FROM parent p",
            "left join child c on c.parent_id = p.id where p.id = #{id}"})
    Parent getCollection(Integer id);

    @ResultMap("twoCollectionsRM")
    @Select({"SELECT p.id, c.name child_name, e.name pet_name FROM parent p",
            "left join child c on c.parent_id = p.id",
            "left join pet e on e.parent_id = p.id", "where p.id = #{id}"})
    Parent getTwoCollections(Integer id);
}
