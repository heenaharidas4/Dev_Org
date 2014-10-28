trigger updateContactAddress on Account(after insert, after update) 
{
  /*  if (trigger.isUpdate) 
    {
        Set<Id> accAddChange = new Set<Id>();
           for (Account acc : trigger.new) 
           {
                Account OldAccount = trigger.oldMap.get(acc.Id);
                boolean AddChanged = (acc.BillingStreet != OldAccount.BillingStreet || acc.BillingCity != OldAccount.BillingCity || acc.BillingState != OldAccount.BillingState || acc.BillingPostalCode != OldAccount.BillingPostalCode);
                if (AddChanged) 
                {
                    accAddChange.add(acc.Id);
                }
            }
            if (accAddChange.isEmpty() == false) 
            {
                List<Contact> contactlist = [Select Id, AccountId from Contact where AccountId IN :accAddChange];
                for (Contact con : contactlist) 
                {
                    Account acc = trigger.newMap.get(con.AccountId);
                    con.OtherStreet = acc.BillingStreet;
                    con.OtherCity = acc.BillingCity;
                    con.OtherState = acc.BillingState;
                    con.OtherPostalCode = acc.BillingPostalCode;
                }
                if (contactlist.isEmpty() == false) 
                {
                    UPDATE contactlist;
                }
            }
    }*/
}