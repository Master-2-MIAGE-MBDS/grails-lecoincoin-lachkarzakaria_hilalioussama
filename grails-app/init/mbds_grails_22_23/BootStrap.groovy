package mbds_grails_22_23

import com.mbds.grails.Annonce
import com.mbds.grails.Illustration
import com.mbds.grails.Role
import com.mbds.grails.User
import com.mbds.grails.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminUserInstance = new User(username: "admin",password: "admin").save()
        def modo1 = new User(username: "Zakaria",password: "modo").save()
        def modo2 = new User(username: "Oussama",password: "modo").save()
        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        def modoRole = new Role(authority: "ROLE_MODO").save()
        def clientRole = new Role(authority: "ROLE_CLIENT").save()
        UserRole.create(adminUserInstance, adminRole, true)
        UserRole.create(modo1,modoRole,true)
        UserRole.create(modo2,modoRole,true)

        // On boucle sur une liste de 5 prénoms
        ["Alice", "Bob", "Charly", "Denis", "Etienne"].each {
            String username ->
                // On crée les utilisateurs associés
                def userInstance = new User(username: username, password: "password").save()
                UserRole.create(userInstance,clientRole,true)
                // Pour chaque utilisateur on boucle 5 fois
                (1..5).each {
                    Integer index ->
                        // Pour ajouter 5 annonces par utilisateur
                        def annonceInstance = new Annonce(title: username + " " + index, description: "Description de l'annonce", price: 10 * index, active: Boolean.TRUE)
                        (1..5).each {
                            // Et enfin 5 illustrations par annonce
                            annonceInstance.addToIllustrations(new Illustration(filename: "grails.svg"))
                        }
                        // On associe l'annonce créée à l'utilisateur
                        userInstance.addToAnnonces(annonceInstance)
                        // Et on sauvegarde l'utilisateur qui va sauvegarder ses annonces qui sauvegarderont leurs illustrations
                        userInstance.save(flush: true, failOnError: true)
                }
        }

    }
    def destroy = {

    }
}
