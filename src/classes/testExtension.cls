public with sharing class testExtension 
{
 public testExtension(ApexPages.StandardController controller) {}

public String Id { get; set; }
public String fname { get; set; }
public String lname { get; set; }
public Integer TempObj;

    public testExtension(ApexPages.StandardSetController controller) {}
    
    public void fetch() 
    {
        Test__c testobj = new Test__c();
        testobj=[Select Name, First_Name__c, Last_Name__c from Test__c where Name=:Id limit 1];
        Id=testobj.Name;
        fname=testobj.First_Name__c;
        lname=testobj.Last_Name__c;
    
    }
    
    public void previous() 
    {
        try
        {
            TempObj=Integer.valueof(Id);
            TempObj=TempObj-1;
            Id=String.valueof(TempObj);
            Test__c Tobj = new Test__C();
            Tobj = [Select Name, First_Name__c, Last_Name__c from Test__c where Name=:Id limit 1];
            Id= Tobj.Name;
            fname=Tobj.First_Name__c;
            lname=Tobj.Last_Name__c;
        }
        catch(exception e)
        {
        Id=null;
        fname=null;
        lname=null;
        }
    }
    
     public void next() 
     {
         try
         {
         TempObj=Integer.valueof(Id);
         TempObj=TempObj+1;
         Id=String.valueof(TempObj);
         Test__c Tobj = new Test__c();
         Tobj=[Select Name, First_Name__c, Last_Name__c from Test__c where Name=:Id limit 1];
         Id=Tobj.Name;
         fname=Tobj.First_Name__c;
         lname=Tobj.Last_Name__c;
         }
         catch(exception e)
         {
         Id=null;
         fname=null;
         lname=null;
         }
     }    
}