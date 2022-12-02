<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="container mt-5 mb-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="images p-3">
                                <div class="text-center p-4"> <img id="main-image" src="https://i.imgur.com/Dhebu4F.jpg" width="250" /> </div>
                                <div class="thumbnail text-center">
                                    <g:each var="ul" in="${ this.annonce.getIllustrations() }">
                                        <asset:image onclick="change_image(this)" src="${ul.getFilename()}"></asset:image>
                                    </g:each>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product p-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center"> <i class="fa fa-long-arrow-left"></i> <span class="ml-1">Back</span> </div> <i class="fa fa-shopping-cart text-muted"></i>
                                </div>
                                <div class="mt-4 mb-3"> <span class="text-uppercase text-muted brand">${this.annonce.getAuthor().username}</span>
                                    <h5 class="text-uppercase">${this.annonce.title}</h5>
                                    <div class="price d-flex flex-row align-items-center"> <span class="act-price">$${this.annonce.price}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
