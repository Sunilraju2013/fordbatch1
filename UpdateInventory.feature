@UpdateInventory
Feature: Update Inventory details
As A Delar I want to update Inventory Details

  Scenario: Update Inventory by vehicle type SUV
    Given Web-context is setup
	   And the following New vehicles arived 
	  |year|model            |type       |transmission|color     |price      |trim        |vin        |Delar Name        |Delar Address|
	  |2017|Escape           |SUV        |Automatic   |Blue      |30000      |SE          |ES123      |sunil auto delars |Michigan
	  |2017|Focus            |SUV        |Manual      |While     |25000      |CE          |FO123      |Rajesh auto delars|dearborn 
    When Client Update POST /api/vehicles/Update/type/suv
    Then successful response code should be 200 
	  And result JSON should be 
	  """
	  {
	  "year":"2017",
	  "model":"Escape",
	  "transmission":"Automatic",
	  "color":"Blue",
	  "price":"30000",
	  "trim":"SE",
	  "vin":"ES123"
	  }
	  """
	  
  Scenario: Update Inventory by vehicle type Sedan
    Given Web-context is setup
	   And the following vehicles arrived
      |year|model            |type       |transmission|color     |price      |trim        |vin        |Delar Name        |Delar Address|
	  |2017|Fusion           |Sedan      |Automatic   |Black     |20000      |LE          |FU123      |Sunil Auto mobiles|Michigan|
	  |2017|Focus            |Sedan      |Manual      |While     |25000      |CE          |FO123      |Rajesh Auto mobiles|Dearborn|
    When Client Update POST /api/vehicles/Update/type/sedan
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
	  

 Scenario: Update Inventory by vehicle type Van
    Given Web-context is setup
	  And the following vehicles Arrived
      |year|model            |type       |transmission|color     |price      |trim        |vin        |Delar Name        | Delar Address|
	  |2017|Ecosport         |Van        |Automatic   |Black     |20000      |LE          |FU123      |Sunil Auto mobiles| Michegan     |
	  |2017|Neon             |Van        |Automatic   |Blue      |30000      |SE          |ES123      |RajeshAuto mobiles| Dearborn|    |
	  When Client update POST /api/vehicles/Update/type/van
      Then successful response code should be 200 
	  And result JSON should be 
	  """
	  [{
	  "year":"2017",
	  "model":"Ecosport",
	  "transmission":"Automatic",
	  "color":"Black",
	  "price":"20000",
	  "trim":"LE",
	  "vin":"FU123"
	  },
	  {
	  "year":"2017",
	  "model":"Neon",
	  "transmission":"Automatic",
	  "color":"White",
	  "price":"25000",
	  "trim":"CE",
	  "vin":"FO123"
	  }]
	  """
	