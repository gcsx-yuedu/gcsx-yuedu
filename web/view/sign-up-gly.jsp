<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<head>
    <meta charset="utf-8">
    <title>管理员登陆</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/gly-css/style.css">
</head>

<body>
<div class="content">
    <!-- 登陆 -->
    <div class="form sign-in">
        <h2>管理员登录</h2>
        <label>
            <span>用户名</span>
            <input id="a_name" type="text"/>
        </label>
        <label>
            <span>密码</span>
            <input id="a_password" type="password"/>
        </label>

        <!-- <button type="button" class="fb-btn">使用 <span>facebook</span> 帐号登录</button> -->
        <label>
            <span>验证码(区分大小写)</span>
            <input type="text" id="text0"/>
            <canvas class="yzmimg" id="canvas0" width="100" height="43" onclick="dj0()"
                    style="border: 1px solid #ccc;
				        border-radius: 5px;"></canvas>
        </label>
        <!-- 生成随机验证码	 -->
        <script src="http://lib.sinaapp.com/js/jquery/2.2.4/jquery-2.2.4.min.js"></script>
        <script>
            var show_num = [];
            draw0(show_num);

            function dj0() {
                draw0(show_num);
            }

            function sublim0() {
                var val = document.getElementById("text0").value;
                var num = show_num.join("");
                var a_name = document.getElementById("a_name").value;
                var a_password = document.getElementById("a_password").value;
                if (val === '') {
                    alert('请输入验证码！');
                } else if (val === num) {
                    alert('提交成功！');
                    $.ajax({
                        url : "/ManagerCheck?name="+a_name+"&password="+a_password,
                        async : false,
                        type : "post",
                        dataType : "text",
                        success:function (d) {
                            if (d=="1") {
                                alert("核验成功！");
                                window.location.href="houtai-xinxitongji.jsp";
                            }else if (d == "2") {
                                alert("核验失败！")
                            }else {
                                alert("出错！")
                            }
                        },
                        error:function () {
                            alert("系统出错！")
                        }
                    });
                    document.getElementById(".input-val").val('');
                    draw0(show_num);

                } else {
                    alert('验证码错误！\n你输入的是:  ' + val + "\n正确的是:  " + num + '\n请重新输入！');
                    document.getElementById("text").value = '';
                    draw0(show_num);
                }



            }

            function draw0(show_num) {
                var canvas_width = document.getElementById('canvas0').clientWidth;
                var canvas_height = document.getElementById('canvas0').clientHeight;
                var canvas = document.getElementById("canvas0");//获取到canvas的对象，演员
                var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
                canvas.width = canvas_width;
                canvas.height = canvas_height;
                var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m";
                var aCode = sCode.split(",");
                var aLength = aCode.length;//获取到数组的长度

                for (var i = 0; i <= 3; i++) {
                    var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
                    var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
                    var txt = aCode[j];//得到随机的一个内容
                    show_num[i] = txt;
                    var x = 10 + i * 20;//文字在canvas上的x坐标
                    var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
                    context.font = "bold 23px 微软雅黑";

                    context.translate(x, y);
                    context.rotate(deg);

                    context.fillStyle = randomColor();
                    context.fillText(txt, 0, 0);

                    context.rotate(-deg);
                    context.translate(-x, -y);
                }
                for (var i = 0; i <= 5; i++) { //验证码上显示线条
                    context.strokeStyle = randomColor();
                    context.beginPath();
                    context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
                    context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
                    context.stroke();
                }
                for (var i = 0; i <= 30; i++) { //验证码上显示小点
                    context.strokeStyle = randomColor();
                    context.beginPath();
                    var x = Math.random() * canvas_width;
                    var y = Math.random() * canvas_height;
                    context.moveTo(x, y);
                    context.lineTo(x + 1, y + 1);
                    context.stroke();
                }
            }

            function randomColor() {//得到随机的颜色值
                var r = Math.floor(Math.random() * 256);
                var g = Math.floor(Math.random() * 256);
                var b = Math.floor(Math.random() * 256);
                return "rgb(" + r + "," + g + "," + b + ")";
            }
        </script>
        <p class="forgot-pass"><a href="sign-up-yh.jsp">用户登录</a></p>
        <!-- <label>
            <span><input style="display: inline;" name="yh/gly" value="1" type="radio" />用户</span>
            <span><input style="display: inline;" name="yh/gly" value="2" type="radio" />管理员</span>
        </label> -->
        <button onclick="sublim0()" type="button" class="submit">登 录</button>
    </div>

    <div id="gly-sign-in" class="sub-cont">

    </div>
    <!--<div class="img">-->
        <!--<div class="img__text m&#45;&#45;up">-->
            <!--<h2>还未注册？</h2>-->
            <!--<p>立即注册，发现大量机会！</p>-->
        <!--</div>-->
        <!--<div class="img__text m&#45;&#45;in">-->
            <!--<h2>已有帐号？</h2>-->
            <!--<p>有帐号就登录吧，好久不见了！</p>-->
        <!--</div>-->
        <!--<div class="img__btn">-->
            <!--<span class="m&#45;&#45;up">注 册</span>-->
            <!--<span class="m&#45;&#45;in">登 录</span>-->
        <!--</div>-->
    <!--</div>-->
    <!-- 注册 -->
    <!-- <div class="form sign-up">
         <h2>立即注册</h2>
         <label>
             <span>用户名</span>
             <input type="text" />
         </label>
         <label>
             <span>邮箱</span>
             <input type="email" />
         </label>
         <label>
             <span>密码</span>
             <input type="password" />
         </label>
         <label>
             <span>再次输入密码</span>
             <input type="password" />
         </label>
         <label>
             <span>验证码(区分大小写)</span>
             <input id="text" type="text" />
             <canvas class="yzmimg" id="canvas" width="100" height="43" onclick="dj()"
                   style="border: 1px solid #ccc;
                     border-radius: 5px;"></canvas>
         </label>
          生成随机验证码	 -->
    <!--<script>-->
        <!--var show_num = [];-->
        <!--draw(show_num);-->

        <!--function dj() {-->
            <!--draw(show_num);-->
        <!--}-->

        <!--function sublim() {-->
            <!--var val = document.getElementById("text").value;-->
            <!--var num = show_num.join("");-->
            <!--if (val == '') {-->
                <!--alert('请输入验证码！');-->
            <!--} else if (val == num) {-->
                <!--alert('提交成功！');-->
                <!--document.getElementById(".input-val").val('');-->
                <!--draw(show_num);-->

            <!--} else {-->
                <!--alert('验证码错误！\n你输入的是:  ' + val + "\n正确的是:  " + num + '\n请重新输入！');-->
                <!--document.getElementById("text").value = '';-->
                <!--draw(show_num);-->
            <!--}-->


        <!--}-->

        <!--function draw(show_num) {-->
            <!--var canvas_width = document.getElementById('canvas').clientWidth;-->
            <!--var canvas_height = document.getElementById('canvas').clientHeight;-->
            <!--var canvas = document.getElementById("canvas");//获取到canvas的对象，演员-->
            <!--var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台-->
            <!--canvas.width = canvas_width;-->
            <!--canvas.height = canvas_height;-->
            <!--var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m";-->
            <!--var aCode = sCode.split(",");-->
            <!--var aLength = aCode.length;//获取到数组的长度-->

            <!--for (var i = 0; i <= 3; i++) {-->
                <!--var j = Math.floor(Math.random() * aLength);//获取到随机的索引值-->
                <!--var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度-->
                <!--var txt = aCode[j];//得到随机的一个内容-->
                <!--show_num[i] = txt;-->
                <!--var x = 10 + i * 20;//文字在canvas上的x坐标-->
                <!--var y = 20 + Math.random() * 8;//文字在canvas上的y坐标-->
                <!--context.font = "bold 23px 微软雅黑";-->

                <!--context.translate(x, y);-->
                <!--context.rotate(deg);-->

                <!--context.fillStyle = randomColor();-->
                <!--context.fillText(txt, 0, 0);-->

                <!--context.rotate(-deg);-->
                <!--context.translate(-x, -y);-->
            <!--}-->
            <!--for (var i = 0; i <= 5; i++) { //验证码上显示线条-->
                <!--context.strokeStyle = randomColor();-->
                <!--context.beginPath();-->
                <!--context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);-->
                <!--context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);-->
                <!--context.stroke();-->
            <!--}-->
            <!--for (var i = 0; i <= 30; i++) { //验证码上显示小点-->
                <!--context.strokeStyle = randomColor();-->
                <!--context.beginPath();-->
                <!--var x = Math.random() * canvas_width;-->
                <!--var y = Math.random() * canvas_height;-->
                <!--context.moveTo(x, y);-->
                <!--context.lineTo(x + 1, y + 1);-->
                <!--context.stroke();-->
            <!--}-->
        <!--}-->

        <!--function randomColor() {//得到随机的颜色值-->
            <!--var r = Math.floor(Math.random() * 256);-->
            <!--var g = Math.floor(Math.random() * 256);-->
            <!--var b = Math.floor(Math.random() * 256);-->
            <!--return "rgb(" + r + "," + g + "," + b + ")";-->
        <!--}-->
    <!--</script>-->
    <!--<button onclick="sublim()" type="button" class="submit">注 册</button>-->
    <!-- <button type="button" class="fb-btn">使用 <span>facebook</span> 帐号注册</button> -->
</div>
<!--<script src="../../js/gly-js/script.js"></script>-->
</body>

</html>