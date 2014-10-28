public class aaSorterContact {
    private String sortedBy = null;
       private Boolean sortAscending = null;
           private AP_SortHelper sorter = new AP_SortHelper();
               private List<Contact> sortedList = null;
                   public aaSorterContact() {
                             sorter.originalList = [SELECT Name, Phone, Account.Name FROM Contact];      
                             }
                                   public PageReference SortByName() {         
                                    setSortedBy('NAME');          
                                    sortedList = (List<Contact>) sorter.getSortedList('Name', sortAscending); 
                                             return null;      
                                    }
                                   public PageReference SortByAccount() {
                                             setSortedBy('ACCOUNT');
                                                       sortedList = (List<Contact>) sorter.getSortedList('Account.Name', sortAscending);
                                                                 return null;
                                  }      
                                  public PageReference SortByPhone() {          
                                  setSortedBy('PHONE');          
                                  sortedList = (List<Contact>) sorter.getSortedList('Phone', sortAscending);          
                                  return null;      
                                  }      
                                  public List<Contact> getList() {          
                                  if (sortedList == null) {              
                                  SortByName();          
                                  }          
                                  return sortedList;      
                                  }      
                                  private void setSortedBy(String value) {          
                                  if (sortedBy == value) {               
                                  sortAscending = !sortAscending;          
                                  } else {              
                                  sortAscending = true;          
                                  }          
                                  sortedBy = value;      
                                  }  
                                  }