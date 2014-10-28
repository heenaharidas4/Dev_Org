public with sharing class TestUtilities {
    
    public Account      aAcc         {get; set;}
    public Attachment   aAttachment     {get; set;}
    
    public void generateAccount(){

        this.aAcc                = new Account();
        this.aAcc.Name      = 'Test';
        //this.aAcc.LastName       = 'Test'; 
        
        insert this.aAcc;

        this.aAttachment = new Attachment();
        this.aAttachment.Body = Blob.valueOf('String');
    }
    
    public static TestUtilities generateTest(){
        TestUtilities e = new TestUtilities();
        e.generateAccount();
        return e;
    }
}