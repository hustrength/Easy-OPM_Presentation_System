function break_group(tid, captain_id) {
    $.ajax({
        url: "/team/deleteGps.do",
        type: "post",
        data: {
            "tid": tid,
            "captain_id": captain_id
        },
        success: function (text) {
            if (text === "success") {
                alert("解散成功");
                location.reload();
            } else {
                alert("解散失败，可能有部分团队数据丢失");
            }
        }
    })
}

function remove_member(tid, sid) {
    $.ajax({
        url: "/team/removeMember.do",
        type: "post",
        data: {
            "tid": tid,
            "captain_id": sid
        },
        success: function (text) {
            if (text === "success") {
                alert("踢出成功");
                location.reload();
            } else if (text === "fail_to_update_stu_pos") {
                alert("踢出失败，丢失被踢出者数据")
            } else {
                alert("踢出失败");
            }
        }
    })
}

function transfer_leader(tid, newCaptainId, oldCaptainId) {
    $.ajax({
        url: "/team/transferLeader.do",
        type: "post",
        data: {
            "tid": tid,
            "newCaptainId": newCaptainId,
            "oldCaptainId": oldCaptainId
        },
        success: function (text) {
            if (text === "success") {
                alert("转让成功");
                location.reload();
            } else {
                alert("转让失败，可能丢失部分数据");
            }
        }
    })
}

function quit_group(tid, sid) {

    $.ajax({
        url: "/team/quitTeam.do",
        type: "post",
        data: {
            "tid": tid,
            "sid": sid
        },
        success: function (text) {
            if (text === "success") {
                alert("退出成功");
                location.reload();
            } else {
                alert("退出失败");
            }
        }
    })
}