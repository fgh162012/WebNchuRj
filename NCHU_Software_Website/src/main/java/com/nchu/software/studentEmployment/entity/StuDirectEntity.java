package com.nchu.software.studentEmployment.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @ClassName CustomDateConverter
 * @Description: java类作用描述
 * @Author: 3162748949fgh
 * @CreateDate: 2018/12/26 17:03
 * @UpdateUser: watermelon
 * @UpdateDate: 2018/12/26 17:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class StuDirectEntity {
    Integer id;         //id

    @Excel(name = "学号")
    @NotNull
    String stuNo;      //学号

    @Excel(name = "就业去向id")
    @NotNull
    Integer directId;   //就业去向id

    @Excel(name = "就业去向")
    String direction;  //就业去向
}
