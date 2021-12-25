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
package org.apache.ibatis.submitted.typehandler;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.submitted.typehandler.Product.ProductId;
import org.apache.ibatis.type.JdbcType;

public interface Mapper {

    @Select("SELECT * FROM users WHERE id = #{value}")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "city", property = "city", jdbcType = JdbcType.CHAR),
            @Result(column = "state", property = "state", jdbcType = JdbcType.VARCHAR)
    })
    User getUser(Integer id);

    @Insert({
            "INSERT INTO product (name) VALUES (#{name})"
    })
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insertProduct(Product product);

    @Select("SELECT id, name FROM product WHERE name = #{value}")
    Product getProductByName(String name);

    Product getProductByNameXml(String name);

    @Select("SELECT id, name FROM product WHERE name = #{value}")
    @ConstructorArgs({
            @Arg(id = true, column = "id", javaType = ProductId.class, jdbcType = JdbcType.INTEGER),
            @Arg(column = "name")
    })
    Product getProductByNameUsingConstructor(String name);

    @Select("SELECT id FROM product WHERE name = #{value}")
    ProductId getProductIdByName(String name);
}
