package com.mbds.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
@Secured(['ROLE_ADMIN','ROLE_MODO','ROLE_CLIENT'])
class ProfileController {

    SpringSecurityService springSecurityService
    IllustrationService illustrationService

    def index() {
        User user=springSecurityService.getCurrentUser()
        respond user

    }
}
