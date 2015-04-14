/**
 * Apex JSON Generator Demo
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class JSONGeneratorDemoControllerTest {

    private static User testAdminUser = CommonTester.getTestUser();
    
    /**
     * コンストラクタ
     */
    static testMethod void JSONGeneratorDemoControllerTest1() {
    
        System.runAs(testAdminUser) {
            Test.startTest();

            JSONGeneratorDemoController cls = new JSONGeneratorDemoController();

            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.jsonStr), true);
        }
    }

    /**
     * JSON文字列作成
     */
    static testMethod void doCreateJSONTest1() {
    
        System.runAs(testAdminUser) {

            JSONGeneratorDemoController cls = new JSONGeneratorDemoController();

            Test.startTest();

            cls.doCreateJSON();

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(cls.jsonStr), true);
        }
    }

    /**
     * JSON文字列クリア
     */
    static testMethod void doClearJSONTest1() {
    
        System.runAs(testAdminUser) {

            JSONGeneratorDemoController cls = new JSONGeneratorDemoController();
            cls.doCreateJSON();
            System.assertEquals(String.isNotEmpty(cls.jsonStr), true);

            Test.startTest();

            cls.doClearJSON();

            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.jsonStr), true);
        }
    }
}