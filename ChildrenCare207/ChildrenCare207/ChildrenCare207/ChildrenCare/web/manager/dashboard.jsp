<%-- 
    Document   : dashboard
    Created on : Jul 18, 2022, 4:21:19 AM
    Author     : Dan Chen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="./headermanager.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="card m-1">
                        <div class="card-body">
                            <h5 class="card-title">Total Revenue</h5>
                            <h6 class="card-subtitle mb-2">$${totalRevenue}</h6>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card m-1">
                        <div class="card-body">
                            <h5 class="card-title">Most popular service</h5>
                            <ul class="list-group">
                                <c:forEach items="${services}" var="s">
                                    <h6 class="list-group-item">${s}</h6>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card m-1">
                        <div class="card-body">
                            <h5 class="card-title">Reservations Completed/Received</h5>
                            <h6 class="card-subtitle mb-2">${completed}/${received}</h6>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card m-1">
                        <div class="card-body">
                            <h5 class="card-title">Customers</h5>
                            <h6 class="card-subtitle mb-2">${customers}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
