public with sharing class Mapping {

    public String Cdetail1 { get; set; }
public String Cdetail { get; set;}
public String Id { get; set; }
public String accounts { get; set; }
public String output1 { get; set; }
public String msg { get; set; }

List<account> tempobj = new List<account>();
public map <string,string> accountContactMap {get; set;}
List<contact> contobj =new List<contact>();

public void fetch() 
{
try
{
    accountContactMap = new Map<string,string>();
    tempobj= [SELECT id, Name, AccountNumber, Phone, NumberOfEmployees From account];
    for (account acc: tempobj)
    {
         contobj = [Select Name, Department, MobilePhone from contact where AccountID=:acc.id];
            for(contact con: contobj)
            {
                string input = acc.Name+' - ' +con.Name;
                string output ='Account Name: '+ acc.Name + '\nAccount Number: '+ acc.AccountNumber + '\nPhone Number: ' + acc.Phone + '\nNumber of Employees '+acc.NumberOfEmployees + '\nContact Name:  '+ con.Name+'\nMobile Phone: ' +con.MobilePhone + '\nDepartment: ' + con.Department+ '\n';
                accountContactMap.put(input,output);
            }
    }
    Cdetail = accountContactMap.get(id);
    Cdetail1 = accountContactMap.get(id);
}
catch(exception e)
       {
       msg='error';
        }      
}

}