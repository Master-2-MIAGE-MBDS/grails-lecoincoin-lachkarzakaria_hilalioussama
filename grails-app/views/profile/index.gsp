<%@ page import="com.mbds.grails.Illustration" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}" />
    <title><sec:loggedInUserInfo field="username"></sec:loggedInUserInfo> Profile</title>
</head>
<body>
<div class="container">
    <div class="main-body">

        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)"><sec:loggedInUserInfo field="username"></sec:loggedInUserInfo></a></li>
                <li class="breadcrumb-item active" aria-current="page">Profile</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <sec:loggedInUserInfo field="username"></sec:loggedInUserInfo>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.email}
                            </div>
                        </div>
                        <hr>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12">
                                <a class="btn btn-info " target="__blank" href="https://www.bootdey.com/snippets/view/profile-edit-data-and-skills">Edit</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row gutters-sm">
                    <div class="col">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Titre</th>
                                <th scope="col">Description</th>
                                <th scope="col">Active</th>
                                <th scope="col">Illustrations</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each var="a" in="${ this.user.getAnnonces().asList() }">
                                <tr>
                                    <th scope="row"><g:link controller="annonce" action="show" id="${a.getId()}" style="text-decoration: none;color: blue">${a.getTitle()}</g:link></th>
                                    <td>${a.getDescription()}</td>
                                    <td>${a.getPrice()}</td>
                                    <td>
                                        <g:each var="ul" in="${ a.getIllustrations() }">
                                            <g:link controller="illustration" action="show" id="${ul.getId()}" style="text-decoration: none;color: blue"><asset:image src="${ul.getFilename()}"></asset:image></g:link>
                                            <br>
                                        </g:each>
                                    </td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>