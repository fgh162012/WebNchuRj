package com.nchu.software.studentEmployment.entity;

import lombok.Data;

/**
 * @ClassName CourseGradeEntity
 * @Description: java类作用描述
 * @Author: 3162748949fgh
 * @CreateDate: 2018/12/26 17:03
 * @UpdateUser:3162748949fgh
 * @UpdateDate: 2018/12/26 17:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class StuCouEntity {
    Integer courseNO;              //课程号
    String courseName;             //课程名
    String stuNo;                  //学号
    Integer totalResults;          //总成绩
}
