public with sharing class AccountTable {

    public List <Account> accountrecords { get; set; }
    public AccountTable()
    {
        accountrecords = [select Name from Account where BillingState='CA' limit 5];
    }    
}