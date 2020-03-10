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
    <script src="../../js/jquery-3.2.1.js"></script>
    <script src="../../js/homepage.js"></script>

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
    <!-- bootstrap链接 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .in_style{
            width:250px;
            height:41px;
        }
    </style>
</head>
<body style="background-color:#eeeeee">
<div style="height: 12%">
    &nbsp;
</div>
<div>
<div style="width:5%;float: left">
&nbsp;
</div>
<div style="width: 35%;float: left">
<div style="height: 160px">
    <form method="POST"  enctype="multipart/form-data"  action="/achievement">
        <div style="font-size: 18px">上传成绩信息文件: </div>
        <input type="file" name="upfile1" class="in_style" >
        <div style="float: left"><input type="submit" value="提交" class="btn btn-primary" onclick="return checkData()"></div>
    </form>


</div>

<div style="height: 160px">
    <form method="POST"  enctype="multipart/form-data"  action="/studirect">
        <div style="font-size: 18px">上传学生就业去向信息文件: </div>
        <input type="file" name="upfile2" class="in_style">
        <input type="submit" value="提交" class="btn btn-primary" onclick="return checkData()">
    </form>
</div>


<div style="height: 160px">
    <form method="POST"  enctype="multipart/form-data" action="/course">
        <div style="font-size: 18px">上传课程信息文件: </div>
        <input type="file" name="upfile3" class="in_style">
        <div  style="float: left"><input type="submit" value="提交" class="btn btn-primary" onclick="return checkData()"></div>
    </form>
</div>

<%--<div>
<a href="/test">测试</a>
<a href="/test2">测试2</a>
<a href="/test3">测试3</a>
    <a href="/test4">测试4</a>
</div>--%>
</div>
</div>
</body>
</html>
