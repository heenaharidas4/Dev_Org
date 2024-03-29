/**
* @author Sebastian Munoz
* @createdDate 04/06/2010
*/
public with sharing class ShowPicture{

    public  Attachment  file        { set; get; }
    public  Boolean     hasPicture  { set; get; }
    private String      parentId    { set; get; }
    
    /**
    * Constructor
    */
    public ShowPicture( ApexPages.StandardController stdController ){
        
        this.parentId       = stdController.getId();
        this.hasPicture     = false;
                
        List<Attachment> attList = [ Select ParentId, Name, Id, ContentType, BodyLength 
                                        From Attachment 
                                        where ParentId =: this.parentId and name = 'Account Picture' limit 1];
        if( attList.size() > 0 ){
            this.file       = attList.get( 0 );
            this.file.Body  = Blob.valueOf('AuxString');
            this.hasPicture = true;
        }
    }
    
    /**
    * Test method: Environment: no picture uploaded. Then upload one and show it.
    */
    public static testMethod void noPicture(){
        
        Test.startTest();
        
        TestUtilities tu = TestUtilities.generateTest();
        
        ApexPages.StandardController sc = new ApexPages.StandardController( tu.aAcc );
        ShowPicture cTest = new ShowPicture( sc );     
        System.assert( cTest.file == null, 'ERROR: should not an image  ' );       
        Test.stopTest();
    }
    
    /**
    * Test method: Environment: a picture was uploaded then replace this with other.
    */
    public static testMethod void noPictureAndUploadOne(){
        
        TestUtilities tu = TestUtilities.generateTest();
        
        Test.startTest();

        ApexPages.StandardController sc = new ApexPages.StandardController( tu.aAcc );

        tu.aAttachment.ParentId = sc.getid();
        tu.aAttachment.name = 'Account Picture';
        insert tu.aAttachment;

        ShowPicture cTest = new ShowPicture( sc );     
        System.assert( cTest.file != null, 'Error no file attached' );     
        System.assert( tu.aAttachment.ParentId == cTest.file.ParentId, 'Error ParentId must be: ' + tu.aAttachment.ParentId );     
        System.assert( tu.aAttachment.name == cTest.file.name, 'Error name must be: ' + tu.aAttachment.name );
        Test.stopTest();
    }

    public static testMethod void pictureAndUploadOther(){
        
        TestUtilities tu = TestUtilities.generateTest();
        
        Test.startTest();
        ApexPages.StandardController sc = new ApexPages.StandardController( tu.aAcc );

        tu.aAttachment.ParentId = sc.getid();
        tu.aAttachment.name = 'Account Picture';
        insert tu.aAttachment;
        
        //Replace
        tu.aAttachment.Body = Blob.valueOf('String Othe value');
        update tu.aAttachment;
        ShowPicture cTest = new ShowPicture( sc );
          
        System.assert( tu.aAttachment.ParentId == cTest.file.ParentId, 'Error ParentId must be: ' + tu.aAttachment.ParentId );     
        System.assert( tu.aAttachment.name == cTest.file.name, 'Error name must be: ' + tu.aAttachment.name );
        Test.stopTest();
    }
}