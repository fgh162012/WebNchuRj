<%--
  Created by IntelliJ IDEA.
  User: zhouxuwen
  Date: 2019/1/14
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
</head>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
<script>

    function getCourse() {
        myChart.showLoading();
        $.get('/getDirectionListData').done(function (data) {
            console.log(data);
            console.log(data["list"])
            myChart.hideLoading();
            myChart.setOption({
                legend: {
                    data: [data["list"][0]["direction"],data["list"][1]["direction"],data["list"][2]["direction"],data["list"][3]["direction"],
                        data["list"][4]["direction"],data["list"][5]["direction"],data["list"][6]["direction"],data["list"][7]["direction"],data["list"][8]["direction"]]
                },
                series : [{

                    data: [
                        {value:data["data"][0],name:data["list"][0]["direction"]},
                        {value:data["data"][1],name:data["list"][1]["direction"]},
                        {value:data["data"][2],name:data["list"][2]["direction"]},
                        {value:data["data"][3],name:data["list"][3]["direction"]},
                        {value:data["data"][4],name:data["list"][4]["direction"]},
                        {value:data["data"][5],name:data["list"][5]["direction"]},
                        {value:data["data"][6],name:data["list"][6]["direction"]},
                        {value:data["data"][7],name:data["list"][7]["direction"]},
                        {value:data["data"][8],name:data["list"][8]["direction"]},

                    ]

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

        getCourse();
    })
</script>
<body style="height: 100%; margin: 0">
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
            text: '就业去向统计',
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