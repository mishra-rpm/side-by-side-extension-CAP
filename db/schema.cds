namespace  com.incidentManagement;

using {
 sap.common.CodeList,
 cuid,
 managed
} from '@sap/cds/common';

entity Incidents:cuid,managed{
    customer    : Association to Customers;
    title       : String @title : 'Title';
    urgency     : Association to Urgency default 'M';
    status      : Association to Status default 'N' ;
    conversation: Composition of many {
                            key ID      : UUID;
                            timestamp   : type of managed : createdAt;
                            author      : type of managed : createdBy;
                            message     : String;
                    }        
}

entity Customers:managed{
    key ID          : String;
        firstName   : String;
        lastName    : String;
        name        : String = trim(firstName||' ' ||lastName);
        email       : EmailAddress;
        phone       : PhoneNumber;
        incidents   : Association to many Incidents on incidents.customer=$self;
        address     : Composition of many Address on address.customer=$self;
}

entity Address:cuid,managed{
    customer      : Association to Customers;
    city          : String;
    postalCode    : String;
    streetAddress : String;
}


entity Status : CodeList{
    key Code    : String enum{
                            new        = 'N';
                            assigned   = 'A';
                            in_process = 'I';
                            on_hold    = 'H';
                            resolved   = 'R';
                            closed     = 'C';
                        };
    criticality : Integer;
}

entity Urgency : CodeList{
    key code : String enum{
                            high   = 'H';
                            medium = 'M';
                            low    = 'L';
                        };
}
type EmailAddress : String;
type PhoneNumber :String;

