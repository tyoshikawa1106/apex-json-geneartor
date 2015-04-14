/**
 * Apex JSON Generator Demo
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class JSONGeneratorDemoHelperTest {

    private static JSONGeneratorDemoHelper helper = new JSONGeneratorDemoHelper();
    private static User testAdminUser = CommonTester.getTestUser();
    
    /**
     * JSON文字列作成
     */
    static testMethod void createJSONTest1() {
    
        System.runAs(testAdminUser) {

            Opportunity opportunity = new Opportunity();

            Test.startTest();

            String result = helper.createJSON(opportunity);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }

    /**
     * JSON文字列作成
     */
    static testMethod void createJSONTest2() {
    
        System.runAs(testAdminUser) {

            // 取引先テストデータ
            Account account = CommonTester.createAccount(true);
            System.assertEquals(String.isNotEmpty(account.Id), true);

            // 商談テストデータ
            Opportunity opportunity = new Opportunity(
                 Name = 'Sample Opportunity'
                ,AccountId = account.Id
                ,IsPrivate = true
                ,CloseDate = date.newInstance(2014, 5, 10)
                ,Amount = 15000
                ,TotalOpportunityQuantity = 50
                ,Description = 'ABC\nDEF\nGHI'
            );

            Test.startTest();

            String result = helper.createJSON(opportunity);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
            // JSON String Result
            Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(result);
            System.assertEquals(jsonMap.get('Name'), opportunity.Name);
            System.assertEquals(jsonMap.get('AccountId'), opportunity.AccountId);
            System.assertEquals(jsonMap.get('CloseDate'), '2014-05-10');
            System.assertEquals(jsonMap.get('Amount'), opportunity.Amount);
            System.assertEquals(jsonMap.get('TotalOpportunityQuantity'), opportunity.TotalOpportunityQuantity);
            System.assertEquals(jsonMap.get('Description'), opportunity.Description);
        }
    }

    /**
     * 改行コード置換
     */
    static testMethod void doReplaceBRTest1() {
    
        System.runAs(testAdminUser) {

            String jsonStr = '';

            Test.startTest();

            String result = helper.doReplaceBR(jsonStr);

            Test.stopTest();

            System.assertEquals(String.isEmpty(result), true);
        }
    }

    /**
     * 改行コード置換
     */
    static testMethod void doReplaceBRTest2() {
    
        System.runAs(testAdminUser) {

            String jsonStr = 'Hello\nWorld';

            Test.startTest();

            String result = helper.doReplaceBR(jsonStr);

            Test.stopTest();

            System.assertEquals(result, 'Hello<br/>World');
        }
    }
}