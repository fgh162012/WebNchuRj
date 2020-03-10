package com.nchu.software.studentEmployment.entity;

import lombok.Data;

import java.util.List;

/**
 * @ClassName GradeStatisticEntity
 * @Description: java类作用描述
 * @Author: 3162748949fgh
 * @CreateDate: 2018/12/26 17:03
 * @UpdateUser: Taodada
 * @UpdateDate: 2018/12/26 17:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class GradeStatisticEntity {
    String courseName;
    List<Integer> num;
}
