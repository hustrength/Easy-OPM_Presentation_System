function update_noti() {
    const title = document.getElementById("title").value;
    const content = document.getElementById("content").value;

    $.ajax({
        url: "/notification/update.do",
        type: "post",
        data: {
            "title" : title,
            "content" : content
        },
        success: function (text) {
            if (text === "success") {
                alert("修改成功");
                location.reload();
            } else {
                alert("修改失败");
            }
        }
    })
}