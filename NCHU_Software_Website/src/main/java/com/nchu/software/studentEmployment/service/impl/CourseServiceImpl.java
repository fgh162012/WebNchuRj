package com.nchu.software.studentEmployment.service.impl;

import com.nchu.software.studentEmployment.entity.CourseEntity;
import com.nchu.software.studentEmployment.mapper.CourseMapper;
import com.nchu.software.studentEmployment.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CourseServiceImpl
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 15:52
 * @Version 1.0
 */
@Service
public class CourseServiceImpl implements ICourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public void listInsert(List list) {
        courseMapper.listInsert(list);
    }
    //查询所有课程信息
    @Override
    public List<CourseEntity> courseList(){
        return courseMapper.courseList();
    }
}
