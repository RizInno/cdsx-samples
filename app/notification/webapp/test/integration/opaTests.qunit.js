sap.ui.require(
	[
		'sap/fe/test/JourneyRunner',
		'com/rizing/notification/test/integration/FirstJourney',
		'com/rizing/notification/test/integration/pages/MaintenanceNotificationList',
		'com/rizing/notification/test/integration/pages/MaintenanceNotificationObjectPage',
		'com/rizing/notification/test/integration/pages/MaintenanceNotificationItemObjectPage'
	],
	function(JourneyRunner, opaJourney, MaintenanceNotificationList, MaintenanceNotificationObjectPage, MaintenanceNotificationItemObjectPage) {
		'use strict';
		var JourneyRunner = new JourneyRunner({
			// start index.html in web folder
			launchUrl: sap.ui.require.toUrl('com/rizing/notification') + '/index.html'
		});


		JourneyRunner.run(
			{
				pages: {
					onTheMaintenanceNotificationList: MaintenanceNotificationList,
					onTheMaintenanceNotificationObjectPage: MaintenanceNotificationObjectPage,
					onTheMaintenanceNotificationItemObjectPage: MaintenanceNotificationItemObjectPage
				}
			},
			opaJourney.run
		);
	}
);