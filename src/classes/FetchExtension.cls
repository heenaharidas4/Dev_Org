public with sharing class FetchExtension {

public String Id { get; set; }
public String fname { get; set; }
public String lname { get; set; }

    public FetchExtension(ApexPages.StandardController controller) {

    }

 
    public void reset()
     {
      
     
     }
    
    public PageReference fetch() {
    
     Test__c testobj = new Test__c();
        testobj=[Select Name, First_Name__c, Last_Name__c from Test__c where Name=:Id limit 1];
        Id=testobj.Name;
        fname=testobj.First_Name__c;
        lname=testobj.Last_Name__c;
        
        return Page.test_update;
    
    
    }

}