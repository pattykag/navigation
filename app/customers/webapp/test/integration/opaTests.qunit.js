sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/customers/test/integration/FirstJourney',
		'ns/customers/test/integration/pages/CustomersObjectPage',
		'ns/customers/test/integration/pages/OrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersObjectPage, OrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/customers') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomersObjectPage: CustomersObjectPage,
					onTheOrdersObjectPage: OrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);