Feature: eIDAS Connector Node Smoke Test - Spain - Production

    This tests the connection of the UK Connector Node to the Spanish Proxy Node

    @Eidas
    Scenario: Send a request to sign in with an Spanish identity
        Given   the user visits a UK Government service
        And     they choose to sign in with a digital identity from another European country
        And     they select 'DNIe' scheme
        Then    they should arrive at a page with text 'Identificación con DNIe'
        And     the page should not have an error message
