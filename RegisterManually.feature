@UserDetails
Feature: Register user
As an Anonymous user I want to register user

  Scenario: Register user with user information
    Given Web-context is setup
	  And the DB is empty
	  And the following users to be added
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/add/userType/userDetails/rmanoharan6@csc.com
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "successCode":"USER_ADDED",
	  "successMessage":"User successfully added"	  
	  }
	  """
	  
  Scenario: Register user with user information
    Given Web-context is setup
	  And the DB is empty
	  And the following users to be added
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/add/userType/userDetails/rmanoharan6@csc.com
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"USER_EXIST",
	  "errorMessage":"User already exist"	  
	  }
	  """
	  
  Scenario: Register dealer with dealer information
    Given Web-context is setup
	  And the DB is empty
	  And the following dealer to be added
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dlrName
	  |Suresh     |Raja       |sraja@frddlr.com        |2489970201  |78956     |dlr      |234, car street, MI-48326  |Ford Dealer
    When Client requests POST /api/user/add/userType/userDetails/sraja@frddlr.com
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "successCode":"DEALER_ADDED",
	  "successMessage":"Dealer successfully added"	  
	  }
	  """
	  
  Scenario: Register dealer with dealer information
    Given Web-context is setup
	  And the DB is empty
	  And the following dealer to be added
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dlrName
	  |Suresh     |Raja       |sraja@frddlr.com        |2489970201  |78956     |dlr      |234, car street, MI-48326  |Ford Dealer
    When Client requests POST /api/user/add/userType/userDetails/sraja@frddlr.com
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"DEALER_EXIST",
	  "errorMessage":"Dealer already exist"	  
	  }
	  """