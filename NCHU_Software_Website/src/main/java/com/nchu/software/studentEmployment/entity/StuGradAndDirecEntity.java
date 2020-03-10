package com.nchu.software.studentEmployment.entity;

import lombok.Data;

import java.util.List;

/**
 * @ClassName  StuInforEntity
 * @Description: java类作用描述
 * @Author: 3162748949fgh
 * @CreateDate: 2018/12/26 17:03
 * @UpdateUser: Taodada
 * @UpdateDate: 2018/12/26 17:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class StuGradAndDirecEntity {
  String stuNo;                   //学号
  List<StuCouEntity> list;   //学生成绩列表
  String direction;               //就业去向
}
