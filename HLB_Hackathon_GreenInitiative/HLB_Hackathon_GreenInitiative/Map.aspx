<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_WEB.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="HLB_Hackathon_GreenInitiative.Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #description {
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
        }

        #infowindow-content .title {
            font-weight: bold;
        }

        #infowindow-content {
            display: none;
        }

        #map #infowindow-content {
            display: inline;
        }

        .pac-card {
            margin: 10px 10px 0 0;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            font-family: Roboto;
        }

        #pac-container {
            padding-bottom: 12px;
            margin-right: 12px;
        }

        .pac-controls {
            display: inline-block;
            padding: 5px 11px;
        }

            .pac-controls label {
                font-family: Roboto;
                font-size: 13px;
                font-weight: 300;
            }

        #pac-input {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 400px;
        }

            #pac-input:focus {
                border-color: #4d90fe;
            }

        #title {
            color: #fff;
            background-color: #4d90fe;
            font-size: 25px;
            font-weight: 500;
            padding: 6px 12px;
        }

        #target {
            width: 345px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="assets/images/sub-header/09.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">Please Select Your Location</h3>
    </section>
    
    <section class="video-section">
        <div class="row">
            <input id="pac-input" class="controls" type="text" style="padding: 5px;" placeholder="Search Box">
            <div id="map" style="height: 50vh;"></div>
            <%--<div class="contact-map">
                <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3689.7863885381144!2d91.81020831453182!3d22.361693185291596!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30acd9f3d2063673%3A0x6411900fd40637c8!2sSynchronise+IT!5e0!3m2!1sen!2sbd!4v1531126085037" style="border: 0" allowfullscreen=""></iframe>
            </div>--%>
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
                <div class="col-md-12 text-center">
                    <a href="/UploadYourInfo.aspx" class="btn submit-btn btn-send contact_btn" style="font-size: 15px;
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
</asp:Content>
