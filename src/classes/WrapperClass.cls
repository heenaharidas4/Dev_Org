public class WrapperClass{
 public class StudentInformation  implements Comparable{
    public DateTime DateCreated { get; set; }
    public String Name { get; set; }
    //public Integer index {get; set;}
    //public StudentInformation studentData{get; set;}
 
 public Integer compareTo(Object compareTo) 
    {
    StudentInformation addstudents = (StudentInformation)compareTo;
        //TestController TestController = (TestController ) compareTo;
        if (addstudents.DateCreated < this.DateCreated ) 
            return -1;
        else if (addstudents.DateCreated  > this.DateCreated ) 
            return 1;
        else    
        return 0;        
    }
 }
 
 
 
 public List<StudentInformation > studentData{get; set;}
 //public StudentInformation studentData{get; set;}
 public WrapperClass(){
 studentData = new List<StudentInformation>();
 
 }
 
 public WrapperClass( List<StudentInformation> studentData){
                    
    }
}