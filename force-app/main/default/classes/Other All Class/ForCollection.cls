public class ForCollection {
    // public void demoMethod(){
    //     List<Account> accountListObject=[select AccountNumber from Account];
    //     for(Account listobj:accountListObject){
    //         System.debug('Account From Org : '+listobj);   
    //     }
    // }
    
    public  List<Integer> listCollection(){
         List<Integer> listObject=new List<Integer>();
        //List<Account> accountListObject=[select AccountNumber,Name, from Account];
        
        
        listObject.add(1);
        listObject.add(3);
		listObject.add(4);
        listObject.add(2);
        listObject.add(6);
        listObject.add(5);
        listObject.sort();
        
       /* System.debug(listObject);
         System.debug('');
        for(Integer itr: listObject){
            System.debug('ID : '+itr);
        }*/
        
        return listObject;
    }
    public Set<String>  setCollection(){
        Set<String> setObject=new Set<String>();
     
        setObject.add('Shubham');
        setObject.add('Harshya');
        setObject.add('Akshay');
        setObject.add('Shubham');
        setObject.add('Abdulaziz');
        setObject.add('Pratik');
        setObject.add('Pooja');
        setObject.add('Pratik');
		
        /*System.debug(setObject);
        Integer Count=1;
        for(String val : setObject){
            if(math.mod(count++, 2) == 0){
                System.debug('Hii '+val);
            }
            else{
                System.debug('Hello '+val);
            }
        }*/
        
        return setObject;
    }
    public Map<Integer,String>  mapCollection(){
        Map<Integer,String> mapObject=new Map<Integer,String>();
        
        mapObject.put(1,'Shubham');
        mapObject.put(2,'Harshya');
        mapObject.put(3,'Abdulaziz');
        mapObject.put(4,'Pooja');
        mapObject.put(5,'Pratik');
        mapObject.put(6,'Akshay');
        /*System.debug(mapObject);
        for(Integer key : mapObject.keySet()){
            System.debug(key+' '+mapObject.get(key));
        }*/
        return mapObject;
    }
    
    public void conversionCollection(){
/*=========================================================================================================*/
        ForCollection ClassObjectForAc = new ForCollection();
        System.debug('/*======================================List To Set===================================================================*/');
        //  List to Set
        List<Integer> listObject4=new List<Integer>();
        listObject4=ClassObjectForAc.listCollection();
        Set<Integer> setObject=new Set<Integer>(listObject4);
        System.debug('List to set : '+setObject);
/*=========================================================================================================*/
		//Set To List
		System.debug('/*======================================Set To List===================================================================*/');
        
		Set<String> setObject1=new Set<String>();
        setObject1=ClassObjectForAc.setCollection();
        List<String> listObject1=new List<String>(setObject1);
        System.debug('Set To List : '+listObject1);
/*=========================================================================================================*/
                                                                                  //Set to Map (we can not create map to list or list to map conversion because of the key value are presents in hashtabale and set and map is the example of Hashtable)
        System.debug('/*======================================Map To Set===================================================================*/');
         
        Map<Integer,String> mapObjects=new Map<Integer,String>();
        mapObjects=ClassObjectForAc.mapCollection();
        Set<Integer> setObjectToMapForKey=new Set<Integer>(mapObjects.keySet());
        Set<String> setObjectToMapForValue=new Set<String>(mapObjects.values());
        System.debug('\nKey Value From Set : '+setObjectToMapForKey+'\nValue value From Set : '+setObjectToMapForValue);
        List<Integer> listObjectForMap=new List<Integer>(mapObjects.keySet());
/*=========================================================================================================*/

    }
}


/*
ForCollection obj=new ForCollection();
obj.conversionCollection();
*/