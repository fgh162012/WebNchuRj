package com.nchu.software.studentEmployment.controller;

import com.nchu.software.studentEmployment.entity.*;
import com.nchu.software.studentEmployment.service.impl.AchievementServiceImpl;
import com.nchu.software.studentEmployment.service.impl.CourseServiceImpl;
import com.nchu.software.studentEmployment.service.impl.DirectionServiceImpl;
import com.nchu.software.studentEmployment.service.impl.StuDirectServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.ArrayList;
import java.util.List;


/**
 * @ClassName ExcelReader
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/11 00:10
 * @Version 1.0
 */

@Controller
public class OperateController {
    private static final Logger log = LoggerFactory.getLogger(OperateController.class);

    @Autowired
    private StuDirectServiceImpl stuDirectService;

    @Autowired
    private AchievementServiceImpl achievementService;

    @Autowired
    private CourseServiceImpl courseService;

    @Autowired
    private DirectionServiceImpl directionService;

    @RequestMapping("/studentEmployment")
    public ModelAndView studentEmployment(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentEmployment/studentEmployment");
        return mv;
    }

    @RequestMapping("/leadingexcel")
    public ModelAndView lendingExcel() {
        ModelAndView mv = new ModelAndView();

        mv.setViewName("studentEmployment/leadingexcel");
        return mv;
    }
    @RequestMapping("/dataChart")
    public ModelAndView dataChart() {
        List<DirectionEntity> list = directionService.directionList();
        ModelAndView mv = new ModelAndView();
        mv.addObject("directions",list);
        System.out.println(list);
        mv.setViewName("studentEmployment/dataChart");
        return mv;
    }

    @RequestMapping("/dataChartb")
    public ModelAndView dataChartb() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentEmployment/dataChartB");
        return mv;
    }
    @RequestMapping("/prediction")
    public ModelAndView prediction() {
        List<CourseEntity> list = courseService.courseList();
        ModelAndView mv = new ModelAndView();
        mv.addObject("lists",list);
        mv.setViewName("studentEmployment/prediction");
        return mv;
    }

//    @RequestMapping("/getCourseList")
//    public ModelAndView getCourseEntity() {
//        List<CourseEntity> list = courseService.courseList();
//        List<String> courseNameList = new ArrayList<>();
//        for (int i=0;i<list.size();i++) {
//            courseNameList.add(list.get(i).getCourseName());
//        }
//        List<Integer> list1 = new ArrayList<>();
//        List<Integer> list2 = new ArrayList<>();
//        List<Integer> list3 = new ArrayList<>();
//        List<Integer> list4 = new ArrayList<>();
//
//        for(int i=0;i<11;i++) {
//            list1.add((int)(1+Math.random()*100));
//            list2.add((int)(1+Math.random()*100));
//            list3.add((int)(1+Math.random()*100));
//            list4.add((int)(1+Math.random()*100));
//        }
//
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("courselist",courseNameList);
//        mv.addObject("list1",list1);
//        mv.addObject("list2",list2);
//        mv.addObject("list3",list3);
//        mv.addObject("list4",list4);
//        mv.setView(new MappingJackson2JsonView());
//        return mv;
//    }

//    @RequestMapping("/getStuDirect")
//    public ModelAndView getStuDirect() {
//        List<DirectionEntity> list = directionService.directionList();
//        List<String> stuDirectNameList = new ArrayList<>();
//        for (int i=0;i<list.size();i++) {
//            stuDirectNameList.add(list.get(i).getDirection());
//        }
//        List<Integer> data = new ArrayList<>();
//        for(int i =0;i<9;i++) {
//            data.add((int)(1+Math.random()*100));
//        }
//
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("list",stuDirectNameList);
//        mv.addObject("data",data);
//        mv.setView(new MappingJackson2JsonView());
//        return mv;
//
//    }

    @RequestMapping(path = "/getCourseListData/{id}")
    public ModelAndView getCourseListData(@PathVariable("id") Integer id) {
        List<GradeStatisticEntity> gradeStatisticEntityList= getGradeStatisticByDrectionId(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("list",gradeStatisticEntityList);
        mv.setView(new MappingJackson2JsonView());
        return mv;
    }

    @RequestMapping(path = "/getDirectionListData")
    public ModelAndView getDirectionListData() {

        ModelAndView mv = new ModelAndView();
        //通过就业方向id查询改就业方向学生人数
        List<DirectionEntity> list = directionService.directionList();
        List<Integer> data = new ArrayList<>();
        for (int i=1;i<10;i++) {
            int sum = findStuCountById(i);
            data.add(sum);
        }
        mv.addObject("list",list);
        mv.addObject("data",data);
        mv.setView(new MappingJackson2JsonView());
        return mv;
    }

    private Integer findStuCountById(Integer id){
        List<StuDirectEntity> stuDirectEntityList= directionService.stuNoList(id);
        return stuDirectEntityList.size();
    }
    //通过去向的id获取到每门成绩的分数阶段的人数
    private List<GradeStatisticEntity> getGradeStatisticByDrectionId(Integer id){
        //学生所有成绩和去向实体列表
        List<StuGradAndDirecEntity> stuGradAndDirecEntityList = new ArrayList<>();
        //根据去向id查询所有学生的学号
        List<StuDirectEntity> stuDirectList = directionService.stuNoList(id);
        for (StuDirectEntity stuDirectEntity:stuDirectList){
            //根据学号查询学生的所有成绩信息
            List<StuCouEntity> stuCouEntityList = achievementService.findStuGradesBySno(stuDirectEntity.getStuNo());
            //学生所有成绩和去向实体
            StuGradAndDirecEntity stuGradAndDirecEntity = new StuGradAndDirecEntity();
            //封装
            stuGradAndDirecEntity.setStuNo(stuDirectEntity.getStuNo());
            stuGradAndDirecEntity.setDirection(stuDirectEntity.getDirection());
            stuGradAndDirecEntity.setList(stuCouEntityList);
            //学生所有成绩和去向实体列表
            stuGradAndDirecEntityList.add(stuGradAndDirecEntity);
        }
        //查询所有课程信息
        List<CourseEntity> courseEntityList = courseService.courseList();
    /*String[] courseNames={"离散数学A","面向对象程序设计A","计算机组成与结构A","软件工程导论"};*/
        Integer [][]gradeRank = new Integer[courseEntityList.size()][9]; //学生成绩分为九个阶层
        //初始化数组
        for(int i = 0;i < gradeRank.length;i++){
            for (int j = 0;j < gradeRank[i].length;j++){
                gradeRank[i][j] = 0;
            }
        }
        //循环遍历（学生成绩和就业去向信息）实体
        for(StuGradAndDirecEntity stuGradAndDirecEntity:stuGradAndDirecEntityList){
            //循环遍历学生的所有课程成绩
            for(StuCouEntity stuCouEntity :stuGradAndDirecEntity.getList()){

                for(int i = 0;i < courseEntityList.size();i++){
                    if(stuCouEntity.getCourseName().equals(courseEntityList.get(i).getCourseName())){
                        if(stuCouEntity.getTotalResults() >= 0 && stuCouEntity.getTotalResults() < 60){
                            gradeRank[i][0]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 60 && stuCouEntity.getTotalResults() < 65){
                            gradeRank[i][1]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 65 && stuCouEntity.getTotalResults() < 70){
                            gradeRank[i][2]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 70 && stuCouEntity.getTotalResults() < 75){
                            gradeRank[i][3]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 75 && stuCouEntity.getTotalResults() < 80){
                            gradeRank[i][4]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 80 && stuCouEntity.getTotalResults() < 85){
                            gradeRank[i][5]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 85 && stuCouEntity.getTotalResults() < 90){
                            gradeRank[i][6]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 90 && stuCouEntity.getTotalResults() < 95){
                            gradeRank[i][7]++;
                        }
                        if(stuCouEntity.getTotalResults() >= 95 && stuCouEntity.getTotalResults() <= 100){
                            gradeRank[i][8]++;
                        }
                    }
                }
            }
        }

        List<GradeStatisticEntity> gradeStatisticEntityList = new ArrayList<>();
        for(int i = 0;i <gradeRank.length;i++){
            //封装每门科目每个阶段的分数
            GradeStatisticEntity gradeStatisticEntity = new GradeStatisticEntity();
            List<Integer> list = new ArrayList<>();
            for(int j = 0;j < gradeRank[i].length;j++){
            /*log.info("个数：" + gradeRank[i][j]);*/
                list.add(gradeRank[i][j]);
            }
            gradeStatisticEntity.setCourseName(courseEntityList.get(i).getCourseName());
            gradeStatisticEntity.setNum(list);
            gradeStatisticEntityList.add(gradeStatisticEntity);
        }
        return gradeStatisticEntityList;
    }





    @RequestMapping(path = "/test4/{one}/{two}/{three}/{four}")
    public ModelAndView test4(@PathVariable("one") double one, @PathVariable("two") double two, @PathVariable("three") double three, @PathVariable("four") double four)throws Exception{
        //学生所有成绩和去向实体列表

        List<ForecastInforEntity>  dataTotal = new ArrayList<>();
        List<StuGradAndDirecEntity> stuGradAndDirecEntityList = new ArrayList<>();
        //根据去向id查询所有学生的学号
        List<DirectionEntity> stuDirectListTotal = directionService.directionList();
        for (int ik = 0; ik < stuDirectListTotal.size(); ik++) {
            log.info("ID：" + stuDirectListTotal.get(ik).getId());
            List<StuDirectEntity> stuDirectList = directionService.stuNoList(stuDirectListTotal.get(ik).getId());
            for (StuDirectEntity stuDirectEntity : stuDirectList) {
                //根据学号查询学生的所有成绩信息
                List<StuCouEntity> stuCouEntityList = achievementService.findStuGradesBySno(stuDirectEntity.getStuNo());
                //学生所有成绩和去向实体
                StuGradAndDirecEntity stuGradAndDirecEntity = new StuGradAndDirecEntity();
                //封装
                stuGradAndDirecEntity.setStuNo(stuDirectEntity.getStuNo());
                stuGradAndDirecEntity.setDirection(stuDirectEntity.getDirection());
                stuGradAndDirecEntity.setList(stuCouEntityList);
                //学生所有成绩和去向实体列表
                stuGradAndDirecEntityList.add(stuGradAndDirecEntity);
            }
            //查询所有课程信息
            List<CourseEntity> courseEntityList = courseService.courseList();
                /*String[] courseNames={"离散数学A","面向对象程序设计A","计算机组成与结构A","软件工程导论"};*/
            Integer[] gradeRank = new Integer[courseEntityList.size()]; //四门科目
            //初始化数组
            for (int i = 0; i < gradeRank.length; i++) {
                gradeRank[i] = 0;
            }
            //循环遍历（学生成绩和就业去向信息）实体
            for (StuGradAndDirecEntity stuGradAndDirecEntity : stuGradAndDirecEntityList) {
                //循环遍历学生的所有课程成绩
                for (StuCouEntity stuCouEntity : stuGradAndDirecEntity.getList()) {
                    for (int i = 0; i < courseEntityList.size(); i++) {
                        if (stuCouEntity.getCourseName().equals(courseEntityList.get(i).getCourseName())) {
                            gradeRank[i] += stuCouEntity.getTotalResults();
                        }
                    }
                }
            }
            ForecastInforEntity forecastInforEntity = new ForecastInforEntity();
            forecastInforEntity.setDirecyion(stuDirectListTotal.get(ik).getDirection());
            List<AverResults> averResultsList = new ArrayList<>();

            for (int i = 0; i < gradeRank.length; i++) {
                gradeRank[i] /= stuGradAndDirecEntityList.size();
                AverResults averResults = new AverResults();
                averResults.setCourseName(courseEntityList.get(i).getCourseName());
                averResults.setAverResults(gradeRank[i]);
                averResultsList.add(averResults);
            }
            forecastInforEntity.setList(averResultsList);
            log.info("方向：" + forecastInforEntity.getDirecyion());
            for (int i = 0; i < forecastInforEntity.getList().size(); i++) {
                log.info("课程名" + forecastInforEntity.getList().get(i).getCourseName());
                log.info("平均分" + forecastInforEntity.getList().get(i).getAverResults());
            }
            dataTotal.add(forecastInforEntity);
        }
        List<Pro> listcount = new ArrayList<>();
        double dsum = 0;
        for (int i = 0; i < dataTotal.size(); i++) {
                /*log.info("方向：" + dataTotal.get(i).getDirecyion());
                log.info("课程名" + dataTotal.get(i).getList().get(i).getCourseName());
                log.info("平均分" + dataTotal.get(i).getList().get(i).getAverResults());*/
            System.out.println("方向  ：" + dataTotal.get(i).getDirecyion());
            Pro pro = new Pro();
            pro.setJy(dataTotal.get(i).getDirecyion());
                /*    log.info("课程名" + dataTotal.get(i).getList().get(j).getCourseName());
                    log.info("平均分" + dataTotal.get(i).getList().get(j).getAverResults());*/
            double d =  (one-dataTotal.get(i).getList().get(0).getAverResults()) * (one-dataTotal.get(i).getList().get(0).getAverResults())
                    +(two-dataTotal.get(i).getList().get(1).getAverResults()) * (two-dataTotal.get(i).getList().get(1).getAverResults())
                    +(three-dataTotal.get(i).getList().get(2).getAverResults()) * (three-dataTotal.get(i).getList().get(2).getAverResults())
                    +(four-dataTotal.get(i).getList().get(3).getAverResults()) * (four-dataTotal.get(i).getList().get(3).getAverResults());
            pro.setD(d);
            dsum = dsum + Math.sqrt(d);
            listcount.add(pro);
        }
        double dsumtwo = 0;
        for (int i = 0;i < listcount.size();i++){

            dsumtwo = dsumtwo + dsum/listcount.get(i).getD();
            listcount.get(i).setD(dsum/listcount.get(i).getD());
            System.out.println(dsumtwo);

        }
        System.out.println(dsum);
        System.out.println(dsumtwo);
        for (int i = 0;i < listcount.size();i++){
            listcount.get(i).setPro((double)Math.round(listcount.get(i).getD()/dsumtwo * 1000)/1000);
            System.out.println("方向："+listcount.get(i).getJy()+" 概率 ："+listcount.get(i).getPro());
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject("list",listcount);
        mv.setView(new MappingJackson2JsonView());
        return mv;

    }




}

