<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="container">
        <div class="main-body">

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">${this.user.username}</a></li>
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
                                    ${this.user.username}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${this.user.email}
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
                                    <th scope="col">Authon</th>
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
                                        <td><g:link controller="user" action="show" id="${a.getAuthor().getId()}" style="text-decoration: none;color: blue">${a.getAuthor().username}</g:link></td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </div>
    </body>
</html>
