<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/func.tld" prefix="func" %>
<%--
  Created by IntelliJ IDEA.
  User: 范孝发
  Date: 2019/1/12
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发展趋势</title>
    <script language="javascript">
        //打印表格
        var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if (explorer.indexOf("Chrome") >= 0) {
                return 'Chrome';
            }
            //Opera
            else if (explorer.indexOf("Opera") >= 0) {
                return 'Opera';
            }
            //Safari
            else if (explorer.indexOf("Safari") >= 0) {
                return 'Safari';
            }
        }
        function method(tableid) {
            if (getExplorer() == 'ie') {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");
                var oWB = oXL.Workbooks.Add();
                var xlsheet = oWB.Worksheets(1);
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                sel.select();
                sel.execCommand("Copy");
                xlsheet.Paste();
                oXL.Visible = true;

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                        "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);
                    oWB.Close(savechanges = false);
                    oXL.Quit();
                    oXL = null;
                    idTmr = window.setInterval("Cleanup();", 1);
                }

            } else {
                tableToExcel(tableid)
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
            var uri = 'data:application/vnd.ms-excel;base64,', template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>', base64 = function(
                s) {
                return window.btoa(unescape(encodeURIComponent(s)))
            }, format = function(s, c) {
                return s.replace(/{(\w+)}/g, function(m, p) {
                    return c[p];
                })
            }
            return function(table, name) {
                if (!table.nodeType)
                    table = document.getElementById(table)
                var ctx = {
                    worksheet : name || 'Worksheet',
                    table : table.innerHTML
                }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>
</head>
<body>
<form method="post" action="/trend">
    <input type="text" name="classNo" value="${classNo}">
    <input type="submit">
</form>
<input type="button" onclick="method(tab)" value="下载表格">
<c:if test="${not empty analyticResults}">
    <table border="1" id="tab">
        <tr>
            <th>学号</th><th>姓名</th><th>一阶</th><th>二阶</th><th>三阶</th><th>四阶</th><th>五阶</th>
        </tr>
        <c:forEach items="${analyticResults}" var="analyticResult">
            <tr>
                <td>${analyticResult.stuId}</td>
                <td>${analyticResult.stuName}</td>
                <c:forEach items="${analyticResult.trend}" var="trend">
                    <c:if test="${trend eq '下降'}">
                        <td style="background-color: red">${trend}</td>
                    </c:if>
                    <c:if test="${trend eq '提高'}">
                        <td style="background-color:#38F54B">${trend}</td>
                    </c:if>
                    <c:if test="${trend eq '不确定'}">
                        <td style="background-color: #DFE1E3">${trend}</td>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
