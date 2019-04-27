'use strict';

function keypressNumber(ControlId) {
    //Allow Only PositiveInteger
    return $("#" + ControlId).limitkeypress({ rexp: /^[+0-9]+$/ });
}

function fn_D2M2Y4_M2D2Y4(sD2M2Y4) {
    //Convert DD/MM/YYYY to MM/DD/YYYY
    //Reason to use: MM/DD/YYYY can be stored as DateTime in C# and MSSQL DB
    var sYear = sD2M2Y4.split('/')[2];
    var sMonth = sD2M2Y4.split('/')[1];
    var sDay = sD2M2Y4.split('/')[0];
    var dt = sMonth + '/' + sDay + '/' + sYear;
    return dt;
}

//////////////////////////////////////////////////////////
//HTML5 Session - START
function storageAvailable(type) {
    try {
        var storage = window[type],
            x = '__storage_test__';
        storage.setItem(x, x);
        storage.removeItem(x);
        return true;
    }
    catch (e) {
        return e instanceof DOMException && (
            // everything except Firefox
            e.code === 22 ||
            // Firefox
            e.code === 1014 ||
            // test name field too, because code might not be present
            // everything except Firefox
            e.name === 'QuotaExceededError' ||
            // Firefox
            e.name === 'NS_ERROR_DOM_QUOTA_REACHED') &&
            // acknowledge QuotaExceededError only if there's something already stored
            storage.length !== 0;
    }
}

function checkStorage() {
    if (storageAvailable('localStorage')) {
        // Yippee! We can use localStorage awesomeness
        console.log("Support Storage! Yay!");

        // Initialize Cart
        if (sessionStorage.currentCart == null || sessionStorage.currentCart == null)
            sessionStorage.currentCart = JSON.stringify([]);
    }
    else {
        // Too bad, no localStorage for us
    }
}

function addToCart(obj) {
    var JSONcurrentCart = sessionStorage.currentCart;

    var currentCart;

    if (JSONcurrentCart == "")
        currentCart = [];
    else
        currentCart = JSON.parse(JSONcurrentCart);

    currentCart = checkCart_and_AddName(currentCart, obj.MPO_GUID);
    sessionStorage.currentCart = JSON.stringify(currentCart);
}

function loadCartItems() {
    return sessionStorage.currentCart;
}

function checkCart_and_AddName(arrObject, sName) {
    //To check whether the product is added already or not. If no, then add. If yes, then do nothing.
    var found = arrObject.some(function (el) {
        return el.MPO_GUID == sName;
    });

    if (!found) {
        arrObject.push({ MPO_GUID: sName, BOD_QUANTITY: 1 });
    }
    else {
        var id = arrObject.findIndex(x => x.MPO_GUID == sName);

        var obj = arrObject[id];
        obj.BOD_QUANTITY = obj.BOD_QUANTITY + 1;
        arrObject[id] = obj;
    }

    return arrObject;
}

function checkCart_and_AddName(arrObject, sName, iQuantity) {
    //To check whether the product is added already or not. If no, then add. If yes, then do nothing.
    var found = arrObject.some(function (el) {
        return el.MPO_GUID == sName;
    });

    if (!found) {
        arrObject.push({ MPO_GUID: sName, BOD_QUANTITY: iQuantity });
    }
    else {
        var id = arrObject.findIndex(x => x.MPO_GUID == sName);

        var obj = arrObject[id];
        obj.BOD_QUANTITY = obj.BOD_QUANTITY + iQuantity;
        arrObject[id] = obj;
    }

    return arrObject;
}

function checkCart_and_RemoveName(sName) {
    //To remove product.
    var arrObject = JSON.parse(sessionStorage.currentCart);

    var ID = arrObject.findIndex(x => x.MPO_GUID == sName);

    if (ID!=-1) { arrObject.splice(ID,1); }

    sessionStorage.currentCart = JSON.stringify(arrObject);

    return JSON.stringify(arrObject);
}

function checkCart_and_UpdateQty(sName, quantity) {
    //To update the product quantity.
    var arrObject = JSON.parse(sessionStorage.currentCart);

    var ID = arrObject.findIndex(x => x.MPO_GUID == sName);

    var obj = arrObject[ID];
    obj.BOD_QUANTITY = quantity;
    arrObject[ID] = obj;

    sessionStorage.currentCart = JSON.stringify(arrObject);

    return JSON.stringify(arrObject);
}
//HTML5 Session - END
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
//C# Session - START
function addToCart_ASPX_CS(sPageURL, obj) {
    var JSONcurrentCart;

    $.ajax({
        async: false,
        type: "POST",
        url: sPageURL + "/GetCart",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            JSONcurrentCart = result.d;

            var currentCart;

            if (JSONcurrentCart == "" || JSONcurrentCart == undefined)
                currentCart = [];
            else
                currentCart = JSON.parse(JSONcurrentCart);

            if (obj.hasOwnProperty("BOD_QUANTITY")) {
                currentCart = checkCart_and_AddName(currentCart, obj.MPO_GUID, obj.BOD_QUANTITY);
            } else {
                currentCart = checkCart_and_AddName(currentCart, obj.MPO_GUID);
            }

            var sUpdatedCart = JSON.stringify(currentCart);

            var iTotalQty = 0;
            for (var iNo = 0; iNo < currentCart.length; iNo++){
                iTotalQty += currentCart[iNo].BOD_QUANTITY;
            }
            
            $(".spn_itemcart_qty").each(function () {
                $(this).html(iTotalQty);
            })

            $.ajax({
                async:false,
                type: "POST",
                url: sPageURL + "/SetCart",
                data: JSON.stringify({ sCurrentCart: sUpdatedCart }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var data = JSON.parse(result.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        },
        failure: function (response) {
            alert(response.d);
        }
    });    
}

function loadCartItems_ASPX_CS(sPageURL) {
    var sItemList = "";
    $.ajax({
        async:false,
        type: "POST",
        url: sPageURL + "/GetCart",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            sItemList = JSON.parse(result.d);

            if (result.d == null) {
                $(".spn_itemcart_qty").each(function () {
                    $(this).html("0");
                })
            } else {
                var iTotalQty = 0;
                for (var iNo = 0; iNo < sItemList.length; iNo++) {
                    iTotalQty += sItemList[iNo].BOD_QUANTITY;
                }

                $(".spn_itemcart_qty").each(function () {
                    $(this).html(iTotalQty);
                })
            }
        },
        failure: function (response) {
            alert(response.d);
        }
    });

    return sItemList;
}

function checkCart_and_RemoveName_ASPX_CS(sName, sPageURL) {
    //To remove product.
    $.ajax({
        async: false,
        type: "POST",
        url: sPageURL + "/GetCart",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var JSONcurrentCart = result.d;

            var currentCart;

            if (JSONcurrentCart == "" || JSONcurrentCart == undefined)
                currentCart = [];
            else
                currentCart = JSON.parse(JSONcurrentCart);

            var ID = currentCart.findIndex(x => x.MPO_GUID == sName);

            if (ID != -1) { currentCart.splice(ID, 1); }

            var sUpdatedCart = JSON.stringify(currentCart);

            $.ajax({
                async: false,
                type: "POST",
                url: sPageURL + "/SetCart",
                data: JSON.stringify({ sCurrentCart: sUpdatedCart }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var data = JSON.parse(result.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        },
        failure: function (response) {
            alert(response.d);
        }
    });    
}

function Checkcart_and_updateqty_ASPX_CS(sname, quantity, sPageURL) {
    //to update the product quantity.
    $.ajax({
        async: false,
        type: "POST",
        url: sPageURL + "/GetCart",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var JSONcurrentCart = result.d;

            var currentCart;

            if (JSONcurrentCart == "" || JSONcurrentCart == undefined)
                currentCart = [];
            else
                currentCart = JSON.parse(JSONcurrentCart);

            var id = currentCart.findIndex(x => x.MPO_GUID == sname);

            var obj = currentCart[id];
            obj.BOD_QUANTITY = quantity;
            currentCart[id] = obj;

            var sUpdatedCart = JSON.stringify(currentCart);

            $.ajax({
                async: false,
                type: "POST",
                url: sPageURL + "/SetCart",
                data: JSON.stringify({ sCurrentCart: sUpdatedCart }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var data = JSON.parse(result.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        },
        failure: function (response) {
            alert(response.d);
        }
    });    
}
function getUrlVars() {
    var vars = [], hash;
    var qs = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < qs.length; i++) {
        hash = qs[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
//C# Session - END
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
//Get Recently Viewed Product - Start

function fn_AddToRecentlyViewedProd(sPageURL, sMPM_GUID) {

    $.ajax({
        async: false,
        type: "POST",
        url: sPageURL + "/GetRecentlyViewProds",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            var JSONcurrentProds = result.d;

            var currentProds;

            if (JSONcurrentProds == "" || JSONcurrentProds == undefined)
                currentProds = [];
            else
                currentProds = JSONcurrentProds.split(",");

            //To check whether the product is added already or not. If no, then add. If yes, then do nothing.
            var found = currentProds.some(function (el) {
                return el == sMPM_GUID;
            });

            if (!found) {
                currentProds.push(sMPM_GUID);
            }

            var sUpdatedProds = currentProds.join(",");

            $.ajax({
                async: false,
                type: "POST",
                url: sPageURL + "/SetRecentlyViewProds",
                data: JSON.stringify({ sRecentlyViewedProds: sUpdatedProds }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    var data = JSON.parse(result.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        },
        failure: function (response) {
            alert(response.d);
        }
    });    
}

//function fn_GetRecentlyViewProductList(sPageURL) {
//    $.ajax({
//        async: false,
//        type: "POST",
//        url: sPageURL + "/GetRecentlyViewProductList",
//        data: {},
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (result) {
//            var JSONcurrentProds = result.d;

//            $("#divRecentlyViewedProducts").html(JSONcurrentProds);
//        },
//        failure: function (response) {
//            alert(response.d);
//        }
//    });    
//}

//Get Recently Viewed Product - END
//////////////////////////////////////////////////////////

function detectmob() {
    if (navigator.userAgent.match(/Android/i)
        || navigator.userAgent.match(/webOS/i)
        || navigator.userAgent.match(/iPhone/i)
        || navigator.userAgent.match(/iPad/i)
        || navigator.userAgent.match(/iPod/i)
        || navigator.userAgent.match(/BlackBerry/i)
        || navigator.userAgent.match(/Windows Phone/i)
    ) {
        return true;
    }
    else {
        return false;
    }
}