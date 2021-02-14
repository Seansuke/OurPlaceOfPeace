const keyName = "OurPlaceOfPeace";

function loadDataByFile() {
	
}

function saveDataByFile() {
	
}

function loadDataByBrowser() {
    if (typeof(Storage) !== "undefined") {
        var jsonSave = localStorage.getItem(keyName);
        if (jsonSave !== "undefined" && jsonSave !== "") {
            return jsonSave;
        }
    }
    var jsonSave = getCookie(keyName);
    if (jsonSave !== "undefined" && jsonSave !== "") {
        return jsonSave;
    }
    return {
        errorCode: 1,
        message: "Local Storage loading failed. Cookie loading failed."
    };
}

function saveDataByBrowser(jsonSave) {
    if (typeof(Storage) === "undefined") {
        var jsonSave = localStorage.setItem(keyName, jsonSave);
        if (jsonSave !== "undefined" && jsonSave !== "") {
            return {
                errorCode: 0,
                message: "Saved!"
            };
        }
    }
    setCookie(keyName, jsonSave, 365);
    if (jsonSave !== "undefined" && jsonSave !== "") {
        return {
            errorCode: 0,
            message: "Saved!"
        };
    }
    return {
        errorCode: 1,
        message: "Saving Local Storage failed.  Cookie saving failed."
    };
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
