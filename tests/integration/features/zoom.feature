Feature: Zooming in and out

    Background:
        Given I open data/hello.txt
        And I set ui -> zoom-levels to 50%,90%,110%
        And I run :tab-only

    Scenario: Zooming in
        When I run :zoom-in
        Then the message "Zoom level: 110%" should be shown.
        And the zoom should be 110%

    Scenario: Zooming out
        When I run :zoom-out
        Then the message "Zoom level: 90%" should be shown.
        And the zoom should be 90%

    Scenario: Setting zoom
        When I run :zoom 50
        Then the message "Zoom level: 50%" should be shown.
        And the zoom should be 50%

    Scenario: Resetting zoom
        When I set ui -> default-zoom to 42%
        And I run :zoom 50
        And I run :zoom
        Then the message "Zoom level: 42%" should be shown.
        And the zoom should be 42%

    Scenario: Setting zoom to invalid value
        When I run :zoom -1
        Then the error "Can't zoom -1%!" should be shown.
