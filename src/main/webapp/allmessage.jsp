<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: LLeavee
  Date: 2023/12/18
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理信息</title>
    <link href="./css/allmessage.css" rel="stylesheet">
</head>
<body>
<table border="1" cellspacing="0" width="700" align="center">
    <tr>
        <th>学号</th>
        <th>名字</th>
        <th>性别</th>
        <th>年龄</th>
        <th>入学年份</th>
        <th>班级</th>
        <th>专业</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <c:forEach var="stu" items="${sessionScope.stuList}">
        <tr>
            <td>${stu.userId}</td>
            <td>${stu.userName}</td>
            <td>${stu.userSex}</td>
            <td>${stu.userAge}</td>
            <td>${stu.markYear}</td>
            <td>${stu.classId}</td>
            <td>${stu.majorId}</td>
            <td><a href="/JWXT/InfoServlet?oper=detail&man=stu&userId=${stu.userId}" id="update_stu">修改</a></td>
            <td><a href="/JWXT/InfoServlet?oper=studel&userId=${stu.userId}">删除</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="9">
            一共${sessionScope.stupagetotal}页
            <a href="/JWXT/InfoServlet?oper=root&stupid=${sessionScope.stupid-1}">上一页</a>
            当前第
            <c:set var="begin" value="${sessionScope.stupid-2}"/>
            <c:set var="end" value="${sessionScope.stupid+2}"/>
            <c:if test="${end>sessionScope.stupagetotal}">
                <c:set var="end" value="${sessionScope.stupagetotal}"/>
            </c:if>
            <c:if test="${begin<=0}">
                <c:set var="begin" value="1"/>
            </c:if>
            <c:forEach var="i" begin="${begin}" end="${end}" step="1">
                <c:choose>
                    <c:when test="${i!=sessionScope.stupid}">
                        <a href="/JWXT/InfoServlet?oper=root&stupid=${i}">${i}
                        </a>
                    </c:when>
                    <c:otherwise>
                        ${i}
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            页
            <a href="/JWXT/InfoServlet?oper=root&stupid=${sessionScope.stupid+1}">下一页</a>
        </td>
    </tr>
</table>

<br/>

<table border="1" cellspacing="0" width="700" align="center">
    <tr>
        <th>职工号</th>
        <th>名字</th>
        <th>性别</th>
        <th>年龄</th>
        <th>学历</th>
        <th>职称</th>
        <th>入职时间</th>
        <th>办公室</th>
        <th>教室</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <c:forEach var="teach" items="${sessionScope.teachList}">
        <tr>
            <td>${teach.teachId}</td>
            <td>${teach.teachName}</td>
            <td>${teach.teachSex}</td>
            <td>${teach.teachAge}</td>
            <td>${teach.degree}</td>
            <td>${teach.title}</td>
            <td>${teach.teachYear}</td>
            <td>${teach.roomId}</td>
            <td>${teach.classId}</td>
            <td><a href="/JWXT/InfoServlet?oper=detail&man=teach&teachId=${teach.teachId}" id="update_teach">修改</a>
            </td>
            <td><a href="/JWXT/InfoServlet?oper=teachdel&teachId=${teach.teachId}">删除</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="11">
            一共${sessionScope.teachpagetotal}页
            <a href="/JWXT/InfoServlet?oper=root&teachpid=${sessionScope.teachpid-1}">上一页</a>
            当前第
            <c:set var="begin" value="${sessionScope.teachpid-2}"/>
            <c:set var="end" value="${sessionScope.teachpid+2}"/>
            <c:if test="${end>sessionScope.teachpagetotal}">
                <c:set var="end" value="${sessionScope.teachpagetotal}"/>
            </c:if>
            <c:if test="${begin<=0}">
                <c:set var="begin" value="1"/>
            </c:if>
            <c:forEach var="i" begin="${begin}" end="${end}" step="1">
                <c:choose>
                    <c:when test="${i!=sessionScope.teachpid}">
                        <a href="/JWXT/InfoServlet?oper=root&teachpid=${i}">${i}
                        </a>
                    </c:when>
                    <c:otherwise>
                        ${i}
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            页
            <a href="/JWXT/InfoServlet?oper=root&teachpid=${sessionScope.teachpid+1}">下一页</a>
        </td>
    </tr>
</table>
<%--<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(function (){
        $("#update_stu").click(function (){
            sessionStorage.setItem("stu", ${stu})
        })
    }) //jquery
</script>--%>
</body>
</html>
