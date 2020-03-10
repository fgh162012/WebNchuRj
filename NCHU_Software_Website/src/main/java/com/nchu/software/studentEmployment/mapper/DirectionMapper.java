package com.nchu.software.studentEmployment.mapper;

import com.nchu.software.studentEmployment.entity.DirectionEntity;
import com.nchu.software.studentEmployment.entity.StuDirectEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName AchievementMappee
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 12:42
 * @Version 1.0
 */

@Repository
public interface DirectionMapper {
    //获取所有学生的就业方向
    List<StuDirectEntity> stuDirectList();
    //获取就业方向列表
    List<DirectionEntity> directionList();
    //通过就业方向id获取学生就业方向实体列表
    List<StuDirectEntity> stuNoList(Integer DirectId);
    //插入学生去向信息
    void insertStuAndDirecList(List list);
}
