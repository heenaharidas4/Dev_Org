public with sharing class CheckProfileController {

    public CheckProfileController(ApexPages.StandardController controller) {

    }


    public String Userss { get; set; }

    public String getUsers() {
        return null;
    }


  /*  public PageReference Add() {
        return null;
    }*/

public String Id { get; set; }
public String fname { get; set; }
public String lname { get; set; }
Public Integer size{get;set;}
Public Integer noOfRecords{get; set;}


     public ApexPages.StandardSetController setCon {

        get{

            if(setCon == null){

                size = 10;

                string queryString = 'Select Name from User order by Name';

                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));

                setCon.setPageSize(size);

                noOfRecords = setCon.getResultSize();

            }

            return setCon;

        }set;

    }

    
    /*  public void Add() 
    {
    Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
    
       Test__c testobj = new Test__c();
        testobj=[Select Name, First_Name__c, Last_Name__c from Test__c where Name=:Id limit 1];
        Id=testobj.Name;
        fname=testobj.First_Name__c;
        lname=testobj.Last_Name__c;
    
    }
*/

 

    Public List<User> getUser(){

        List<User> userList = new List<User>();

        for(User u : (List<User>)setCon.getRecords())

            userList.add(u);

        return userList;

    }

     

    public pageReference Add() {

        setCon = null;

        getUser();

        setCon.setPageNumber(1);

        return null;

    }

}