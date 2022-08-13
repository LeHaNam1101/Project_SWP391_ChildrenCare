<%-- 
    Document   : userlist
    Created on : Jul 11, 2022, 1:34:53 PM
    Author     : Dan Chen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User list</title>
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
                    <form class="form-inline" action="userList">
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
                                    <th>UserName</th>						
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${userList}" var="u">
                                    <tr>
                                        <td>${u.userID}</td>
                                        <td><a href="#">${u.name}</a></td>
                                        <td style="width: 200px;">
                                            ${u.role.roleName}
                                        </td>
                                        <td>
                                            <div class="row">
                                                <div class="col-5">
                                                    <c:if test="${sessionScope.account.role.roleID == 1 && u.role.roleID != 1}">
                                                        <form action="assignRole" method="post" class="form-inline">
                                                            <input name="userID" type="hidden" value="${u.userID}">
                                                            <select class="form-control" name="role">
                                                                <c:forEach items="${roles}" var="r">
                                                                    <option ${r.roleID == user.role.roleID?"selected":""} value="${r.roleID}" ${r.roleID==u.role.roleID?"selected":""}>${r.roleName}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <button class="btn btn-primary" type="submit">Assign role</button>
                                                        </form>
                                                    </c:if>
                                                </div>
                                                <div class="col-7">
                                                    <c:if test="${sessionScope.account.userID != u.userID}">
                                                        <c:if test="${u.banned != true}">
                                                            <a class="btn btn-danger" href="banUser?UserID=${u.userID}">Ban</a>
                                                        </c:if>
                                                        <c:if test="${u.banned == true}">
                                                            <a class="btn btn-danger" href="unbanUser?UserID=${u.userID}">Unban</a>
                                                        </c:if>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="text-center mt-3 mt-sm-3">
                            <ul class="pagination justify-content-center mb-0">
                                <c:forEach begin="1" end="${pageNumber}" var="i">
                                    <li class="page-item">
                                        <a class="page-link ${i==page?"active":""}" href="userList?search=${param['search']}&page=${i}">${i}</a>
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
