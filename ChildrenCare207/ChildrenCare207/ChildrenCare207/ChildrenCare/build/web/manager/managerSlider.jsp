<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manager Slider</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
        rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css" />
    <link rel="stylesheet" href="assets/css/app.css" />

    <style>
        .modal .modal-dialog {
            max-width: 400px;
        }

        .modal .modal-header,
        .modal .modal-body,
        .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }

        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }
    </style>
</head>

<header id="header" class="header has-sticky sticky-jump">
    
                <%@include file="../Component/navbar.jsp" %>         
                
            </header>

<body>
    <div id="app">
<!--        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                
                <div class="sidebar-menu" style="position: relative">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item">
                            <a href="index.html" class="sidebar-link">
                                <i class="bi bi-grid-fill"></i>
                                <span>Manager Slide</span>
                            </a>
                        </li>

                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-stack"></i>
                                <span>Setting</span>
                            </a>
                            <ul class="submenu">
                                <li class="submenu-item">
                                    <a href="#">Manager</a>
                                </li>
                                <li class="submenu-item">
                                    <a href="#">Slider</a>
                                </li>
                                <li class="submenu-item">
                                    <a href="#">Abc</a>
                                </li>
                                <li class="submenu-item">
                                    <a href="#">Xyz</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <button class="btn-primary btn px-4" style="margin-top: 30vh; transform: translateX(50%)">
                        Log out
                    </button>
                </div>
            </div>
        </div>-->
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Manager Slide</h3>
                            <p class="text-subtitle text-muted">
                                An application for Admin setting Customer
                            </p>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="col-sm-6">
                                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                            <span>Add Slide</span></a>
                                    </div>

                                    <div class="table-responsive table-hover table">
                                        <table class="table mb-0 table-lg">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Title</th>
                                                    <th>Image</th>
                                                    <th>Content Shortcut</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="s" items="${list}">
                                                    <tr>
                                                        <td>${s.slideID}</td>
                                                        <td>${s.slideTitle}</td>
                                                        <td><img src="images/${s.imageURL}" style="width: 150px ; object-fit: cover;"
                                                                alt="banner"></td>
                                                        <td>${s.backLink}</td>

                                                        <c:choose>
                                                            <c:when test="${s.status == 'true'}">
                                                                <td><a href="SlideStatusHandle?slideID=${s.slideID}&status=hide"
                                                                        class="view btn btn-sm btn-danger"
                                                                        data-toggle="modal">Hide</a></td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td><a href="SlideStatusHandle?slideID=${s.slideID}&status=show"
                                                                        class="view btn btn-sm btn-info"
                                                                        data-toggle="modal">Show</a></td>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <td>
                                                            <a href="editSlider?slideID=${s.slideID}" class="view"
                                                                data-toggle="modal"><i class="btn btn-sm btn-primary"
                                                                    data-toggle="tooltip" title="View">Edit</i></a>
                                                            <a href="deleteSlider?slideID=${s.slideID}" class="delete"
                                                                data-toggle="modal"><i class="btn btn-sm btn-danger"
                                                                    data-toggle="tooltip"
                                                                    title="Delete">Delete</i></a>
                                                        </td>

                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>


                                        <div class="clearfix">
                                            <ul class="pagination justify-content-center mt-2">
                                                <ul class="pagination">
                                                    <c:forEach var="i" begin="1" end="${numberOfPage}">
                                                        <c:choose>
                                                            <c:when test="${i == page}">
                                                                <li class="page-item active"><a href="manager?page=${i}"
                                                                        class="page-link">${i}</a></li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item "><a href="manager?page=${i}"
                                                                        class="page-link">${i}</a></li>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </c:forEach>
                                                </ul>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <div id="addEmployeeModal" class="modal  bg-dark">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addSlider" method="get">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Slider</h4>
                            <button type="button close" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label>Slider title</label>
                                <input name="title" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Content shortcut</label>
                                <input name="backlink" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Slider Image</label>
                                <input name="imageUrl" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="form-control">
                                    <option value="1">Show</option>
                                    <option value="0">Hide</option>
                                </select>
                            </div>
                            <!-- <div class="form-group">
                                <label>Parent ID</label>
                                <input name="parentId" type="text" class="form-control">                   
                            </div> -->
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/dashboard.js"></script>


</body>

</html>