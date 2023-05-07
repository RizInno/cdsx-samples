sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
	'use strict';

	var CustomPageDefinitions = {
		actions: {},
		assertions: {}
	};

	return new ObjectPage(
		{
			appId: 'com.rizing.demo.bupa',
			componentId: 'A_BusinessPartnerObjectPage',
			entitySet: 'A_BusinessPartner'
		},
		CustomPageDefinitions
	);
});