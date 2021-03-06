package com.nchu.software.page.service.impl;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.mapper.FirstMenuMapper;
import com.nchu.software.page.service.IFirstMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName FirstMenuServiceImpl
 * @Description: java类作用描述
 * @Author: 3162748949fgh
 * @CreateDate: 2019/1/6 19:00
 * @UpdateUser: 3162748949fgh
 * @UpdateDate: 2019/1/6 19:00
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Service
public class FirstMenuServiceImpl implements IFirstMenuService {

    @Autowired
    FirstMenuMapper mapper;

    /**
     * @Description 查询出所有的一级菜单
     * @author  watermelon
     * @return List<FirstMenuEntity>
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public List<FirstMenuEntity> listAll() {
        return mapper.listAll();
    }

    /**
     * @Description 根据名字和标志为查询出一级菜单
     * @author  watermelon
     * @param name
     * @return FirstMenuEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public FirstMenuEntity getFirstMenuByName(String name) {
        return mapper.getFirstMenuByName(name);
    }

    @Override
    public List<FirstMenuEntity> listAllByFlag(int flag) {
        return mapper.listAllByFlag(flag);
    }
}
