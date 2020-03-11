Feature: eidas-connector-node-smoke-test-it-prod

    This tests the connection of the UK Connector Node to the Italian Proxy Node

    @EidasIntegration
    Scenario: Send a request to sign in with an Italian identity
        Given   the user visits a UK Government service
        And     they choose to sign in with a digital identity from another European country
        And     they select Italy
        And     they navigate through the eIDAS CEF reference implementation node
        Then    they should arrive at the Italy Hub