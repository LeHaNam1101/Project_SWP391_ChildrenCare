<%-- 
    Document   : reservationlist
    Created on : Jul 18, 2022, 12:42:57 PM
    Author     : Dan Chen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ReservationList</title>
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
            <div class="d-flex justify-content-center h-100 m-3">
                <div class="searchbar">
                    <form class="form-inline" action="reservationlist">
                        <div class="form-group">
                            <input type="text" class="form-control mr-2" placeholder="Find a name" name="search">
                        </div>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <h1 style="text-align: center; background-color: lightgray; width: 100%; position: relative;">Account List</h1>
                        <br>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Description</th>						
                                    <th>Created on</th>
                                    <th>Customer name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${reservations}" var="r">
                                    <tr>
                                        <td>${r.reservationID}</td>
                                        <td>${r.description}</td>
                                        <td style="width: 200px;">
                                            ${r.creationDate}
                                        </td>
                                        <td>${r.customer.name}</td>
                                        <td><a class="btn btn-default" href="reservationManager?ReservationID=${r.reservationID}">Detail</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="text-center mt-3 mt-sm-3">
                            <ul class="pagination justify-content-center mb-0">
                                <c:forEach begin="1" end="${pageCount}" var="i">
                                    <li class="page-item">
                                        <a class="page-link ${i==page?"active":""}" href="reservationList?search=${param['search']}&page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
