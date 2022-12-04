package com.mbds.grails

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class MyServiceSpec extends Specification implements ServiceUnitTest<MyService>{

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
