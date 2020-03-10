package com.nchu.software.studentEmployment.service.impl;

import com.nchu.software.studentEmployment.mapper.StudentMapper;
import com.nchu.software.studentEmployment.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName StudentServiceImpl
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 14:42
 * @Version 1.0
 */

@Service
public class StudentServiceImpl implements IStudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public void listInsert(List list) {
        studentMapper.listInsert(list);
    }
}
