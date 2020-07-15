<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/10
  Time: 16:21
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
         <table>
             <tr>
                 <td>用户名:</td>
                 <td><input type="text" name="userName"></td>
             </tr>
             <tr>
                 <td>密 码:</td>
                 <td><input type="text" name="userPwd"></td>
             </tr>
             <tr>
                 <td>年 龄：</td>
                 <td> <input type="text" name="userAge"></td>
             </tr>
             <tr>
                 <td>性别</td>
                 <td>男<input type="radio" name="userSex" value="1">
                     女<input type="radio" name="userSex" value="2"></td>
             </tr>
             <tr>
                 <td>身份证号:</td>
                 <td><input type="text" name="userNumberId"></td>
             </tr>
             <tr>
                 <td colspan="2"><input type="button" value="注册" onclick="zhuCe()"></td>
             </tr>
         </table>
     </form>
</body>
<script type="text/javascript">

    function zhuCe() {
        $.post(
            "/users",
            $("#frm").serialize(),
            function (result) {
               if(result.code == 200){
                   alert(result.msg);
                   window.location.href="/toLogin?userName="+result.data.userName;
               }else {
                   alert(result.msg);
                   return;
               }
            }
        );
    }

</script>
</html>
