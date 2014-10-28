public with sharing class SortExtension {

    public SortExtension(ApexPages.StandardController controller) {}
    public integer temp;
    public string result;
    public String output { get; set; }
    public String Id { get; set; }
public String fname { get; set; }

     public String output_sorted { get; set; }
    public string msg{get; set;}
    public void fetch()
    {
      output ='';
        List<Test__c> tempobj = new List<Test__c>();
        tempobj= [SELECT Name, First_Name__c From Test__c order by Name DESC];
        for (Test__c tst: tempobj)
        {
            output += tst.Name + ' '+ tst.First_Name__c +'\n';
        }
        
    }
    
    public void bubblesort()
    {
    output_sorted ='';
        List<Test__c> tempObj = new List<Test__c>();
        tempObj= [SELECT  Name, First_Name__c From Test__c order by Name DESC];
        for (integer i = 0; i<tempObj.size()-1 ;i++)
        {
            for (integer j=0; j<tempObj.size()-1 ; j++)
            {

                if (tempObj[j].First_Name__c<tempObj[j+1].First_Name__c)
                {
                     String str = tempObj[j].First_Name__c;
                    tempObj[j].First_Name__c = tempObj[j+1].First_Name__c;
                     tempObj[j+1].First_Name__c = str;
                     update tempObj[j];
                     update tempObj[j+1];
                }
            }
        }
        for (Test__c tst: tempObj)
        {
            output_sorted += tst.Name + ' '+ tst.First_Name__c +'\n';
        }
       
       // return null;
    }

}