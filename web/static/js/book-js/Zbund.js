function btnAddToShelf(b_id,u_id) {
    if(u_id==null){
        if (confirm("请先登录！")){
        location.href = "view/sign-up-yh.jsp";}
    }else if(confirm("确认添加？")){
        location.href = "/addToShelf?b_id=" + b_id+"&&u_id="+u_id;}
}

function nextPg() {
    var pageNum = document.getElementById("pageNum").value;
    window.location.href="/houtai-shujileixingguanli?pageNumber="+pageNum;
}

function btnshujia(u_id) {
    if(u_id==null){
        if (confirm("请先登录！")){
            location.href = "view/sign-up-yh.jsp";}
    }else{
        location.href = "/user_info?u_id="+u_id;}
}


function btnqukankan(b_id,u_id) {
    if (u_id == null) {
        if (confirm("请先登录！")) {
            location.href = "view/sign-up-yh.jsp";
        }
    } else {
        location.href = "/book_infor?b_id=" + b_id;
    }
}

function btnconcern(user_id,u_id) {
    if (u_id == null) {
        if (confirm("请先登录！")) {
            location.href = "view/sign-up-yh.jsp";
        }
    } else {
        location.href = "/concern?user_id=" + user_id;
    }
}

function btnArticle(lc_id,u_id){
    if (u_id == null) {
        if (confirm("请先登录！")) {
            location.href = "view/sign-up-yh.jsp";
        }
    } else {
        location.href = "/article?lc_id=" + lc_id;
    }
}