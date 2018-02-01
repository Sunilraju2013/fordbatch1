@UpdateContactDetails
Feature: Update user contact details
As an Register user I want to update user contact details 

  Scenario: Update user e-mail address
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/update/user/email/nbadeti@csc.com
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "successCode":"EMAIL_UPDATED",
	  "successMessage":"User email address has been updated successfully"	  
	  }
	  """
	  
  Scenario: Validate user e-mail address
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/update/user/email/nbadeticsc.com
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"INVALID-E-MAIL_ID",
	  "errorMessage":"Invalid e-mail id"	  
	  }
	  """
	  
  Scenario: Update user phone number
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/update/user/phone/0123456789
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "successCode":"PHONE_NUMBER_UPDATED",
	  "successMessage":"User phone number has been updated  successfully"	  
	  }
	  """  
	  
  
	  
  Scenario: Validate user phone number
    Given Web-context is setup
	  And the DB is empty
	  And user exists
	  And the following users to be updated
	  |FName      |LName      |email                   |phone       |password  |userTyp  |address                    |dealer Name
	  |Ramesh     |Manoharan  |rmanoharan6@csc.com     |2489970200  |12345     |cus      |123, car street, MI-48326
	When Client requests POST /api/user/update/user/phone/01234567
    Then successful response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"INVALID_PHONE_NUMBER",
	  "errorMessage":"Invalid phone number"	  
	  }
	  """