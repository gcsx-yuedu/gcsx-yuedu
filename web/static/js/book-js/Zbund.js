function btnAddToShelf(b_id,u_id) {
    if (confirm("确认添加？"))
        location.href = "/addToShelf?b_id=" + b_id+"&u_id="+u_id;
}

function nextPg() {
    var pageNum = document.getElementById("pageNum").value;
    window.location.href="/houtai-shujileixingguanli?pageNumber="+pageNum;
}