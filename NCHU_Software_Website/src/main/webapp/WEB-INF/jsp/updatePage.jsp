
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>添加新闻</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/fileinput.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/fileinput.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/zh.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="UTF-8" src ="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" charset="UTF-8" src ="${pageContext.request.contextPath}/js/messages_zh.js"></script>

<script>

    function getsecondMenu() {
        //获取下拉框主键
        var id=$("#firstMenu").find('option:selected').val();
        var url="${pageContext.request.contextPath}/findSecondMenuList/"+id;

        $("#secondMenuId").empty();     //清空二级目录
        var classNext=$("#secondMenuId");
//        classNext.append("<option value="+0+">"+"二级菜单"+"</option>");
        $.ajax({
            type: "post",
            contentType:"application/json",
            url : url,
            success: function (data) {
                console.log(data);
//                var data = eval('(' + data + ')');
                if(data.length!="" && data.length!=null){
                    for ( var i = 0; i < data.length; i++) {
                        var string;
                        string = "<option value= "+data[i].secondMenuId;
                        if(data[i].secondMenuId == ${content.secondMenuId}) {
                            string += " selected >" +data[i].secondMenuName +"</option>";
                        }
                        else {
                            string += ">" +data[i].secondMenuName +"</option>";
                        }
                        // classNext.append("<option value="+data[i].secondMenuId+">"+data[i].secondMenuName +"</option>");
                        classNext.append(string);
                    }
                }else{
                    classNext.append("<option  value=\"\">---无---</option>");
                }
            }
        })
    };


    $.validator.setDefaults({
        submitHandler:function () {
            if(!UE.getEditor('context').hasContents()) {
                alert("内容为空！");
            }
            else {
                alert("修改成功！");
                //               $("#page").submit();
                form.submit();
            }
        }
    });

    function doSubmit(){
        alert("正在修改，修改成功后将自动跳转！");
        frm.submit();
    }

    $().ready(function () {
        $("#page").validate({
            rules:{
                secondMenuId:"required",
                title:"required",
                author:"required",
                source:"required",
                editor:{
                    required : true,
                    verifyReq : true
                },
                uploadTime:"required"
            }

        });

        $.validator.addMethod("verifyReq",
            function(value, element) {
                if(!UE.getEditor('context').hasContents()) {
                    return false;
                }

            },
            "<span class='m_error'>请输入文本内容!</span>");

        $("#doReset").click(function() {
            if (confirm("确认要重置吗?")){
                editor.setContent("");
                $("#page")[0].reset();
            }
            return false;
        });
        $("#doReturn").click(function () {
            history.back(-1);
        });

        $("#firstMenu").change(function () {
            getsecondMenu();
        });
        getsecondMenu();
    })


</script>
<style type="text/css">
    .form-group{
        margin: 20px;
        width: 80%;
    }
    .form-control{
        width:50%;
        display: inline;
    }
    label{
        display: inline;
        cursor: pointer;
        float: left;
        width: 65px;
        margin: 8px 20px;
        text-align: right;
        vertical-align: middle;
    }
    input{
        font-size: inherit;
        display: inline;
        vertical-align: middle;
        line-height: -moz-block-height;
    }
    .file-input{
        margin-left: 175px;
        width:100%
    }
    .a,.c,.b{
        background-color: #055FA5;
        color: #FFFFFF;
        margin-right: 10px;
    }
    .b:hover{
        background-color: #055FA5;
        color: #FFFFFF;
    }
    .a:hover{
        background-color: #055FA5;
        color: #FFFFFF;
    }
    .c:hover{
        background-color: #055FA5;
        color: #FFFFFF;
    }
    #title-error #secondMenuId-error{
        color:red;
        float: right;
        width: 100px;
        margin-right: 220px;
        display: inline;
    }

</style>
<body>
<div class="container" style="margin-left: 10%; height: 100%;">
    <form method="post" name="frm" action="/admin/updateContent" accept-charset="UTF-8" id="page">
        <div class="form-group" style="float: left;">
            <label for="orign">文章类别:</label>
            <select  name="firstMenu" id="firstMenu" class="selectpicker show-tick form-control"  style="width: 130px;display: inline">
                <option style="display: none" value="">请选择</option>
                <c:forEach items="${firsts}" var="first">
                    <option value="${first.firstMenuId}" <c:if test="${first.firstMenuId==firstMenuId}">selected</c:if> >${first.firstMenuName}</option>
                </c:forEach>
            </select>
            <select name="secondMenuId" id="secondMenuId" style="width: 130px;display: inline" class="selectpicker show-tick form-control" >
                <option style="display:none;" value="">请选择</option>
            </select>
        </div>
        <div class="form-group">
            <label for="title">公告标题:</label>
            <input type="text" class="form-control" name="title" value="${content.title}" id="title"placeholder="请输入标题" />
        </div>
        <div class="form-group">
            <label for="keyword">发布人:</label>
            <input type="text" class="form-control" name="author" value="${content.author}" id="keyword"placeholder="请输入发布人" />
        </div>
        <div class="form-group">
            <label >来源:</label>
            <select class="selectpicker show-tick form-control" style="width: 130px" name="source">
                <option value="教务处" ${content.source eq "教务处"? "selected":""}>教务处</option>
                <option value="学工处" ${content.source eq "学工处"? "selected":""}>学工处</option>
                <option value="后勤处" ${content.source eq "后勤处"? "selected":""}>后勤处</option>
            </select>
        </div>

        <b style="margin-left: 43px">文章内容:</b>
        <div class="context" id="context" name="context" ></div>
        <script type="text/javascript" charset="utf-8" name="editor">
            var editor = UE.getEditor('context',{
                initialFrameWidth:1000,initialFrameHeight:600});
            editor.ready(function(){
                editor.setContent('${content.context}'.toString());
            })
        </script>
        <input type="hidden" name="pageContextId" value="${content.pageContextId}"/>
        <br>
        <br>
        <div class="form-group">
            <div class="btn" style="margin-left: 250px;">
                <input type="hidden" name="cur_page" value="">
                <button type="button" onclick="doSubmit()" class="btn btn-default b">确认修改</button>
                <button type="reset" id="doReset" class="btn btn-default c">重置</button>
                <button type="button" id="doReturn" class="btn btn-default c">返回</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
