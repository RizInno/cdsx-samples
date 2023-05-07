sap.ui.define([
	"sap/ui/test/opaQunit"
], function(opaTest) {
	"use strict";

	var Journey = {
		run: function() {
			QUnit.module("First journey");

			opaTest("Start application", function(Given, When, Then) {
				Given.iStartMyApp();

				Then.onTheA_BusinessPartnerList.iSeeThisPage();

			});


			opaTest("Navigate to ObjectPage", function(Given, When, Then) {
				// Note: this test will fail if the ListReport page doesn't show any data
				When.onTheA_BusinessPartnerList.onFilterBar().iExecuteSearch();
				Then.onTheA_BusinessPartnerList.onTable().iCheckRows();

				When.onTheA_BusinessPartnerList.onTable().iPressRow(0);
				Then.onTheA_BusinessPartnerObjectPage.iSeeThisPage();

			});

			opaTest("Teardown", function(Given, When, Then) {
				// Cleanup
				Given.iTearDownMyApp();
			});
		}
	};

	return Journey;
});