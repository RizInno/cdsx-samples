sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
	'use strict';

	var CustomPageDefinitions = {
		actions: {},
		assertions: {}
	};

	return new ListReport(
		{
			appId: 'com.rizing.demo.bupa',
			componentId: 'A_BusinessPartnerList',
			entitySet: 'A_BusinessPartner'
		},
		CustomPageDefinitions
	);
});