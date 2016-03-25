<%--
  Created by IntelliJ IDEA.
  User: InCosmos
  Date: 2016/2/22
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1">
        <s:iterator var="ite" value="posts" >
            <tr>
                <td>
                    <s:property value="content"/>
                </td>
            </tr>
        </s:iterator>
    </table>

    方法1！
</body>
</html>
