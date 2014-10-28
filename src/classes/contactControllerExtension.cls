public with sharing class contactControllerExtension {
    public Contact selectedId {get; set;}
    public Contact selectedName {get; set;}
    
    public contactControllerExtension(ApexPages.StandardController controller) {
    }
    
    public void randomSelection(){
        
    list<Contact> contactList=[SELECT id, Name FROM Contact where Capgemini__c = true and Random_Selection__c = False];

    integer selectedContact = math.round(math.random()*contactList.size());
    selectedId = contactList[selectedContact];
    
    /*Map<Id,Contact> con = Map<Id,Contact>;
    con = [Select id, Name from Contact where id=:selectedId];
    selectedName = con.Name;*/
    }
    
    public void updateSelection(){
    //if(Contact.Random_Selection__c == 0)
    //Contact.Random_Selection__c = 1;
    
    
    }


   

}