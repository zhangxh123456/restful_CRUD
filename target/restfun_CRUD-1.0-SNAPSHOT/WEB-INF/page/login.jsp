<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/10
  Time: 16:25
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
        <table border="1px" bordercolor="blue">
            <tr>
                <td>用户名:</td>
                <td><input type="text" name="userName" value="#{userName}"><br/></td>
            </tr>
            <tr>
                <td>密 码:</td>
                <td><input type="text" name="userPwd"><br/></td>
            </tr>
        </table>


        <input type="button" value="登陆" onclick="regis()">
    </form>

</body>
<script type="text/javascript">
    function regis() {
        $.post(
            "/users/list",
            $("#frm").serialize(),
            function (result) {
                if(result.code == 200){
                    alert(result.msg);
                    window.location.href="/toShow";
                }else {
                    alert(result.msg);
                    return;
                }
            }
        );
    }


</script>
</html>
