trigger CheckDuplicateCompany on Lead (before insert) {
if (Trigger.new[0].Company != NULL)
  {
   Lead[] leads = [select id from lead where company = :Trigger.new[0].Company];
   if (leads.size() > 0)
    {
    //Trigger.new[0].Company.addError('Company Name already exists');
    try
    {
    if (Trigger.isUpdate) {
        //List<Lead> leads = new List<Lead>();
        for (Lead a : Trigger.new) {        
            if(a.Company == 'makeLead') {
                leads.add(new lead (company = a.company));
            }
        } 
      update leads;
    }
    }
    catch (TypeException e)
    {
        Trigger.new[0].Company.addError('Company Name already exists');
    }
  }
    }
   
}