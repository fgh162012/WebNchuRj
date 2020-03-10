package com.nchu.software.studentEmployment.service;

import com.nchu.software.studentEmployment.entity.StuCouEntity;

import java.util.List;

/**
 * @ClassName IAchievementService
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 12:54
 * @Version 1.0
 */
public interface IAchievementService {

    void listInsert(List list);
    List<StuCouEntity> findStuGradesBySno(String stuNo);
}
