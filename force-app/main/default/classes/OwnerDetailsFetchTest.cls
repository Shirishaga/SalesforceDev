public with sharing class OwnerDetailsFetchTest {
    public static testmethod OwnerDetailsFetchTest() {

       

        UserRole r = new UserRole(DeveloperName = 'Shirisha', Name = 'Shirisha');
            insert r;
            User u = new User(
                ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
                LastName = 'last',
                Email = 'shirisha@salesforcedeveloper.com',
                Username = 'shirisha@salesforcedeveloper.com' + System.currentTimeMillis(),
                CompanyName = 'TEST',
                Title = 'title',
                Alias = 'alias',
                TimeZoneSidKey = 'America/Los_Angeles',
                EmailEncodingKey = 'UTF-8',
                LanguageLocaleKey = 'en_US',
                LocaleSidKey = 'en_US',
                UserRoleId = r.Id
            );
            insert u;
            System.runAs(u){
                Account acc = new Account();
                acc.Name = 'Test Account';
                insert acc;

                test.startTest();
                OwnerDetailsFetch.getUser(acc.Id);
                test.stopTest();

            }
    }
}
