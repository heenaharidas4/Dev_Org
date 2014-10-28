trigger BankTrigger on Contact_Infos__c (before update) {
	if (Trigger.isBefore) {
    if (Trigger.isupdate) {

        
        for (Contact_Infos__c a : Trigger.old) {
            if (a.name != 'okToUpdate') {
                a.addError('You can\'t update this record!');
            } 
        }
    } 
    /*else {

    // In before insert or before update triggers, the trigger accesses the new records 
    
    // with the Trigger.new list. 
    
        for (Account a : Trigger.new) {
            if (a.name == 'bad') {
                a.name.addError('Bad name');
            }
    }
    if (Trigger.isInsert) {
        for (Account a : Trigger.new) {
            System.assertEquals('xxx', a.accountNumber); 
            System.assertEquals('industry', a.industry); 
            System.assertEquals(100, a.numberofemployees);
            System.assertEquals(100.0, a.annualrevenue);
            a.accountNumber = 'yyy';
        }

// If the trigger is not a before trigger, it must be an after trigger. 
    
} else {
    if (Trigger.isInsert) {
        List<Contact> contacts = new List<Contact>();
        for (Account a : Trigger.new) {        
            if(a.Name == 'makeContact') {
                contacts.add(new Contact (LastName = a.Name,
                                          AccountId = a.Id));
            }
        } 
      insert contacts;
    }
  }
}*/
}
	
	

}