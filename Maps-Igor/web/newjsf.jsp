<%-- 
    Document   : newjsf
    Created on : 07/04/2016, 19:50:40
    Author     : 10070104
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
            < <style>
                html, body {
                    height: 100%;
                    margin: 0;
                    padding: 0;
                }
                #map {
                    height: 100%;
                }
                #floating-panel {
                    position: absolute;
                    top: 10px;
                    left: 25%;
                    z-index: 5;
                    background-color: #fff;
                    padding: 5px;
                    border: 1px solid #999;
                    text-align: center;
                    font-family: 'Roboto','sans-serif';
                    line-height: 30px;
                    padding-left: 10px;
                }

            </style>
        </head>
        <body>
            <div id="floating-panel">
                <input id="address" type="text" value="">
                <input id="submit" type="button" value="Geocode">
            </div>
            
            <div id="map"></div>
            <script>
                function initMap() {
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 20,
                        center: {lat: -30.1409311, lng: -51.1309041}
                    });
                    var geocoder = new google.maps.Geocoder();

                    document.getElementById('submit').addEventListener('click', function () {
                        geocodeAddress(geocoder, map);
                    });
                }

                function geocodeAddress(geocoder, resultsMap) {
                    var address = document.getElementById('address').value;
                    geocoder.geocode({'address': address}, function (results, status) {
                        if (status === google.maps.GeocoderStatus.OK) {
                            resultsMap.setCenter(results[0].geometry.location);
                            var marker = new google.maps.Marker({
                                map: resultsMap,
                                position: results[0].geometry.location
                            });
                        } else {
                            alert('Geocode was not successful for the following reason: ' + status);
                        }
                    });
                }

            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAWMM38dR6Rg50ts6aDNXUaDFZpEI1G1As&signed_in=true&callback=initMap"
            async defer></script>
        </body>
    </html>
</f:view>
