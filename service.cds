using {nav} from '../db/schema';

service navigation {
    //@odata.draft.enabled
    entity Orders    as projection on nav.Orders;
    @odata.draft.enabled
    entity Customers as projection on nav.Customers;
}
