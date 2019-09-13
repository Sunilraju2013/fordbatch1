@DelarDetails
Feature: Register Delar
As an Ford Admin I want to register Delar

  Scenario: Register Delar with Delar information
    Given Web-context is setup
	  And the DB is empty
	  And the following Delars to be added
	  |FName      |LName      |email                   |phone       |password  |DelarTyp  |address                    |dealer Name
	  |Sunil      |Raju       |smadhi@csc.com          |2489970200  |12345     |cus       |123, car street, MI-48326  |abc
	When Client requests POST /api/Delar/add/DelarType/DelarDetails/smadhi@csc.com
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "successCode":"Delar_ADDED",
	  "successMessage":"Delar successfully added"	  
	  }
	  """
	  
  Scenario: Register Delar with Delar information
    Given Web-context is setup
	  And the DB is empty
	  And the following Delars to be added
	  |FName      |LName      |email                   |phone       |password  |DelarTyp  |address                    |dealer Name
	  |Sunil      |Raju       |smadhi@csc.com          |2489970200  |12345     |cus       |123, car street, MI-48326  |abc
	When Client requests POST /api/Delar/add/DelarType/DelarDetails/smadhi@csc.com
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"Delar_EXIST",
	  "errorMessage":"Delar already exist"	  
	  }
	  """
	  
  Scenario: Register dealer with dealer information
    Given Web-context is setup
	  And the DB is empty
	  And the following dealer to be added
	  |FName      |LName      |email                   |phone       |password  |DelarTyp  |address                    |dlrName
	  |Suresh     |Raja       |sraja@frddlr.com        |2489970201  |78956     |dlr       |234, car street, MI-48326  |Ford Dealer
    When Client requests POST /api/Delar/add/DelarType/DelarDetails/smadhi@csc.com
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
	  |FName      |LName      |email                   |phone       |password  |DelarTyp  |address                    |dlrName
	  |Suresh     |Raja       |sraja@frddlr.com        |2489970201  |78956     |dlr      |234, car street, MI-48326  |Ford Dealer
    When Client requests POST /api/Delar/add/DelarType/DelarDetails/sraja@frddlr.com
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"DEALER_EXIST",
	  "errorMessage":"Dealer already exist"	  
	  }
	  """