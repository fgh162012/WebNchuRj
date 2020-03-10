package com.nchu.software.studentEmployment.controller;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import com.nchu.software.commons.util.ExcelUtil;
import com.nchu.software.studentEmployment.entity.AchievementEntity;
import com.nchu.software.studentEmployment.entity.CourseEntity;
import com.nchu.software.studentEmployment.entity.StuDirectEntity;
import com.nchu.software.studentEmployment.service.impl.AchievementServiceImpl;
import com.nchu.software.studentEmployment.service.impl.CourseServiceImpl;
import com.nchu.software.studentEmployment.service.impl.DirectionServiceImpl;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static cn.afterturn.easypoi.util.PoiCellUtil.getCellValue;


/**
 * @ClassName ExcelReader
 * @Description TODO
 * @Auther 3162748949fgh
 * @Date 2019/1/11 00:10
 * @Version 1.0
 */

@Controller
public class StudentExcelController {

    @Autowired
    private AchievementServiceImpl achievementService;
    @Autowired
    private CourseServiceImpl courseService;
    @Autowired
    private DirectionServiceImpl directionService;

    @RequestMapping("/achievement")
    public ModelAndView uploadResults(@RequestParam("upfile1") MultipartFile file, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        try {
            if (!file.isEmpty()) {
                HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
                List<AchievementEntity> achievements = new ArrayList<>();
                if (workbook != null) {
                    HSSFSheet sheet = null;
                    String courseNo = null;
                    for (int i = 0; i < workbook.getNumberOfSheets(); i++) {// 获取每个Sheet表
                        sheet = workbook.getSheetAt(i);
                        if (sheet != null) {
                            for (int j = 0; j < sheet.getPhysicalNumberOfRows(); j++) {// 获取每行
                                HSSFRow row = sheet.getRow(j);
                                if (row != null) {
                                    for (int k = 0; k < row.getPhysicalNumberOfCells(); k++) {// 获取每个单元格
                                        if (ExcelUtil.getCellValue(row.getCell(k)).contains("课程编码")) {
                                            String str = ExcelUtil.getCellValue(row.getCell(k));
                                            courseNo = str.substring(str.indexOf("课程编码") + 5, str.indexOf("课程编码") + 12);
                                        }
                                        if (ExcelUtil.isStuNo(row.getCell(k))) {
                                            AchievementEntity achievement = new AchievementEntity(getCellValue(row.getCell(k)), courseNo,
                                                    getCellValue(row.getCell(k + 2)), getCellValue(row.getCell(k + 3)), getCellValue(row.getCell(k + 4)),
                                                    getCellValue(row.getCell(k + 5)), getCellValue(row.getCell(k + 6)), getCellValue(row.getCell(k + 7)));
                                            k += 7;
                                            achievements.add(achievement);
                                        }
                                    }
                                }
                            }
                        }

                    }
                    achievementService.listInsert(achievements);
                    request.setAttribute("achievements", achievements);
                }
            }
        }
        catch (Exception e) {
            mv.setViewName("studentEmployment/excelerror");
            return mv;
        }
        mv.setViewName("studentEmployment/SuccessfulData");
        return mv;
    }

    @RequestMapping("/course")
    public String uploadCourse(@RequestParam("upfile3") MultipartFile file, HttpServletRequest request) throws Exception {
        if (!file.isEmpty()) {
            ImportParams params = new ImportParams();
            params.setNeedVerfiy(true);
            ExcelImportResult<CourseEntity> result = ExcelImportUtil.importExcelMore(
                    file.getInputStream(),CourseEntity.class, params);
            List<CourseEntity> list = result.getList();
          /*  for(CourseEntity courseEntity : list)
                System.out.println(courseEntity.getCourseName());*/
            request.setAttribute("courseList",list);
            courseService.listInsert(list);
        }
        return "studentEmployment/SuccessfulData";
    }

    @RequestMapping("/studirect")
    public String uploadStuDirect(@RequestParam("upfile2") MultipartFile file, HttpServletRequest request) throws Exception {
        if (!file.isEmpty()) {
            ImportParams params = new ImportParams();
            params.setNeedVerfiy(true);
            ExcelImportResult<StuDirectEntity> result = ExcelImportUtil.importExcelMore(
                    file.getInputStream(),StuDirectEntity.class, params);
            List<StuDirectEntity> list = result.getList();
            for(StuDirectEntity stuDirectEntity : list)
                System.out.println(stuDirectEntity.getStuNo());
            //courseService.listInsert(list);
            request.setAttribute("stuDirectList",list);
            directionService.insertStuAndDirecList(list);
        }
        return "studentEmployment/SuccessfulData";
    }
    /*@RequestMapping("/download")
    public void download(HttpServletResponse response) {
        List<com.nchu.software.mailbox.entity.Student> list = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            com.nchu.software.mailbox.entity.Student student = new com.nchu.software.mailbox.entity.Student();
            student.setId("162011");
            student.setName("张三");
            student.setExperimentalResults(89);
            student.setNormalResults(23);
            student.setMidtermResults(56);
            student.setFinalResults(80);
            student.setTotalResults(90);
            student.setFlag(1);
            list.add(student);
        }
        try {
            // 告诉浏览器用什么软件可以打开此文件
            response.setHeader("content-Type", "application/vnd.ms-excel");
            // 下载文件的默认名称
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("成绩表.xls", "UTF-8"));
            //编码
            response.setCharacterEncoding("UTF-8");
            Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("成绩表", "成绩表"), Student.class, list);
            workbook.write(response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/

}
