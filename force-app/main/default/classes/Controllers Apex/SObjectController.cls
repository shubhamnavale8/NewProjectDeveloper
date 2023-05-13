public class SObjectController {
  @AuraEnabled(cacheable=true)
  public static Boolean deleteTheRecord(String objName, String recordId) {
    Boolean isDeleted = false;
    try {
      List<SObject> sObjList = new List<SObject>();
      SObject sObj = Schema.getGlobalDescribe()
        .get(objName)
        .newSObject(recordId);
      sObjList.add(sObj);
      Database.DeleteResult[] resultList = Database.delete(sObjList, false);
      for (Database.DeleteResult result : resultList) {
        if (result.isSuccess()) {
          isDeleted = true;
          System.debug('Record deleted successfully: ' + result.getId());
        } else {
          isDeleted = false;
          for (Database.Error error : result.getErrors()) {
            System.debug('Error deleting record: ' + error.getMessage());
          }
        }
      }
    } catch (Exception e) {
      System.debug('Exception deleting record: ' + e.getMessage());
    }
    return isDeleted;
  }

  @AuraEnabled(cacheable=true)
  public static Boolean recordsListCol(String objName, String[] recordId) {
    return true;
  }

  @AuraEnabled(cacheable=true)
  public static Map<String, String> fetchAllObjectList() {
    Map<String, String> mapOfAllObject = new Map<String, String>();
    List<String> customObjectList = new List<string>();
    List<String> standardObjectList = new List<string>();
    for (Schema.SobjectType obj : Schema.getGlobalDescribe().values()) {
      Schema.DescribeSObjectResult objDescribe = obj.getDescribe();
      if (objDescribe.isCustom()) {
        String objName = objDescribe.getName();
        customObjectList.add(objName);
      } else {
        String objName = objDescribe.getName();
        standardObjectList.add(objName);
      }
    }
    customObjectList.sort();
    standardObjectList.sort();
    for (String obj : standardObjectList) {
      mapOfAllObject.put(obj, obj);
    }
    for (String obj : customObjectList) {
      mapOfAllObject.put(obj, obj);
    }
    return mapOfAllObject;
  }

  @AuraEnabled(cacheable=true)
  public static Map<String, String> fetchAllFieldsForSelectedObject(
    String strObjectName
  ) {
    Map<String, Schema.SObjectType> detail = Schema.getGlobalDescribe();
    Map<String, String> mapOfFields = new Map<String, String>();
    for (
      Schema.SObjectField fields : detail.get(strObjectName)
        .getDescribe()
        .fields.getMap()
        .Values()
    ) {
      mapOfFields.put(
        fields.getDescribe().getName(),
        fields.getDescribe().getName()
      );
    }
    return mapOfFields;
  }

  @AuraEnabled(cacheable=true)
  public static List<sObject> fetchAllRecordsOfSelectedObject(
    String strObjectName,
    Integer count
  ) {
    Map<String, Schema.SObjectType> detail = Schema.getGlobalDescribe();
    List<String> allFieldsOfSelectedObject = new List<String>();
    for (
      Schema.SObjectField fields : detail.get(strObjectName)
        .getDescribe()
        .fields.getMap()
        .Values()
    ) {
      allFieldsOfSelectedObject.add(fields.getDescribe().getName());
    }
    string allFields = string.join(allFieldsOfSelectedObject, ',');
    String query = 'select ' + allFields + ' from ' + strObjectName;
    return Database.query(query);
  }

  @AuraEnabled(cacheable=true)
  public static List<SObject> searchSObjectRecordsOnSearch(
    String objectName,
    String searchTerm,
    String sendedField
  ) {
    Map<String, Schema.SObjectType> detail = Schema.getGlobalDescribe();
    List<String> allFieldsOfSelectedObject = new List<String>();
    for (
      Schema.SObjectField fields : detail.get(objectName)
        .getDescribe()
        .fields.getMap()
        .Values()
    ) {
      allFieldsOfSelectedObject.add(fields.getDescribe().getName());
    }
    string allFields = string.join(allFieldsOfSelectedObject, ',');
    String query =
      'select ' +
      allFields +
      ' from ' +
      objectName +
      ' where ' +
      sendedField +
      ' LIKE ' +
      '\'%' +
      searchTerm +
      '%\'';
    return Database.query(query);
  }
}