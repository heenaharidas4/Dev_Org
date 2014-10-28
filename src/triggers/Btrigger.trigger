trigger Btrigger on Bank__c (before insert) {

 if (Trigger.isInsert) {
 	
  	
  	 for(Bank__c a: Trigger.new)

      if (a.location__c == 'null')

        a.location__c.addError('add location');
  }


}