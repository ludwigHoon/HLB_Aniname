<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1"  style="background-color:#002d62!important">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3" style="color:#fff">Are you ready?</h3>
    </section>

    <section class="boxed-sm" style="padding-top:10px;padding-bottom:44px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Net Monthly Income : </label>
                        <input id="txt_MONTHLYINCOME" class="form-control" type="text" placeholder="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Existing Monthly Commitment (RM) : </label>
                        <input id="txt_MONTHLYCOMMITMENT" class="form-control" type="text" placeholder="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>Purchase Price (RM) : </label>
                        <input id="txt_PURCHASE_PRICE" class="form-control" type="text" placeholder="">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group organic-form no-radius">
                        <label>We think you are : </label>
                        <input id="txt_Ready" class="form-control" disabled type="text" placeholder="">
                    </div>
                </div>
                <%--<div class="col-md-12 text-center">
                    <a id="btn_Proceed" href="Form.aspx" class="btn submit-btn btn-send contact_btn" style="font-size: 15px;
    bottom: 60px;
    padding: 10px 18px;
    border: 0;
    outline: 0;
    font-weight: bold;
    z-index: 45;
    right: 15px;
    position: fixed;
    color: #FFF;
    cursor: pointer;
    background-color: #012b61;
    text-align: center;">Proceed</a>
                </div>--%>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        //href = "/Map.aspx"
        $(function () {
            $("#txt_MONTHLYINCOME").change(update)
            $("#txt_MONTHLYCOMMITMENT").change(update)
            $("#txt_PURCHASE_PRICE").change(update)
        }); 

        function update () {
            let income = $("#txt_MONTHLYINCOME").val()
            let existing = $("#txt_MONTHLYCOMMITMENT").val()
            let purchase = $("#txt_PURCHASE_PRICE").val()
            if ((income != "") && (existing != "") && (purchase != "")) {
                if (income - existing > purchase) {
                    $("#txt_Ready").val("Yes! You are ready!").css('color', 'green');
                } else {
                    $("#txt_Ready").val("No! We think you need more time to be prepared :/").css('color', 'red');
                }
            }
        };
//results[0].geometry.location.lat();
//results[0].geometry.location.lng()
    </script>
    <section class="video-section">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10 col-offset-1 ">
            <input id="pac-input" class="controls" type="text" style="padding: 5px;" placeholder="Search Box">
            <div id="map" style="height: 50vh; width: 180vh;"></div>
            <%--<div class="contact-map">
                <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3689.7863885381144!2d91.81020831453182!3d22.361693185291596!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30acd9f3d2063673%3A0x6411900fd40637c8!2sSynchronise+IT!5e0!3m2!1sen!2sbd!4v1531126085037" style="border: 0" allowfullscreen=""></iframe>
            </div>--%>
            </div>
            
        </div>
    </section>
    <section class="video-section" style="padding-bottom:44px;">
        <div class="row" style="padding-bottom: 25px; padding-top: 25px;">
            <div class="col-md-6 col-md-offset-3">
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="col-md-6">Latitude :</div>
                        <input type="text" name="Latitude" class="form-control col-md-6" id="txt_Latitude" placeholder="" disabled="disabled">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="col-md-6">Longitude :</div>
                        <input type="text" name="Longitude" class="form-control col-md-6" id="txt_Longitude" placeholder="" disabled="disabled">
                    </div>
                </div>
            </div>
        </div>
        
    </section>
    <script>
        // This example adds a search box to a map, using the Google Place Autocomplete
        // feature. People can enter geographical searches. The search box will return a
        // pick list containing a mix of places and predicted search terms.

        // This example requires the Places library. Include the libraries=places
        // parameter when you first load the API. For example:
        // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

        function initAutocomplete() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: -33.8688, lng: 151.2195 },
                zoom: 13,
                mapTypeId: 'roadmap'
            });

            // Create the search box and link it to the UI element.
            var input = document.getElementById('pac-input');
            var searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

            // Bias the SearchBox results towards current map's viewport.
            map.addListener('bounds_changed', function () {
                searchBox.setBounds(map.getBounds());
            });

            var markers = [];
            // Listen for the event fired when the user selects a prediction and retrieve
            // more details for that place.
            searchBox.addListener('places_changed', function () {
                var places = searchBox.getPlaces();

                if (places.length == 0) {
                    return;
                }

                // Clear out the old markers.
                markers.forEach(function (marker) {
                    marker.setMap(null);
                });
                markers = [];

                // For each place, get the icon, name and location.
                var bounds = new google.maps.LatLngBounds();
                places.forEach(function (place) {
                    if (!place.geometry) {
                        console.log("Returned place contains no geometry");
                        return;
                    }

                    $("#txt_Latitude").val(place.geometry.location.lat());
                    $("#txt_Longitude").val(place.geometry.location.lng());
                    $("#sec_Recommendation").css("display", "block");

                    $('html, body').animate({
                        scrollTop: $("#sec_Recommendation").offset().top
                    }, 2000);

                    var icon = {
                        url: place.icon,
                        size: new google.maps.Size(71, 71),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(17, 34),
                        scaledSize: new google.maps.Size(25, 25)
                    };

                    // Create a marker for each place.
                    markers.push(new google.maps.Marker({
                        map: map,
                        icon: icon,
                        title: place.name,
                        position: place.geometry.location
                    }));

                    if (place.geometry.viewport) {
                        // Only geocodes have viewport.
                        bounds.union(place.geometry.viewport);
                    } else {
                        bounds.extend(place.geometry.location);
                    }
                });
                map.fitBounds(bounds);
            });
        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTIXHKDrEV-fqyaj9Wlx9dDFQLQVnU2y8&libraries=places&callback=initAutocomplete"
        async defer></script>
    <section id="sec_Recommendation" class="boxed-sm" style="display:none;padding-top:10px;padding-bottom:44px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group organic-form no-radius">
                        <label>We think you might want to consider the following Eco-friendly building:</label>
                        <ol id="dynamicOrdList">
                          <li>Coffee</li>
                          <li>Tea</li>
                          <li>Milk</li>
                        </ol>  
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="row" style="padding-bottom: 20px; padding-top: 25px;">
            <div class="col-md-12" style="text-align: center; left: 0; right: 0; margin: auto;">
                <a id="btn_RedirectForm" href="Form.aspx" class="btn btn-info btn-lg" style="background-color:#df2927!important;padding-top:10px;padding-bottom:10px;">
                    <h3 style="color:white;margin-bottom:10px;">Continue</h3>
                </a>
            </div>
        </div>
    <div><br /></div>
    <script type="text/javascript">
        $(function () {
            var sRecommendedList = [
                "Menara KL",
                "KLCC",
                "IOI Mall",
                "SetiaWalk",
                "Times Square",
                "TRX",
                "DC Mall"
            ]

            var sShuffledList = shuffle(sRecommendedList);
            var sContentList = "";
            sShuffledList.forEach(function (item, index) {
                sContentList += `<li><a href="Form.aspx">${item}</a></li>`;
            });

            $("#dynamicOrdList").html(sContentList);
        })

        function shuffle(array) {
            var currentIndex = array.length, temporaryValue, randomIndex;

            // While there remain elements to shuffle...
            while (0 !== currentIndex) {

                // Pick a remaining element...
                randomIndex = Math.floor(Math.random() * currentIndex);
                currentIndex -= 1;

                // And swap it with the current element.
                temporaryValue = array[currentIndex];
                array[currentIndex] = array[randomIndex];
                array[randomIndex] = temporaryValue;
            }

            return array;
        }
    </script>
</asp:Content>
