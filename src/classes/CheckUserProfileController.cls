public class CheckUserProfileController 
{
    public String MProfile { get; set; }
  public CheckUserProfileController(ApexPages.StandardController controller) {}

  public void save() {} 

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