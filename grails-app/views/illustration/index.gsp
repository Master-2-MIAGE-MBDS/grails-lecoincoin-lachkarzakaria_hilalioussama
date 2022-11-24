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
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">filename</th>
            <th scope="col">Annonce</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="i" in="${ Illustration.getAll() }">
            <tr>
                <td><a href="/illustration/show//${i.getId()}" style="text-decoration: none;color: blue">${i.getFilename()}</a></td>
                <td><a href="/annonce/show/${i.getAnnonce().getId()}" style="text-decoration: none;color: blue">${i.getAnnonce()}</a></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    </body>
</html>