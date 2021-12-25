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
package org.apache.ibatis.submitted.manyanno;

import org.apache.ibatis.annotations.*;

import java.util.List;

public interface PostMapper {


    @Select("SELECT * FROM post WHERE author_id = #{id} ORDER BY id")
    @Results(value = {
            @Result(property = "id", column = "id"),
            @Result(property = "subject", column = "subject"),
            @Result(property = "body", column = "body"),
            @Result(property = "tags", javaType = List.class, column = "id", many = @Many(select = "getTagsForPost"))
    })
    List<AnnoPost> getPosts(int authorId);

    @Select("SELECT t.id, t.name FROM tag t INNER JOIN post_tag pt ON pt.tag_id = t.id WHERE pt.post_id = #{postId} ORDER BY id")
    @ConstructorArgs(value = {
            @Arg(column = "id", javaType = int.class),
            @Arg(column = "name", javaType = String.class)
    })
    List<AnnoPostTag> getTagsForPost(int postId);

}
