Feature: User authentication failure

  This tests authentication failure flows

  Scenario: IDP returns authn failure when user attempts to register
    Given the user is at Test RP
    When they start a journey
    And this is their first time using Verify
    And they are below the age threshold
    And they choose try to verify
    Then they should arrive at the Select documents page

    When they have all their documents
    And they have a smart phone
    And they continue to register with IDP "Stub Idp Demo Two"
    When the IDP returns an Authn Failure response
    Then they should arrive at the Failed registration page

#    When they select the link find another company to verify you
#    Then they should arrive at the Select documents page


  Scenario: IDP returns authn failure when user Signs in
    Given the user is at Test RP
    When they start a sign in journey
    And they select IDP "Stub Idp Demo Two"
    Then they should be at IDP "Stub Idp Demo Two"

    When they fail sign in with IDP
    Then they should arrive at the Failed sign in page

    When they choose to start again with another IDP
    Then they should arrive at the Start page


  @Eidas
  Scenario: Country returns AuthFailure on sign-in and user retries
    Given the user is at Test RP
    When they start an eIDAS journey
    And they select eIDAS scheme "Stub IDP Demo"
    Then they should be at IDP "Stub Country"
    When they fail sign in with IDP
    Then they should arrive at the Failed country sign in page
    When they click on link "Other ways to prove your identity online"
    Then they should arrive at the prove identity page
    And they choose to use a European identity scheme
    Then they should arrive at the country picker page
    And they select eIDAS scheme "Stub IDP Demo"
    Then they should be at IDP "Stub Country"
    And they login as "stub-country"
    Then they should be successfully verified


  @Eidas
  Scenario: Country returns AuthFailure on sign-in and user retries with Verify
    Given the user is at Test RP
    When they start an eIDAS journey
    And they select eIDAS scheme "Stub IDP Demo"
    Then they should be at IDP "Stub Country"
    When they fail sign in with IDP
    Then they should arrive at the Failed country sign in page
    When they click on link "Other ways to prove your identity online"
    Then they should arrive at the prove identity page
    And they choose to use Verify
    Then they should arrive at the Start page
    And they select sign in option
    And they select IDP "Stub Idp Demo One"
    And they login as "stub-idp-demo-one"
    Then they should be successfully verified


  Scenario: IDP returns authn failure requester error when user Signs in
    Given the user is at Test RP
    When they start a sign in journey
    And they select IDP "Stub Idp Demo Two"
    Then they should be at IDP "Stub Idp Demo Two"

    When the IDP returns a Requester Error response
    Then they should arrive at the Failed sign in page

    When they choose to start again with another IDP
    Then they should arrive at the Start page
