package com.nchu.software.studentEmployment.service.impl;

import com.nchu.software.studentEmployment.entity.StuDirectEntity;
import com.nchu.software.studentEmployment.mapper.StuDirectMapper;
import com.nchu.software.studentEmployment.service.IStuDirectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName AchievementServiceImpl
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 12:56
 * @Version 1.0
 */

@Service
public class StuDirectServiceImpl implements IStuDirectService {

    @Autowired
    private StuDirectMapper stuDirectMapper;

    @Override
    public List<StuDirectEntity> stuDirectList() {
        return stuDirectMapper.stuDirectList();
    }
}
