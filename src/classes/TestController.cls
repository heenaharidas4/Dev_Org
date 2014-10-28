public class TestController {

    public String Names { get; set; }

    
    public WrapperClass wrapper{get; set;}
    
    public TestController(){
     if(wrapper== null)
            {
                wrapper= new WrapperClass ();
            } 
    }
    
   
    
    public void AddNames() {
    
    if(!String.isBlank(Names)){
    WrapperClass.StudentInformation addstudent = new WrapperClass.StudentInformation();
   // addstudent.index = wrapper.studentData.size();
    //wrapper.studentData.add(addstudent);
    
    //for(WrapperClass.StudentInformation studentInfo : wrapper.studentData){
       addstudent.Name = Names;
       addstudent.DateCreated = DateTime.now();  
       wrapper.studentData.add(addstudent); 
       wrapper.studentData.sort();
    }
       // return null;
    }


    
}