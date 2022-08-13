<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản lý dịch vụ</title>
        <link rel="icon" href="img/icon.png" sizes="32x32" />
        <link rel="icon" href="img/icon.png" sizes="192x192" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                crossorigin="anonymous">

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous">
        </script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 150px;
                height: 200px;
            }
            .thumb{
                width: 300px;
            }
            body {
                color: #566787;
                background: #f5f5f5;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #0a4da8;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
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
            .modal textarea .form-control {
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
    <body>
        <jsp:include page="./headermanager.jsp"/>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-3">
                            <a style="color: white" href="servicesmanager"> <h2>Quản lý <b>Dịch vụ</b></h2></a>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <div class="input-group-btn dropdown">
                                    <button style="background-color:#03A9F4 ; border-radius: 3px;" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Danh mục 
                                        <span style="float: none;" class="caret"></span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="category">
                                        <a class="dropdown-item" href="servicesmanager">Tất cả</a>
                                        <c:forEach  items="${listc}" var="c">
                                            <a class="dropdown-item" href="filter-category-manager?cid=${c.categoryID}">${c.categoryName}</a>
                                        </c:forEach>
                                    </div>
                                </div><!-- /btn-group -->
                            </div><!-- /input-group -->
                        </div><!-- /.col-lg-6 -->
                        <div class="col-sm-4">
                            <form action="searchmanager" >
                                <div class="input-group">
                                    <div class="form-group">
                                        <input name="keyword" type="search" class="form-control" placeholder="Vui lòng nhập...">
                                    </div>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="submit" style="font-size: 15px;background-color: #03A9F4">Tìm</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-2">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm dịch vụ</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th><div class="dropdown">
                                    <button style="border-color: white" class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                        Giá
                                        <span class="caret"></span>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item" href="servicesmanager">Mặc định</a>
                                        <a class="dropdown-item" href="servicesmanager?sort=des">Cao đến thấp</a>
                                        <a class="dropdown-item" href="servicesmanager?sort=asc">Thấp tới cao</a>
                                    </div>
                                </div>
                            </th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listS}" var="s">
                            <tr>
                                <td>${s.serviceID}</td>
                                <td> <a href="detailmanager?sid=${s.serviceID}">${s.serviceName}</a></td>
                                <td>
                                    <a href="detailmanager?sid=${s.serviceID}">
                                        <img class="thumb" width="300" height="400" src="${s.imageURL}"></a>
                                </td>
                                <td>
                                    <fmt:formatNumber value="${s.servicePrice}" minFractionDigits="0" maxFractionDigits="0"/>.000</td>
                                <td>
                                    <a href="loadservices?sid=${s.serviceID}"  class="edit" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="deleteservices?did=${s.serviceID}" class="delete"  onclick="return confirm('Bạn có chắc chắn muốn xóa dịch vụ khỏi danh sách?');"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!--                <div class="clearfix">
                                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>-->
            </div>
            <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                <ul class="pagination " >
                    <li class="page-item ${page==1||page==null?"disabled":""}" ><a class="page-link " href="servicesmanager?sort=${param['sort']}&page=${page-1}">Trang Trước</a></li>
                        <c:forEach begin="1" end="${totalPage}" var="i">
                        <li class="page-item ${i==page?"active":""}"><a class="page-link" href="servicesmanager?sort=${param['sort']}&page=${i}">${i}</a></li>
                        </c:forEach>
                    <li class="page-item ${page==totalPage?"disabled":""}"><a class="page-link" href="servicesmanager?sort=${param['sort']}&page=${page+1}">Trang Sau</a></li>
                </ul>
            </nav>
        </div>
        <div class="text-center" style="margin-bottom: 50px">
            <a href="home" ><button type="button" class="btn btn-primary text-center">Về trang chủ</button></a>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addservices" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm dịch vụ</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Tên - trên 6 ký tự</label>
                                <input name="name" type="text" class="form-control" required id="validate" name="validate" pattern="[A-Za-z].{6,}">
                            </div>

                            <div class="form-group">
                                <label>Giá - lớn hơn 0</label>
                                <input id="price" name="price" type="number" class="form-control" required min="0" max="9999999999" >
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                    <input type="file" required id="svimg" class="form-control" name="svimg" onchange="changesvimg()" accept=".jpg, .jpeg, .png"><br>
                                    <span id="invalid2"  style="color: red; display: none;"> <i class="fa fa-exclamation" aria-hidden="true"></i> 
                                        Please choose picture</span>    
                                    <input name="img" id="sendimg" type="hidden" >
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Mô tả:</label>
                                <textarea required class="form-control" id="message-text" name="desc" type="text"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select name="category" class="form-select" aria-label="Default select example"  required>
                                    <c:forEach items="${listc}" var="c">
                                        <option value="${c.categoryID}">${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Đóng">
                            <input type="submit" class="btn btn-success"  value="Thêm">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function changesvimg() {
                var file = document.getElementById("svimg").files[0];
                if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                    if (file.size / (1024 * 1024) < 5) {
                        var fileReader = new FileReader();
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            document.getElementById("sendimg").value = (fileReader.result);
                        }
                    } else {
                        uploadError();
                    }
                } else {
                    uploadError();
                }
            }
            function uploadError() {
                alert('Vui lòng tải lên ảnh < 5MB')
                document.getElementById("svimg").files[0].value = ''
                document.getElementById("svimg").type = '';
                document.getElementById("svimg").type = 'file';
            }
            function  checksubmit() {
                if (document.getElementById("feedbackContent").value.length > 200) {
                    document.getElementById('invalid').style.display = "block";
                    return false;
                }
                if (document.getElementById("svimg").value == "") {
                    document.getElementById('invalid2').style.display = "block";
                    return false;
                }
                return true;
            }
        </script>

        <script src="js/manager.js" type="text/javascript">

     $(document).ready(function () {
         // Activate tooltip
         $('[data-toggle="tooltip"]').tooltip();

         // Select/Deselect checkboxes
         var checkbox = $('table tbody input[type="checkbox"]');
         $("#selectAll").click(function () {
             if (this.checked) {
                 checkbox.each(function () {
                     this.checked = true;
                 });
             } else {
                 checkbox.each(function () {
                     this.checked = false;
                 });
             }
         });
         checkbox.click(function () {
             if (!this.checked) {
                 $("#selectAll").prop("checked", false);
             }
         });
     });
        </script>
    </body>
</html>