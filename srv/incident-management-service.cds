using { 
    com.incidentManagement as my 
} from '../db/schema';

/**
 * Service used by support personells, i.e. incendt processors
 */

 service ProcessorService @(path: '/processor'){
      entity Incidents as projection on my.Incidents;

      @readonly
      entity Customers as projection on my.Customers;

 }
 annotate ProcessorService with @(requires : 'support') ;
 
/**
 * Service used by admin 
 * */ 

service AdminService @(path: '/admin'){
    entity Incidents as projection on my.Incidents;
    entity Customers as projection on my.Customers;
}

annotate AdminService with @(requires : 'admin');

/**
 * enabling draft
 */

 annotate ProcessorService.Incidents with @odata.draft.enabled;