public with sharing class CheckUsrProfileController {

public String Pname { get; set; }
public String msg { get; set; }

    public CheckUsrProfileController(ApexPages.StandardController controller) {

    }
    
  // button to add missing values  
  public void add() 
  {
      try
      {
          Profile tempobj = new Profile();
               tempobj = [Select Name FROM Profile Limit 1]; 
               tempobj.Name = Pname;
              // Update tempobj; 
      }
      catch(exception e)
      {
          msg='Check the data you have entered';
      }
  }    

  // list to display picklist values of all profiles
  public List<selectOption> getpros() 
  {
    List<selectOption> options = new List<selectOption>(); //list for holding all picklist options
    List<Profile> pr = [ SELECT Name FROM Profile Limit 10 ];
    for(Profile p : pr)
    {
      options.add(new SelectOption(p.Name,p.Name));
    }
    return options;  //return the picklist options 
   }

}