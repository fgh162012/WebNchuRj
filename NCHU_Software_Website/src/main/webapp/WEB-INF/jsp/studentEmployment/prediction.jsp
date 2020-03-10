<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhouxuwen
  Date: 2019/1/14
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>

<script>

    function getdata() {
        var one=$("#${lists.get(0).courseNo}").val();
        console.log(${lists.get(0).courseNo});
        console.log(one);
        var two=$("#${lists.get(1).courseNo}").val();
        var three=$("#${lists.get(2).courseNo}").val();
        var four=$("#${lists.get(3).courseNo}").val();
        if(one==""||two==""||three==""||four=="") {
            alert("输入框不能空！");
        }
        else if(!(one >= 0&&one <= 100 && two >= 0&&two <= 100 && three >= 0&&three <= 100 && four >= 0&&four <= 100)) {
            alert("请输入一个0~100的数！");
        }
        else {
            myChart.showLoading();
            var url="/test4/"+one+"/"+two+"/"+three+"/"+four;
            $.get(url).done(function (data) {
                console.log(data);
                console.log(data["list"])
                myChart.hideLoading();
                myChart.setOption({
                    title:{
                        text: '预测结果',
                    },
                    legend: {
                        data: [data["list"][0]["jy"],data["list"][1]["jy"],data["list"][2]["jy"],data["list"][3]["jy"],
                            data["list"][4]["jy"],data["list"][5]["jy"],data["list"][6]["jy"],data["list"][7]["jy"],data["list"][8]["jy"]]
                    },
                    series : [{

                        data: [
                            {value:data["list"][0]["pro"],name:data["list"][0]["jy"]},
                            {value:data["list"][1]["pro"],name:data["list"][1]["jy"]},
                            {value:data["list"][2]["pro"],name:data["list"][2]["jy"]},
                            {value:data["list"][3]["pro"],name:data["list"][3]["jy"]},
                            {value:data["list"][4]["pro"],name:data["list"][4]["jy"]},
                            {value:data["list"][5]["pro"],name:data["list"][5]["jy"]},
                            {value:data["list"][6]["pro"],name:data["list"][6]["jy"]},
                            {value:data["list"][7]["pro"],name:data["list"][7]["jy"]},
                            {value:data["list"][8]["pro"],name:data["list"][8]["jy"]},

                        ]

                    }]

                });
            });

        }

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

//        $("direct").onclick(function () {
//            console.log("3333333333333333");
//            getdata();
//        })
    })
</script>

<body class="container" style="height: 100%; margin: 20px">
<h3 style="text-align: center;">就业预测</h3>
<form method="post" action="/" accept-charset="UTF-8" id="">
    <c:forEach items="${lists}" var="list">
        <div class="form-group row">
            <label for="${list.courseNo}" class="col-sm-2 col-form-label" style="text-align: right;padding: 7px 0 0 0;">${list.courseName}:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="title" id="${list.courseNo}" style="color: black" placeholder="请输入分数0~100" />
            </div>
        </div>
    </c:forEach>


    <div class="form-group">
        <div class="btn" style="margin-left: 450px;">
            <input type="button" class="btn btn-default b" id="direct" value="预测" onclick="getdata()"></input>
            <button type="reset" id="doReset" class="btn btn-default c">重置</button>
            <button type="button" id="doReturn" class="btn btn-default c">返回</button>
        </div>
    </div>

</form>

<div id="container" style="height: 50%"></div>
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
            text: '',
//            subtext: '纯属虚构',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: []
        },
        series : [
            {
                name: '就业去向',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[

                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
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