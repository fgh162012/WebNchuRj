package com.nchu.software.manager.service;

import com.nchu.software.manager.entity.AdministratorEntity;

/**
 * @ClassName IAdministratorService
 * @Description: java类作用描述
 * @Author: 3162748949fgh
 * @CreateDate: 2019/1/9 18:03
 * @UpdateUser: 3162748949fgh
 * @UpdateDate: 2019/1/9 18:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
public interface IAdministratorService {
    AdministratorEntity findUserByUsername(String username);
}
