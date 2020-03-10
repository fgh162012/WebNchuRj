package com.nchu.software.studentEmployment.mapper;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName StudentMapper
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/12 14:31
 * @Version 1.0
 */

@Repository
public interface StudentMapper {
    void listInsert(List list);

}
