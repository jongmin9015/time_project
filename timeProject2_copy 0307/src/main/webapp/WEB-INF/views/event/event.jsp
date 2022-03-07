<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>    
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<body>
    <div id="header">
    	<%@ include file="../includes/header.jsp" %>
    </div>
    <div id="warp">

        <div class="event_inner">
            <ul class="event_list">
                <li><a href="#"><div class="imgBox"><img src="/resources/images/event/event01.jpg" alt="event01"></div></a></li>
                <li><a href="#"><div class="imgBox"><img src="/resources/images/event/event02.jpg" alt="event02"></div></a></li>
                <li><a href="#"><div class="imgBox"><img src="/resources/images/event/event03.jpg" alt="event03"></div></a></li>
                <li><a href="#"><div class="imgBox"><img src="/resources/images/event/event04.jpg" alt="event04"></div></a></li>
                <li><a href="#"><div class="imgBox"><img src="/resources/images/event/event05.jpg" alt="event05"></div></a></li>
                <li><a href="#"><div class="imgBox"><img src="/resources/images/event/event06.jpg" alt="event06"></div></a></li>
            </ul>
        </div>
    </div>
    <div id="footer">
    	<%@ include file="../includes/footer.jsp" %>
    </div>
</body>
</html>