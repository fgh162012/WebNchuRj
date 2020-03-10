package com.nchu.software.studentEmployment.mapper;

import com.nchu.software.studentEmployment.entity.StuCouEntity;
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
public interface AchievementMapper {
    void listInsert(List list);
    List<StuCouEntity> findStuGradesBySno(String stuNo);
}
