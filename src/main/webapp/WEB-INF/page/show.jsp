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
        用户名:<input type="text" name="userName"><br/>
        年 龄：<input type="text" name="startAge">-：<input type="text" name="endAge"><br/>
        性别：男<input type="checkbox" name="userSex" value="1">
        女<input type="checkbox" name="userSex" value="2"><br/>
        <input type="button" value="查询" onclick="load()">
    </form>
     <table border="1px" bordercolor="blue">
         <tr>
             <th>id</th>
             <th>用户名</th>
             <th>密码</th>
             <th>年龄</th>
             <th>用户性别</th>
             <th>身份证号</th>
             <th>创建时间</th>
             <th>update_time</th>
         </tr>
         <tbody id="tbd"></tbody>
     </table>

</body>
<script type="text/javascript">

    /**
     * 页面加载事件
     */
    $(function(){
        load();
    })


    function load() {
        $.post(
            "/users/list2",
            $("#frm").serialize(),
            function (result) {
                if(result.code == 200){
                   var data = result.data;
                   var html = "";
                   for (var i = 0; i < data.length; i++){
                       var user = data[i];
                       html += "<tr>";
                       html += "<td>"+user.id+"</td>";
                       html += "<td>"+user.userName+"</td>";
                       html += "<td>"+user.userPwd+"</td>";
                       html += "<td>"+user.userAge+"</td>";
                       html += "<td>"+user.userSex+"</td>";
                       html += "<td>"+user.userNumberId+"</td>";
                       html += "<td>"+user.createTime+"</td>";
                       html += "<td>"+user.updateTime+"</td>";
                       html += "<td><input type='button' value='删除' onclick='del("+user.id+")'></td>";
                       html += "<td><input type='button' value='修改' onclick='update("+user.id+")'></td>";
                       html += "</tr>";
                   }

                   $("#tbd").html(html);
                }
            }
        );
    }

    /**
     * 删除
     * @param id
     */
    function del(id) {
        $.post(
            "/users", {
            "_method" : "DELETE",
            "id":id
        }, function (result) {
            if(result.code == 200){
                load();
            }else {
                alert(result.msg);
                return;
            }
        });
    }

    function update(id){

        window.location.href="/toUpdate?id="+id;

    }


</script>
</html>
