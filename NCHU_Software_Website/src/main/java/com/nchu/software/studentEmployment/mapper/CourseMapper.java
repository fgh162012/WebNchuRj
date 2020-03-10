package com.nchu.software.studentEmployment.mapper;

import com.nchu.software.studentEmployment.entity.CourseEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName CourseMapper
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 15:42
 * @Version 1.0
 */

@Repository
public interface CourseMapper {
    void listInsert(List list);

    //查询所有课程信息
    List<CourseEntity> courseList();
}
