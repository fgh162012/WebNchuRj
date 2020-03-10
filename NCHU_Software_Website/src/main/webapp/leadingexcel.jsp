<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/1/8
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="../../js/jquery.js"></script>

    <script src="../../js/homepage.js"></script>
    <script src="../../js/jquery.form.js"></script>
    <script type="text/javascript">
        //JS校验form表单信息
        function checkData(){
            var fileDir = $("#upfile").val();
            var suffix = fileDir.substr(fileDir.lastIndexOf("."));
            if("" == fileDir){
                alert("选择需要导入的Excel文件！");
                return false;
            }
            if(".xls" != suffix && ".xlsx" != suffix ){
                alert("选择Excel格式的文件导入！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<form method="POST"  enctype="multipart/form-data"  action="/achievement">

    <label>上传文件: </label>
    <input type="file" name="upfile1"><br> <br>

    <input type="submit" value="上传成绩" onclick="return checkData()">
</form>
<form method="POST"  enctype="multipart/form-data"  action="/student">

    <label>上传文件: </label>
    <input type="file" name="upfile2"><br> <br>

    <input type="submit" value="上传学生信息" onclick="return checkData()">
</form>

<form method="POST"  enctype="multipart/form-data" action="/course">

    <label>上传文件: </label>
    <input type="file" name="upfile3"><br> <br>

    <input type="submit" value="上传课程信息" onclick="return checkData()">
</form>

</body>
</html>
