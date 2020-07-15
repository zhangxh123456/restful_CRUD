<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/10
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/res/js/jquery-1.12.4.min.js"></script>
</head>
<body>
    <form id="frm">
        <input type="text" name="id" value="${user.id}">
        <input type="hidden" name="_method" value="PUT">
        用户名:<input type="text" id="userName" value="${user.userName}">
        密码:<input type="text" id="userPwd" value="${user.userPwd}">
        年龄:<input type="text" id="userAge" value="${user.userAge}">
        性别: <input type="text" id="userSex" value="${user.userSex}">
       <input type="button" value="修改" onclick="upd()">


    </form>

</body>
<script type="text/javascript">

    function upd() {
        $.post(
            "/users",
            $("#frm").serialize(),
            function (result) {
                if(result.code == 200){
                    window.location.href="/toShow";
                }else {
                    alert(result.msg);
                    return;
                }
            });

    }

</script>
</html>
