﻿#language: en
@tree
@Positive
@Forms

Feature: check that the item is not cleared when saving the document

As a QA
I want to check that Item (without item key) is not cleared when saving a document

Variables:
import "Variables.feature"

Background:
	Given I launch TestClient opening script or connect the existing one



Scenario: _155000 preparation (check that the item is not cleared)
	When set True value to the constant
	And I close TestClient session
	Given I open new TestClient session or connect the existing one
	* Load info
		When Create catalog ObjectStatuses objects
		When Create catalog ItemKeys objects
		When Create catalog ItemTypes objects
		When Create catalog Units objects
		When Create catalog Items objects
		When Create catalog PriceTypes objects
		When Create catalog Specifications objects
		When Create chart of characteristic types AddAttributeAndProperty objects
		When Create catalog AddAttributeAndPropertySets objects
		When Create catalog AddAttributeAndPropertyValues objects
		When Create catalog Currencies objects
		When Create catalog Companies objects (Main company)
		When Create catalog Stores objects
		When Create catalog Partners objects (Ferron BP)
		When Create catalog Partners objects (Kalipso)
		When Create catalog Companies objects (partners company)
		When Create information register PartnerSegments records
		When Create catalog PartnerSegments objects
		When Create catalog Agreements objects
		When Create chart of characteristic types CurrencyMovementType objects
		When Create catalog TaxRates objects
		When Create catalog Taxes objects	
		When Create information register TaxSettings records
		When Create information register PricesByItemKeys records
		When Create catalog IntegrationSettings objects
		When Create information register CurrencyRates records
		When update ItemKeys
	* Add plugin for taxes calculation
		Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
		If "List" table does not contain lines Then
				| "Description" |
				| "TaxCalculateVAT_TR" |
			When add Plugin for tax calculation
		When Create information register Taxes records (VAT)
	* Tax settings
		When filling in Tax settings for company
	



Scenario: _155001 saving information about an Item without a completed item key in a document Sales order
	* Open document form Sales order
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
	* Add Item item key
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I expand "More" group
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I activate "Procurement method" field in "ItemList" table
		And I select "Stock" exact value from "Procurement method" drop-down list in "ItemList" table
		And I select current line in "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'     |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'         |
			| 'Basic Partner terms, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155002 saving information about an Item without a completed item key in a document Sales invoice
	* Open document form Sales invoice
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I click the button named "FormCreate"
	* Add Item item key
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I expand "More" group
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'     |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'         |
			| 'Basic Partner terms, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155003 saving information about an Item without a completed item key in a document SalesReturn
	* Open document form SalesReturn
		Given I open hyperlink "e1cib/list/Document.SalesReturn"
		And I click the button named "FormCreate"
	* Add Item item key
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.SalesReturn"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'     |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'         |
			| 'Basic Partner terms, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155004 saving information about an Item without a completed item key in a document SalesReturnOrder
	* Open document form SalesReturnOrder
		Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
		And I click the button named "FormCreate"
	* Add Item item key
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'     |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'         |
			| 'Basic Partner terms, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click the button named "FormPostAndClose"
		And I close all client application windows
	
Scenario: _155005 saving information about an Item without a completed item key in a document PurchaseOrder
	* Open document form PurchaseOrder
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		And I click the button named "FormCreate"
	* Add Item item key
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I expand "More" group
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Ferron BP'     |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'        |
			| 'Vendor Ferron, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click Select button of "Store" field
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And I click "OK" button
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "200,00" text in "Price" field of "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155006 saving information about an Item without a completed item key in a document PurchaseInvoice
	* Open document form PurchaseInvoice
		Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
		And I click the button named "FormCreate"
	* Add Item item key
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Ferron BP'     |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'        |
			| 'Vendor Ferron, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click Select button of "Store" field
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And I click "OK" button
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "200,00" text in "Price" field of "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155007 saving information about an Item without a completed item key in a document PurchaseReturn
	* Open document form PurchaseReturn
		Given I open hyperlink "e1cib/list/Document.PurchaseReturn"
		And I click the button named "FormCreate"
	* Add Item item key
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.PurchaseReturn"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Ferron BP'     |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'        |
			| 'Vendor Ferron, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click Select button of "Store" field
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And I click "OK" button
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "200,00" text in "Price" field of "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155008 saving information about an Item without a completed item key in a document PurchaseReturnOrder
	* Open document form PurchaseReturnOrder
		Given I open hyperlink "e1cib/list/Document.PurchaseReturnOrder"
		And I click the button named "FormCreate"
	* Add Item item key
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.PurchaseReturnOrder"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Ferron BP'     |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'        |
			| 'Vendor Ferron, TRY' |
		And I select current line in "List" table
		And I click "OK" button
		And I click Select button of "Store" field
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And I click "OK" button
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "200,00" text in "Price" field of "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows



Scenario: _155009 saving information about an Item without a completed item key in a document Bundling
	* Open document form Bundling
		Given I open hyperlink "e1cib/list/Document.Bundling"
		And I click the button named "FormCreate"
		* Filling in main attributes
			And I click Select button of "Company" field
			And I go to line in "List" table
					| 'Description'  |
					| 'Main Company' |
			And I select current line in "List" table
			And I click Select button of "Item bundle" field
			And I go to line in "List" table
				| 'Description'       |
				| 'Bound Dress+Shirt' |
			And I select current line in "List" table
			And I click Choice button of the field named "Unit"
			And I select current line in "List" table
			And I click Select button of "Store" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 01'  |
			And I select current line in "List" table
			And I input "1,000" text in the field named "Quantity"
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.Bundling"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155010 saving information about an Item without a completed item key in a document Unbundling
	* Open document form Unbundling
		Given I open hyperlink "e1cib/list/Document.Unbundling"
		And I click the button named "FormCreate"
		* Filling in main attributes
			And I click Select button of "Company" field
			And I go to line in "List" table
					| 'Description'  |
					| 'Main Company' |
			And I select current line in "List" table
			And I click Select button of "Item bundle" field
			And I go to line in "List" table
				| 'Description'       |
				| 'Bound Dress+Shirt' |
			And I select current line in "List" table
			And I click Choice button of the field named "Unit"
			And I select current line in "List" table
			And I click Select button of "Store" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 01'  |
			And I select current line in "List" table
			And I input "1,000" text in the field named "Quantity"
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.Unbundling"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I click the hyperlink named "DecorationGroupTitleCollapsedLabel"
		And I click Select button of "Item bundle" field
		And I go to line in "List" table
			| 'Description'       |
			| 'Bound Dress+Shirt' |
		And I select current line in "List" table
		And I click Select button of "Item key bundle" field
		And I go to line in "List" table
			| 'Item key'                      |
			| 'Bound Dress+Shirt/Dress+Shirt' |
		And I select current line in "List" table
		And I click Select button of "Unit" field
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows


Scenario: _155011 saving information about an Item without a completed item key in a document GoodsReceipt
	* Open document form GoodsReceipt
		Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
		And I click the button named "FormCreate"
	* Filling in main attributes
			And I click Select button of "Company" field
			And I go to line in "List" table
					| 'Description'  |
					| 'Main Company' |
			And I select current line in "List" table
			And I click Select button of "Store" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 02'  |
			And I select current line in "List" table
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155012 saving information about an Item without a completed item key in a document ShipmentConfirmation
	* Open document form ShipmentConfirmation
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		And I click the button named "FormCreate"
		* Filling in main attributes
			And I click Select button of "Company" field
			And I go to line in "List" table
					| 'Description'  |
					| 'Main Company' |
			And I select current line in "List" table
			And I click Select button of "Store" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 02'  |
			And I select current line in "List" table
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155013 saving information about an Item without a completed item key in a document InternalSupplyRequest
	* Open document form InternalSupplyRequest
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I click the button named "FormCreate"
		* Filling in main attributes
			And I click Select button of "Company" field
			And I go to line in "List" table
					| 'Description'  |
					| 'Main Company' |
			And I select current line in "List" table
			And I click Select button of "Store" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 01'  |
			And I select current line in "List" table
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _155014 saving information about an Item without a completed item key in a document InventoryTransfer
	* Open document form InventoryTransfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I click the button named "FormCreate"
		* Filling in main attributes
			And I click Select button of "Company" field
			And I go to line in "List" table
					| 'Description'  |
					| 'Main Company' |
			And I select current line in "List" table
			And I click Select button of "Store sender" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 01'  |
			And I select current line in "List" table
			And I click Select button of "Store receiver" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 02'  |
			And I select current line in "List" table
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows


Scenario: _155015 saving information about an Item without a completed item key in a document InventoryTransferOrder
	* Open document form InventoryTransferOrder
		Given I open hyperlink "e1cib/list/Document.InventoryTransferOrder"
		And I click the button named "FormCreate"
		* Filling in main attributes
			And I click Select button of "Company" field
			And I go to line in "List" table
					| 'Description'  |
					| 'Main Company' |
			And I select current line in "List" table
			And I click Select button of "Store sender" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 01'  |
			And I select current line in "List" table
			And I click Select button of "Store receiver" field
			And I go to line in "List" table
				| 'Description' |
				| 'Store 02'  |
			And I select current line in "List" table
		And I click "Add" button
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description'   |
			| 'Dress'         |
		And I select current line in "List" table
		And I click "Save" button
	* Check saving Item
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
		And I move to "Other" tab
		And I save the value of the field named "Number" as "DocumentNumber"
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InventoryTransferOrder"
		And I go to line in "List" table
			| 'Number'   |
			| '$DocumentNumber$'         |
		And I select current line in "List" table
		And "ItemList" table contains lines
			| 'Item'  |
			| 'Dress' |
	* Check the Saved Item register cleaning
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Dress' | 'M/White'  |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "2,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click the button named "FormPostAndClose"
		And I close all client application windows

Scenario: _999999 close TestClient session
	And I close TestClient session