function apply(tid, sid) {
    $.ajax({
        url: "apply/insertApply.do",
        type: "post",
        data: {
            "tid": tid,
            "sid": sid
        },
        success: function (text) {
            if (text === "success") {
                alert("提交加入申请成功");
            } else if (text === "applied") {
                alert("你已申请过该团队");
            } else {
                alert("申请失败");
            }
        }
    })
}


