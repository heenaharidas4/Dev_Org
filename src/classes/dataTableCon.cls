public with sharing class dataTableCon {

    public String Cdetail { get; set; }

    public String Id { get; set; }

   
    
  

                        

        List<Account> accounts;



        public List<Account> getAccounts() {

                if(accounts == null) accounts = [select name, owner.name from account limit 10];

                return accounts;

        }

}