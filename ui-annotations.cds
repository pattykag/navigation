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

annotate nav.Customers with {
    @Commmon.SemanticObject: 'MySemanticObject'
    name
}

annotate nav.Orders with @(UI: {
    HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
    },
    LineItem  : [
        {Value: product},
        //{Value: customer.name},
        // Navigation to another app
        {
            $Type         : 'UI.DataFieldWithIntentBasedNavigation',
            //Value         : customer.name,
            Value         : customer.name,
            SemanticObject: 'Customers',
            Action        : 'display'
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

// annotate nav.Customers with @(UI: {HeaderInfo: {
//     $Type         : 'UI.HeaderInfoType',
//     TypeName      : 'Customer',
//     TypeNamePlural: 'Customers',
//     Title         : {
//         $Type: 'UI.DataField',
//         Value: ID
//     },
//     Description   : {
//         $Type: 'UI.DataField',
//         Value: name
//     },
//     Facets           : [{
//         $Type  : 'UI.ReferenceFacet',
//         Label  : '{i18n>facetsTitle}',
//         Target : '@UI.FieldGroup#Main'
//     }],
//     FieldGroup #Main : {Data : [
//         {Value : name}
//     ]}
// },
// LineItem  : [
//     {Value: ID},
//     {Value: name}
// ],
// });

// annotate nav.Customers with @(UI: {
//     HeaderInfo: {
//         $Type         : 'UI.HeaderInfoType',
//         TypeName      : 'Customer',
//         TypeNamePlural: 'Customers',
//     },
//     LineItem  : [
//         {Value: name},
//         // Navigation in the table
//         {
//             $Type: 'UI.DataFieldWithIntentBasedNavigation',
//             Value : order.product,
//             SemanticObject : 'Orders',
//             Action : 'display',
//         }
//     ],
// });

// annotate nav.Orders with @(UI: {
//     HeaderInfo  : {
//         $Type : 'UI.HeaderInfoType',
//         TypeName : 'Order',
//         TypeNamePlural : 'Orders',
//     },
//     LineItem  : [
//         //{Value: ID},
//         {Value: product}
//     ],
// });
