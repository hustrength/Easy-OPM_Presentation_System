function agree(sid, tid) {

    $.ajax({
        url: "/apply/agree.do",
        type: "post",
        data:{
            "tid" : tid,
            "sid" : sid
        },
        success: function (text) {
            if (text === "success") {
                alert("已同意");
                $("#msg").load(location.href + " #msg");
            } else if (text === "full") {
                alert("队伍人数已满");
            } else {
                alert("操作失败，部分数据可能被破坏")
            }
        }
    })
}

function refuse(sid, tid) {
    $.ajax({
        url: "/apply/refuse.do",
        type: "post",
        data:{
            "tid" : tid,
            "sid" : sid
        },
        success: function (text) {
            if (text === "success") {
                alert("已拒绝");
                $("#msg").load(location.href + " #msg");
            } else {
                alert("操作失败")
            }
        }
    })
}

function apply_confirm(sid, tid) {
    $.ajax({
        url: "/apply/confirm.do",
        type: "post",
        data:{
            "tid" : tid,
            "sid" : sid
        },
        success: function (text) {
            if (text === "success") {
                $("#msg").load(location.href + " #msg");
            } else {
                alert("确认失败")
            }
        }
    })
}