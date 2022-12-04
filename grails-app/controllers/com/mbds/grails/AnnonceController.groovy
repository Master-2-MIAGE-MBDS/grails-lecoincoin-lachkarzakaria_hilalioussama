package com.mbds.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class AnnonceController {

    AnnonceService annonceService
    SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        User user=springSecurityService.getCurrentUser()
        if(user.getAuthorities().authority.join(',')=="ROLE_ADMIN" || user.getAuthorities().authority.join(',')=="ROLE_MODO")
        {
            respond annonceService.list(params), model:[annonceCount: annonceService.count()]
        }else{
            respond user.getAnnonces().asList()
        }
    }

    def show(Long id) {
        respond annonceService.get(id), model: [userList: User.list()]
    }

    def create() {
        respond new Annonce(params), model: [userList: User.list()]
    }

    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond annonceService.get(id), model: [userList: User.list()]
    }

    def update() {
        def annonce = Annonce.get(params.id)
        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Float.parseFloat(params.price)
        annonce.author = User.get(params.author.id)

        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
            if (request.getFiles("files")[0].filename != "")
                myService.uploadFiles(annonce, request.getFiles("files"))
        } catch (ValidationException e) {
            println annonce.errors
//            respond annonce.errors, view: 'edit'
            redirect action: "edit", id: annonce.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
        redirect action: "index", method: "GET"
    }

    def deleteIllu(Long id) {
        def illustrationInstance = Illustration.get(id)
        def annonceId = illustrationInstance.annonce.id
        def annonceInstance = Annonce.get(annonceId)
        annonceInstance.removeFromIllustrations(illustrationInstance)
        annonceInstance.save(flush: true)
        redirect action: "edit", id: annonceId
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    public static File makeDirectory(String path){
        File file = new File(path)
        if (!file.exists()){
            file.mkdirs()
        }
        return file
    }

}
