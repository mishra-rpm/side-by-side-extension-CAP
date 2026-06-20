sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ns/incidentmanagementapp/test/integration/pages/IncidentsList",
	"ns/incidentmanagementapp/test/integration/pages/IncidentsObjectPage"
], function (JourneyRunner, IncidentsList, IncidentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ns/incidentmanagementapp') + '/test/flp.html#app-preview',
        pages: {
			onTheIncidentsList: IncidentsList,
			onTheIncidentsObjectPage: IncidentsObjectPage
        },
        async: true
    });

    return runner;
});

