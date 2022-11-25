<%@ page import="com.mbds.grails.User; com.mbds.grails.UserRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>User List</title>
</head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Roles</th>
        <th scope="col">Username</th>
        <th scope="col">enabled</th>
        <th scope="col">accountExpired</th>
        <th scope="col">passwordExpired</th>
        <th scope="col">Annances</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="u" in="${ User.findAll() }">
        <tr>
            <th scope="row">${u.getId()}</th>
            <th scope="col">${u.getAuthorities().authority.join(',')}</th>
            <td><a href="/user/show/${u.getId()}" style="text-decoration: none;color: blue">${u.getUsername()}</a></td>
            <td>${u.getEnabled()}</td>
            <td>${u.getAccountExpired()}</td>
            <td>${u.getPasswordExpired()}</td>
            <td>
                <g:each var="a" in="${ u.getAnnonces() }">
                    <a href="/annonce/show/${a.getId()}" style="text-decoration: none;color: blue">${a.getTitle()}</a>
                    <br>
                </g:each>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>