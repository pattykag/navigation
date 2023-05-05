using nav from './service';

annotate nav.Orders with {
    //ID       @UI.Hidden;
    product  @title: 'Product';
    customer @title: 'Customer';
};

// annotate nav.Customers with @Common : { SemanticKey  : [
//     ID
// ], };

annotate nav.Customers with {
    ID   @UI.Hidden;
    name @title: 'Customer'
};

annotate nav.Customers with @(UI: {
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Customer',
        TypeNamePlural : 'Customers',
    },
    LineItem  : [
        {Value: name}
    ],
});


// annotate nav.Customers with @(Common: {
//     SemanticObject   : 'customer_ID',
//     AssociationEntity: [order],
// });

// annotate nav.Customers with {
//     @Commmon.SemanticObject: 'MySemanticObject'
//     name
// }

annotate nav.Orders with @(UI: {
    HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
    },
    // FieldGroup  : {
    //     $Type : 'UI.FieldGroupType',
    //     Data:[{
    //         $Type: 'UI.DataFieldWithIntentBasedNavigation',
    //         Label : 'Ref. Sales Order',
    //         Value : customer.name,
    //         SemanticObject: 'Customer'            
    //     }]
    // },
    LineItem  : [
        {Value: product},
        //{Value: customer.name},
        // Navigation to another app
        {
            //$Type         : 'UI.DataFieldWithNavigationPath',
            $Type: 'UI.DataFieldWithIntentBasedNavigation',
            //Value         : customer.name,
            Value         : customer_ID,
            SemanticObject: 'Customers',
            Action        : 'display',
            // Mapping: [{
            //     LocalProperty : customer_ID,
            //     SemanticObjectProperty : 'ID',
            // }]
        }
        // {
        //     $Type: 'UI.DataFieldWithUrl',
        //     //Url : 'https://www.google.com',
        //     Url  : '/customers/webapp/index.html',
        //     Label: 'This',
        //     Value: customer_ID,
        // }
    // navigation between entities
    // {
    //     $Type: 'UI.DataFieldWithNavigationPath',
    //     Label: 'Test',
    //     Value: customer.name,
    //     Target: customer
    // }
    ],
});