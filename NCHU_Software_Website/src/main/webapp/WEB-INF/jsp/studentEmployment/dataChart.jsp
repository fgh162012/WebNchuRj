<%--
  Created by IntelliJ IDEA.
  User: zhouxuwen
  Date: 2019/1/14
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">

</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>

<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script>

     function getCourse() {
        myChart.showLoading();
        var id = $("#direct").find('option:selected').val();
        var url="/getCourseListData/"+id;
        $.get(url).done(function (data) {
            console.log(data);
            console.log(data["list"])
            myChart.hideLoading();
            myChart.setOption({
                legend: {
                    data: [data["list"][0]["courseName"],data["list"][1]["courseName"],data["list"][2]["courseName"],data["list"][3]["courseName"]]
                },
                series : [{
                    name: data["list"][0]["courseName"],
                    data: data["list"][0]["num"]
                },{
                    name: data["list"][1]["courseName"],
                    data: data["list"][1]["num"]
                },{
                    name: data["list"][2]["courseName"],
                    data: data["list"][2]["num"]
                },{
                    name: data["list"][3]["courseName"],
                    data: data["list"][3]["num"]
                }]

            });
        });
    }

    $().ready(function () {
//        $.ajax({
//            type:"post",
//            url:"/getTitleList",
//            contentType:"application/json",
//            success: function (data) {
//                console.log(data);
//                listTom = data;
//            }
//        })
        console.log("ssss");

        $("#direct").change(function () {
            getCourse();
        });

        getCourse();
    })
</script>
<body style="height: 100%; margin: 0">
<div style="margin: 20px">

    <select name="firstMenu" onchange="secondMenu(this.value)" id="direct" width="100px" class="btn btn-primary">
        <c:forEach items="${directions}" var="direction">
            <option value="${direction.id}" <c:if test="${direction.id}==1">selected</c:if> >${direction.direction}</option>
        </c:forEach>
    </select>
</div>
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>

<script type="text/javascript">


    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title : {
            text: '就业去向及学习成绩分析',
            top:"auto",

//            subtext: '纯属虚构'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data: [],

        },
        toolbox: {
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : ['0~60','60~65','65~70','70~75','75~80','80~85','85~90','90~95','95~100']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:[],
                type:'bar',
                data:[],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {


                }
            },
            {
                name:[],
                type:'bar',
                data:[],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {

                }
            },
            {
                name:[],
                type:'bar',
                data:[],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {


                }
            },
            {
                name:[],
                type:'bar',
                data:[],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {

                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>
