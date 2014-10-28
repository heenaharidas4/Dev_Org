public with sharing class JoinExtension {

    public JoinExtension(ApexPages.StandardController controller) {}
    
    public String Id { get; set; }
    public String cname { get; set; }
    public String address { get; set; }
    
    /*public List <Account_Detail__c> AId { get; set; }
    public List <Account_Detail__c> AccNO { get; set; }
    public List <Account_Detail__c> balance { get; set; }
    public List <Account_Detail__c> type { get; set; }
    public String Uniquekey {get; set;} */
    
   
    public String AId { get; set; }
    public Integer AccNO { get; set; }
    public Integer balance { get; set; }
    public String type { get; set; }
    public String Uniquekey {get; set;}
    public String msg { get; set; } 
 
    public void fetch()
    {
      try
      {
         Contact_infos__c tstobj = new Contact_infos__c();
               tstobj=[Select c.Name__c, c.Name, c.Id, c.Address__c From Contact_Infos__c c where Name=:id limit 1];
               Id=tstobj.Name;
               cname=tstobj.Name__c;
               address=tstobj.Address__c;
               Uniquekey=tstobj.Id;
               
         Account_Detail__c testobj = new Account_Detail__c();
         /*List<Account_Detail__c> testobj = new List<Account_Detail__c>();*/
         
               testobj=[Select a.Type__c, a.Name, a.Contact_Infos__c, a.Balance__c, a.Account_No__c From Account_Detail__c a
               where Contact_Infos__c=:Uniquekey limit 5];
              Accno=integer.valueof(testobj.Account_No__c);
               Balance=Integer.valueof(testobj.balance__c);
               type=testobj.type__c; 
               
              // return testobj;
       }
       catch(exception e)
       {
       msg='Record does not exist. Check the contact id you have entered';
        }       
    }
}