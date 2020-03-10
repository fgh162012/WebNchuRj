package com.nchu.software.studentEmployment.service;

import com.nchu.software.studentEmployment.entity.DirectionEntity;
import com.nchu.software.studentEmployment.entity.StuDirectEntity;

import java.util.List;

/**
 * @ClassName IAchievementService
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 12:54
 * @Version 1.0
 */
public interface IDirectionService {
    List<StuDirectEntity> stuDirectList();
    List<DirectionEntity> directionList();
    List<StuDirectEntity> stuNoList(Integer DirectId);
    //插入学生去向信息
    void insertStuAndDirecList(List list);
}
