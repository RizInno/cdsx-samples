sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
	'use strict';

	var CustomPageDefinitions = {
		actions: {},
		assertions: {}
	};

	return new ObjectPage(
		{
			appId: 'com.rizing.notification',
			componentId: 'MaintenanceNotificationItemObjectPage',
			entitySet: 'MaintenanceNotificationItem'
		},
		CustomPageDefinitions
	);
});