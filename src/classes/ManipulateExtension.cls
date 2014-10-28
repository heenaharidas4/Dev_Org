public with sharing class ManipulateExtension {

    public ManipulateExtension(ApexPages.StandardController controller) {}
    
    public String Id { get; set; }
    public String name { get; set; }
    public String address { get; set; }
    public String msg { get; set; }
    
    public Integer TempObj;
    
    boolean IsFetchButtonDisabled = false;
    boolean IsPreviousButtonDisabled = false;
    boolean IsNextButtonDisabled = false; 
    boolean IsUpdateButtonDisabled = false; 
    boolean IsDeleteButtonDisabled = false; 
    boolean IsResetButtonDisabled = false; 
    
    public ManipulateExtension(ApexPages.StandardSetController controller) {}  
    
    public void reset()
    {
        IsFetchButtonDisabled = false;
        IsPreviousButtonDisabled = false;
        IsNextButtonDisabled = false;
        IsUpdateButtonDisabled = true;
        IsDeleteButtonDisabled = true;
        IsResetButtonDisabled = true;
        Id=null;
        name=null;
        address=null;
        msg=null;
    }
    
    public void remove() 
    {
        IsFetchButtonDisabled = true;
        IsPreviousButtonDisabled = true;
        IsNextButtonDisabled = true;
        IsUpdateButtonDisabled = false;
        IsDeleteButtonDisabled = false;
        IsResetButtonDisabled = false;
        try
           {
             Contact_Infos__c tempobj = new Contact_Infos__c();
             tempobj = [Select Name__c, Address__c FROM Contact_Infos__c WHERE Name =:Id Limit 1]; 
             tempobj.Name__c = name;
             tempobj.Address__c = address; 
             Delete tempobj;
             Id=null;
             name=null;
             address=null;
           }
       catch(exception e)
           {
             msg = 'Check the contact id you have entered. Record does not exist';
           } 
    }
     
    public void fetch() 
    {
        IsFetchButtonDisabled = true;
        IsPreviousButtonDisabled = true;
        IsNextButtonDisabled = true;
        IsUpdateButtonDisabled = false;
        IsDeleteButtonDisabled = false;
        IsResetButtonDisabled = false;
        try
           {
               Contact_Infos__c testobj = new Contact_Infos__c();
               testobj=[Select Name, Name__c, Address__c from Contact_Infos__c where Name=:Id limit 1];
               Id=testobj.Name;
               name=testobj.Name__c;
               address=testobj.Address__c;
           }
        catch(exception e)
           {
               msg = 'Check the contact id you have entered. Record does not exist';
           }
    }
    
    public void update_data() 
    {
        IsFetchButtonDisabled = true;
        IsPreviousButtonDisabled = true;
        IsNextButtonDisabled = true;
        IsUpdateButtonDisabled = false;
        IsDeleteButtonDisabled = false;
        IsResetButtonDisabled = false;
        try
           {
               Contact_Infos__c tempobj = new Contact_Infos__c();
               tempobj = [Select Name__c, Address__c FROM Contact_Infos__c WHERE Name =:Id Limit 1]; 
               tempobj.Name__c = name;
               tempobj.Address__c = address; 
               Update tempobj;
               Id=null;
               name=null;
               address=null;
           }
        catch(exception e)
           {
              msg = 'SOQL error';
           }
   
    }
    
    public void previous() 
    {
        IsFetchButtonDisabled = false;
        IsPreviousButtonDisabled = false;
        IsNextButtonDisabled = false;
        IsUpdateButtonDisabled = true;
        IsDeleteButtonDisabled = true;
        IsResetButtonDisabled = true;
        try
        {
            TempObj=Integer.valueof(Id);
            TempObj=TempObj-1;
            Id=String.valueof(TempObj);
            Contact_Infos__c Tobj = new Contact_Infos__c();
            Tobj = [Select Name, Name__c, Address__c from Contact_Infos__c where Name=:Id limit 1];
            Id= Tobj.Name;
            name=Tobj.Name__c;
            address=Tobj.Address__c;
        }
        catch(exception e)
        {
        Id=null;
        name=null;
        address=null;
        msg='Record does not exist';
        }
    }
    
     public void next() 
     {
        IsFetchButtonDisabled = false;
        IsPreviousButtonDisabled = false;
        IsNextButtonDisabled = false;
        IsUpdateButtonDisabled = true;
        IsDeleteButtonDisabled = true;
        IsResetButtonDisabled = true;
         try
         {
         TempObj=Integer.valueof(Id);
         TempObj=TempObj+1;
         Id=String.valueof(TempObj);
         Contact_Infos__c Tobj = new Contact_Infos__c();
         Tobj=[Select Name, Name__c, Address__c from Contact_Infos__c where Name=:Id limit 1];
         Id=Tobj.Name;
         name=Tobj.Name__c;
         address=Tobj.Address__c;
         }
         catch(exception e)
         {
         Id=null;
         name=null;
         address=null;
         msg='Record does not exist';
         }
     }
     
      public boolean getIsPreviousButtonDisabled() {
      return IsPreviousButtonDisabled;
  }
 
  public boolean getIsNextButtonDisabled() {
      return IsNextButtonDisabled;
  }
  
  public boolean getIsFetchButtonDisabled() {
      return IsFetchButtonDisabled;
  }
  
  public boolean getIsUpdateButtonDisabled() {
      return IsUpdateButtonDisabled;
  }
  
  public boolean getIsDeleteButtonDisabled() {
      return IsDeleteButtonDisabled;
  }
  
  public boolean getIsResetButtonDisabled() {
      return IsResetButtonDisabled;
  }


}