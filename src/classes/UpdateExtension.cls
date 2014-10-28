public with sharing class UpdateExtension {

    public UpdateExtension(ApexPages.StandardController controller) {}
    public String Id { get; set; }
    public String fname { get; set; }
    public String lname { get; set; }
    public String msg { get; set; }

    public UpdateExtension(ApexPages.StandardSetController controller) {}
   
     
    public void reset()
    {
        Id=null;
        fname=null;
        lname=null;
        msg=null;
    }
    
    public void remove() 
    {
        try
           {
             Test__c tempobj = new Test__c();
             tempobj = [Select First_Name__c, Last_Name__c FROM Test__c WHERE Name =:Id Limit 1]; 
             tempobj.First_Name__c = fname;
             tempobj.Last_Name__c = lname; 
             Delete tempobj;
           }
       catch(exception e)
           {
             msg = 'Record does not exist';
           } 
    }
     
    public void fetch() 
    {
        try
           {
               Test__c testobj = new Test__c();
               testobj=[Select Name, First_Name__c, Last_Name__c from Test__c where Name=:Id limit 1];
               Id=testobj.Name;
               fname=testobj.First_Name__c;
               lname=testobj.Last_Name__c;
           }
        catch(exception e)
           {
               msg = 'Record does not exist';
           }
    }
    
    public void update_data() 
    {
        try
           {
               Test__c tempobj = new Test__c();
               tempobj = [Select First_Name__c, Last_Name__c FROM Test__c WHERE Name =:Id Limit 1]; 
               tempobj.First_Name__c = fname;
               tempobj.Last_Name__c = lname; 
               Update tempobj;
           }
        catch(exception e)
           {
              msg = 'SOQL error';
           }
   
    }
}