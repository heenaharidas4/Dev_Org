public with sharing class CeltoFarhn {
 public double fvalue { get; set; }

    public double cvalue { get; set; }

    public double saveConvert() {
    
    Temperature__c tempobj = new Temperature__c();
    tempobj.Cel__c = cvalue;
    insert tempobj;
    tempobj = [Select Fahrn__c FROM Temperature__c WHERE Cel__c = :cvalue Limit 1];
    fvalue = tempobj.Fahrn__c;
        return null;
    }

}