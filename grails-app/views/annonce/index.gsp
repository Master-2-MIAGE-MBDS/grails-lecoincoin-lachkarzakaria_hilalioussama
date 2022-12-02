<%@ page import="com.mbds.grails.Annonce" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Annonce List</title>
    </head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_CLIENT">
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
</sec:ifAnyGranted>
        </ul>
    </div>
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
        <g:each var="a" in="${ annonceList }">
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
</body>
</html>