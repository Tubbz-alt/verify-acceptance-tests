Feature: eIDAS Connector Node Smoke Test - Italy - Production

    This tests the connection of the UK Connector Node to the Italian Proxy Node

    @Eidas
    Scenario: Send a request to sign in with an Italian identity
        Given   the user visits a UK Government service
        And     they choose to sign in with a digital identity from another European country
        And     they select 'SPID' scheme
        And     they navigate through the eIDAS CEF reference implementation node
        Then    they should arrive at a page with text 'Italian eIDAS Login'
        And     the page should not have an error message
