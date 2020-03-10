package com.nchu.software.studentEmployment.service;

import com.nchu.software.studentEmployment.entity.CourseEntity;

import java.util.List;

/**
 * @ClassName ICourseService
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 15:52
 * @Version 1.0
 */
public interface ICourseService {
    void listInsert(List list);
    //查询所有课程信息
    List<CourseEntity> courseList();
}
