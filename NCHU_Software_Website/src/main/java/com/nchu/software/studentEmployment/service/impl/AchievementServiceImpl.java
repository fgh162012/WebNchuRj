package com.nchu.software.studentEmployment.service.impl;

import com.nchu.software.studentEmployment.entity.StuCouEntity;
import com.nchu.software.studentEmployment.mapper.AchievementMapper;
import com.nchu.software.studentEmployment.service.IAchievementService;
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
public class AchievementServiceImpl implements IAchievementService {

    @Autowired
    private AchievementMapper achievementMapper;

    @Override
    public void listInsert(List list) {
        achievementMapper.listInsert(list);
    }
    @Override
    public  List<StuCouEntity> findStuGradesBySno(String stuNo){
        return achievementMapper.findStuGradesBySno(stuNo);
    }
}
