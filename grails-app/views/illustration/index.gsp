<%@ page import="com.mbds.grails.Illustration" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
            <th scope="col">Nom de l'annonce</th>
            <th scope="col">Image</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="i" in="${ illustrationList }">
            <tr>
                <td><g:link controller="annonce" action="show" id="${i.getAnnonce().id}" style="text-decoration: none;color: blue">${i.annonce.getAuthor().username} ${i.annonce.getId()}</g:link></td>
                <td><g:link controller="illustration" action="show" id="${i.getId()}" style="text-decoration: none;color: blue"><asset:image src="${i.getFilename()}"></asset:image></g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    </body>
</html>