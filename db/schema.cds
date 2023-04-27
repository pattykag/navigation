namespace nav;

entity Customers {
    key ID    : Integer; // customer.ID
        name  : String(30);
        order : Association to many Orders on order.customer = $self;
}

entity Orders {
    key ID       : Integer;
        product  : String(50);
        customer : Association to Customers; // customer_ID
}
