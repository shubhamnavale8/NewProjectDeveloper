@isTest
public class TestDataFactoryAccount {
    public static List<Account> getAccount(){
        List<Account> accLst=new List<Account>();
        for(Integer itr=0; itr<20; itr++){
            Account objAcc=new Account(Name='Test_'+itr,Industry='Media',Phone='12345678'+itr);
            accLst.add(objAcc);
        }
        return accLst;
    }
}


