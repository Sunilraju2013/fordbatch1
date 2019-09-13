@UpdateUserName
Feature: Update user details
As an Register user I want to update user name 

  Scenario: Update user details with first name
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/update/user/FName/Nagaraju
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "successCode":"FNAME_UPDATED",
	  "successMessage":"User first name successfully updated"	  
	  }
	  """
	  
  Scenario: Verify user exists with first name
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  
	When Client requests POST /api/user/update/user/FName/Nagaraju
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"USER__DOES_NOT_EXIST",
	  "errorMessage":"User does not exist with given first name"	  
	  }
	  """
	  
  Scenario: Update user details with last name
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/update/user/LName/Badeti
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "successCode":"LName_UPDATED",
	  "successMessage":"User last name successfully updated"	  
	  }
	  """  
	  
    
  Scenario: Verify user exists with last name
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  
	When Client requests POST /api/user/update/user/LName/Badeti
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"USER__DOES_NOT_EXIST",
	  "errorMessage":"User does not exist with given last name"	  
	  }
	  """