package com.nchu.software.studentEmployment.service.impl;

import com.nchu.software.studentEmployment.entity.DirectionEntity;
import com.nchu.software.studentEmployment.entity.StuDirectEntity;
import com.nchu.software.studentEmployment.mapper.DirectionMapper;
import com.nchu.software.studentEmployment.service.IDirectionService;
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
public class DirectionServiceImpl implements IDirectionService {

    @Autowired
    private DirectionMapper directionMapper;

    @Override
    public List<StuDirectEntity> stuDirectList() {
        return directionMapper.stuDirectList();
    }
    @Override
    public List<DirectionEntity> directionList(){
        return directionMapper.directionList();
    }
    @Override
    public  List<StuDirectEntity> stuNoList(Integer DirectId){
        return directionMapper.stuNoList(DirectId);
    }

    //插入学生去向信息
    @Override
    public void insertStuAndDirecList(List list){
             directionMapper.insertStuAndDirecList(list);
    }

}
