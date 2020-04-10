Feature: Booking flight tickets from New York City to Munich

  Background:
    Given User is logged in
    And User enters starting and end point
    And User enters number of passengers
    And User enters date
    And User performs search

  Scenario: User finds cheapest tickets
    Then User sees correct search results
    And Results are sorted by ascending price

  Scenario: User is presented a correct summary
    Given User sees correct search results
    When User selects first result
    Then Booking summary is correct
  
  Scenario: User books tickets on the fastest route
    Given User sees correct search results
    When User chooses to book a trip with shortest trip duration
 	  And User enters personal data with payment details
 	  And User finalizes the booking
 	  Then User sees his booking has been made