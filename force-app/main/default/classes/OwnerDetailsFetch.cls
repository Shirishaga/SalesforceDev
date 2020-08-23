public with sharing class OwnerDetailsFetch {
    /***************************************************************
    * Method Name  : getUser
    * @description : This method is used to return task list of All assigned Tasks
    * @Author      : Shirisha
    * Created Date : 08/21/2020
    ****************************************************************/ 
    @AuraEnabled
    public static User getUser(Id recId) {
    
    
    String sObjName = recId.getSObjectType().getDescribe().getName();
    
    Id OwnerId = (Id) Database.query(
        'select Id,OwnerId from ' + recId.getSobjectType() + ' where id = :recId'
        )[0].get('OwnerId');
        
    User retUsr = [SELECT Id,Name,SmallPhotoUrl,FullPhotoUrl from User Where Id =:OwnerId Limit 1];
    
    return retUsr;
    
    }
    }