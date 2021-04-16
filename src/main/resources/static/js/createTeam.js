var flag = false;

function check_gname_repeat() {
    var ele = document.getElementById("Gname");
    var val = ele.value;

    $.ajax({
        url: "team/checkTeamName.do",
        type: "post",
        data: {"teamName" : val},
        success: function (text) {
            if (text === "true") {
                flag = true;
            } else {
                flag = false;
                ele.setCustomValidity("团队名已被注册");
            }

        }
    })
}

function create_team() {

    if (flag === false) return false;

    const group_project = "/stu/competition_team";

    const teamName = document.getElementById("Gname").value;
    const cid = document.getElementById("PNo").value;
    const vacantPos = document.getElementById("Gsnum").value;

    const obj = {
        "teamName" : teamName,
        "cid" : cid,
        "vacantPos" : vacantPos
    };

    $.ajax({
        url: "team/createTeam.do",
        type: "post",
        data: obj,
        success: function (text) {
            if (text === "success") {
                alert("创建成功");
                window.location.href = group_project;
            } else if (text === "user empty") {
                alert("用户登录信息失效，请重新登录");
            } else {
                alert("创建失败");
            }
        }
    })

}

