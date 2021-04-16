function pro_edit(i, cid) {
    const pname_id = "Pname" + i.toString();
    const intro_id = "Intro" + i.toString();
    const pname = document.getElementById(pname_id).value;
    const intro = document.getElementById(intro_id).value;

    $.ajax({
        url: "/competition/update.do",
        type: "post",
        data: {
            "CName": pname,
            "CIntro": intro,
            "CID": cid
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

function remove_pro(pno) {

    $.ajax({
        url: "/competition/delete.do",
        type: "post",
        data: {"CID": pno},
        success: function (text) {
            if (text === "success") {
                alert("删除成功");
                location.reload();

            } else {
                alert("删除失败");
            }
        }
    })
}