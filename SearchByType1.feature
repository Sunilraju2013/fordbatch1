@VehicleSearch
Feature: Search by Vehicle type
As an Anonymous/Registered user	I want to Search by type (Sedan,SUV, Van) so I can choose a car.

  Scenario: Search by valid vehicle type SUV
    Given Web-context is setup
	  And the DB is empty
	  And the following vehicles exist
      |year|model            |type       |transmission|color     |price      |trim        |vin        |
	  |2017|Fusion           |Sedan      |Automatic   |Black     |20000      |LE          |FU123      |
	  |2017|Escape           |SUV        |Automatic   |Blue      |30000      |SE          |ES123      |
	  |2017|Focus            |Sedan      |Manual      |While     |25000      |CE          |FO123      |
    When Client requests GET /api/vehicles/search/type/suv
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "year":"2017",
	  "model":"Escape",
	  "transmission":"Automatic",
	  "color":"Blue",
	  "price":"30000",
	  "trim":"CE",
	  "vin":"ES123"
	  }
	  """
	  
  Scenario: Search by valid vehicle type sedan
    Given Web-context is setup
	  And the DB is empty
	  And the following vehicles exist
      |year|model            |type       |transmission|color     |price      |trim        |vin        |
	  |2017|Fusion           |Sedan      |Automatic   |Black     |20000      |LE          |FU123      |
	  |2017|Escape           |SUV        |Automatic   |Blue      |30000      |SE          |ES123      |
	  |2017|Focus            |Sedan      |Manual      |While     |25000      |CE          |FO123      |
    When Client requests GET /api/vehicles/search/type/sedan
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  [{
	  "year":"2017",
	  "model":"Fusion",
	  "transmission":"Automatic",
	  "color":"Black",
	  "price":"20000",
	  "trim":"LE",
	  "vin":"FU123"
	  },
	  {
	  "year":"2017",
	  "model":"Focus",
	  "transmission":"Automatic",
	  "color":"White",
	  "price":"25000",
	  "trim":"CE",
	  "vin":"FO123"
	  }]
	  """
	  

 Scenario: Search by Invalid vehicle type
    Given Web-context is setup
	  And the DB is empty
	  And the following vehicles exist
      |year|model            |type       |transmission|color     |price      |trim        |vin        |
	  |2017|Fusion           |Sedan      |Automatic   |Black     |20000      |LE          |FU123      |
	  |2017|Escape           |SUV        |Automatic   |Blue      |30000      |SE          |ES123      |
	  |2017|Focus            |Sedan      |Manual      |While     |25000      |CE          |FO123      |
    When Client requests GET /api/vehicles/search/type/van
    Then error response code should be 404 
	  And result JSON should be 
	  """
	  {
	  "errorCode":"Vehicle_Not_Found",
	  "errorMessage":"Vehicle is not found for given type van"	  
	  }
	  """
	