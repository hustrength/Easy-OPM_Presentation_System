function pro_release() {
    const CName = document.getElementById("Pname").value;
    const CIntro = document.getElementById("Intro").value;
    // const CBackground = document.getElementById("Bg").value;
    // const CInfo = document.getElementById("Info").value;
    // const COther = document.getElementById("Other").value;

    const obj = {
        "CName" : CName,
        "CIntro" : CIntro
        // ,
        // "CBackground" : CBackground,
        // "CInfo" : CInfo,
        // "COther" : COther
    }

    $.ajax({
        url: "/competition/release.do",
        type: "post",
        data: obj,
        success: function (text) {
            if (text === "success") {
                alert("发布成功");
                location.reload();
            } else {
                alert("发布失败");
            }
        }
    })
}