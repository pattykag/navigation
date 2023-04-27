sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/ordersmodule/test/integration/FirstJourney',
		'ns/ordersmodule/test/integration/pages/OrdersList',
		'ns/ordersmodule/test/integration/pages/OrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrdersList, OrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/ordersmodule') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrdersList: OrdersList,
					onTheOrdersObjectPage: OrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);