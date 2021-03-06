package com.nchu.software.page.listener;

import com.nchu.software.page.mapper.FirstMenuMapper;
import com.nchu.software.page.mapper.SecondMenuMapper;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @ClassName TopContextListener
 * @Description: java类作用描述
 * @Author: 3162748949fgh
 * @CreateDate: 2019/1/6 19:16
 * @UpdateUser: 3162748949fgh
 * @UpdateDate: 2019/1/6 19:16
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
public class TopContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        InitIndexTop(sce.getServletContext());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    public void InitIndexTop(ServletContext sc) {
        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(sc);

        //利用工具类找到该bean对象
        FirstMenuMapper firstMenuMapper = context.getBean(FirstMenuMapper.class);
        SecondMenuMapper secondMenuMapper = context.getBean(SecondMenuMapper.class);
        // List<VipRankEntity> ranks = dao.selectAll();
       /* List<FirstMenuEntity> firstMenus = firstMenuMapper.listAll();
        List<Menu> menus = new ArrayList<>();
        for(int i = 0;i < firstMenus.size();i ++){
            List<SecondMenuEntity> twoMenu = secondMenuMapper.getSecondMenuByFirstId(firstMenus.get(i).getFirstMenuId());
            Menu menu = new Menu();
            menu.setFirstMenu(firstMenus.get(i));
            if (twoMenu != null) {
                menu.setList(twoMenu);
            }
            menus.add(menu);
        }
        sc.setAttribute("menus",menus);
    }*/
    }
}
