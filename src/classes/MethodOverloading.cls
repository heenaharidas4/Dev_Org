public with sharing class MethodOverloading {

    public MethodOverloading() {

    }


    public MethodOverloading(ApexPages.StandardController controller) {}
    public String AccName { get; set; }
    public String Industry { get; set; }
    public String Cfname { get; set; }
    public String Clname { get; set; }
    public String Cphone { get; set; }
    public String Cdept { get; set; }
    
    public void Save()
    {
        Account accobj = new Account();
        accobj.Name= AccName;
        accobj.Industry = Industry; 
        Insert accobj;
        Contact conobj = new Contact();
        conobj.FirstName = Cfname;
        conobj.LastName = Clname;
        conobj.Phone = Cphone;
        conobj.Department = Cdept;
        insert conobj;
    }
    public void Reset()
    {
      AccName = null;
      Industry = null;
      Cfname = null;
      Clname = null;
      Cphone = null;
      Cdept  = null; 
    }
    
    public void InsertOperation()
    {
      //  tempobj = [Select Name, Industry FROM Account];
    }
    
    

}