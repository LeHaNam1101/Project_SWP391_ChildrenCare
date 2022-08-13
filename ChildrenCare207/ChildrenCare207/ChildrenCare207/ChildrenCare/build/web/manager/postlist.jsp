<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Feedbacklist</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.css" integrity="sha512-NtU/Act0MEcVPyqC153eyoq9L+UHkd0s22FjIaKByyA6KtZPrkm/O5c5xzaia4pyCfReCS634HyQ7tJwKNxC/g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            #tablesample_length{
                display: none;
            }
        </style>
    </head>

    <body>
        <jsp:include page="./headermanager.jsp"/>
        <div class="container">
            <h1 style="text-align: center; background-color: lightgray; width: 100%; position: relative;">Post List</h1>
            <div >
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Status
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="PostList?status=&category=${param['category']}&user=${param['user']}">All</a>
                        <a class="dropdown-item" href="PostList?status=1&category=${param['category']}&user=${param['user']}">Active</a>
                        <a class="dropdown-item" href="PostList?status=0&category=${param['category']}&user=${param['user']}">Inactive</a>
                    </div>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Category
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="PostList?category=&status=${param['status']}&user=${param['user']}">All</a>

                        <c:forEach var="c" items="${clist}">
                            <a class="dropdown-item" href="PostList?category=${c}&status=${param['status']}&user=${param['user']}">${c}</a>
                        </c:forEach>


                    </div>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        User
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="PostList?user=&category=${param['category']}&status=${param['status']}">All</a>
                        <c:forEach var="u" items="${ul}">
                            <a class="dropdown-item" href="PostList?user=${u.name}&category=${param['category']}&status=${param['status']}">${u.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="left-filter" style="display: inline;margin-left: 25%;">
                    <a class="btn btn-primary" style="color: white" data-toggle="modal" data-target="#addblog">Add New Blog</a>
                </div>
            </div>

            <div  style="width: 100%;">
                <table  class="table-striped table-hover" cellspacing="0" style="width: 100%;font-size: 18px; padding: 5px;" id="tablesample">

                    <thead>
                        <tr style="cursor: pointer; font-size: 15px; border-bottom: 1px solid #ccc; text-align: center;">
                            <th>ID<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                            <th>Image</th>
                            <th style="width: 30%">Title<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                            <th>Author<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                            <th>Category<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                            <th>Status<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                            <th  width="3%">Edit</th>
                            <th  width="3%">Delete</th>
                            <th width="3%">Switch</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="f" items="${blist}">
                            <tr style="text-align: center;">
                                <td>${f.blogID}</td>
                                <td><image data-toggle="modal" data-target="#Show${f.blogID}" style="cursor: pointer;"  src="${f.imageURL}" width="200px"></td>
                                <td style="width: 30%">${f.blogTitle}</td>
                                <td >${f.author.name}</td>

                                <td>${f.blogCategory}</td>
                                <c:if test="${f.status}">
                                    <td><span class="btn btn-success" style="font-size: 15px">Acive</span></td>
                                </c:if>
                                <c:if test="${!f.status}">
                                    <td><span class="btn btn-danger" style="font-size: 15px">Inacive</span></td>
                                </c:if>
                                <td><a class="btn btn-primary"  data-toggle="modal" data-target="#EditModalUP${f.blogID}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
                                <td><a class="btn btn-danger" href="PostList?action=delete&fid=${f.blogID}"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
                                        <c:if test="${f.status}">
                                    <td><a class="btn btn-warning" href="PostList?action=switch&fid=${f.blogID}&fstatus=0">InActive</a></td>
                                </c:if>
                                <c:if test="${!f.status}">
                                    <td><a class="btn btn-success" href="PostList?action=switch&fid=${f.blogID}&fstatus=1">Active</a></td>
                                </c:if>
                            </tr>

                        <div class="modal fade" id="Show${f.blogID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Detail</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <h4>ID : ${f.blogID} </h4>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <h4>Author :${f.author.name} </h4>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Title:</label>
                                                <p>${f.blogTitle}</p>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Category:</label>
                                                <p>${f.blogCategory}</p>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Status: </label>${f.status?'<span class="btn btn-success" style="font-size: 15px;" >Acive</span>':'<span class="btn btn-danger" style="font-size: 15px;">Inacive</span>'}
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label class="control-label">Content: </label>
                                                <p>${f.blogContent}</p>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Image:</label><br>
                                                <image  src="${f.imageURL}" width="50%">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                    </tbody>
                </table>
                <c:forEach var="f" items="${blist}">
                    <div class="modal fade" id="EditModalUP${f.blogID}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                         data-keyboard="false">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <form action="PostList?action=edit" method="post">
                                        <div class="row">
                                            <div class="form-group  col-md-12">
                                                <span class="thong-tin-thanh-toan">
                                                    <h5>Edit Information</h5>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="control-label">ID</label>
                                                <input class="form-control" type="text" readonly name="bid" value="${f.blogID}">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">author Name:</label>

                                                <input class="form-control" type="text" readonly name="bun" value="${f.author.name}">

                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Title:</label>
                                                <input class="form-control" type="text"  name="title" value="${f.blogTitle}">

                                            </div>

                                            <div class="form-group col-md-6">
                                                <label class="control-label">Category: </label>
                                                <input class="form-control" type="text"  name="category" value="${f.blogCategory}">

                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Status</label><br>
                                                <input  type="radio" name="status" required value="1" ${f.status?'Checked':''}>Active
                                                <input  type="radio" name="status" required value="0" ${!f.status?'Checked':''}> Inactive
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Content: </label>
                                                <textarea name="content" style="height: 150px;" class="form-control">  ${f.blogContent}</textarea>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Image:</label><br>
                                                <input class="form-control" type="text"  name="imgUrl" value="${f.imageURL}">

                                                <image  src="" width="50%">
                                            </div>
                                        </div>
                                        <BR>
                                        <button class="btn btn-primary" type="submit">Save</button>
                                        <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                                        <BR>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="modal fade" id="addblog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
             data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <form action="PostList?action=add" method="post">
                            <div class="row">
                                <div class="form-group  col-md-12">
                                    <span class="thong-tin-thanh-toan">
                                        <h5>Add new</h5>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">ID</label>
                                    <input class="form-control" type="text" readonly name="bid" value="Auto genarate">
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label">Title:</label>
                                    <input class="form-control" type="text"  name="title" value="${f.blogTitle}">

                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label">Category: </label>
                                    <input class="form-control" type="text"  name="category" value="${f.blogCategory}">

                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Status</label><br>
                                    <input  type="radio" name="status" required value="1" ${f.status?'Checked':''}>Active
                                    <input  type="radio" name="status" required value="0" ${!f.status?'Checked':''}> Inactive
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Content: </label>
                                    <textarea name="content" style="height: 150px;" class="form-control">  ${f.blogContent}</textarea>
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Image:</label><br>
                                    <input class="form-control" type="text"  name="imgUrl" value="${f.imageURL}">

                                    <image  src="" width="50%">
                                </div>
                            </div>
                            <BR>
                            <button class="btn btn-primary" type="submit">Save</button>
                            <a class="btn btn-danger" data-dismiss="modal" href="#">Cancel</a>
                            <BR>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#tablesample").DataTable();
            });
        </script>


        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>

</html>


