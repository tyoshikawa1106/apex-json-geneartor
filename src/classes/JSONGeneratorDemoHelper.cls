/**
 * Apex JSON Generator Demo
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class JSONGeneratorDemoHelper {

    /**
     * コンストラクタ
     */
    public JSONGeneratorDemoHelper() {
    
    }
    
    /**
     * JSON文字列作成
     */
    public String createJSON(Opportunity opportunity) {
        String jsonStr = '';
        
        JSONGenerator gen = JSON.createGenerator(true);
        // 『{』を出力
        gen.writeStartObject();
        // 商談名
        if (String.isNotEmpty(opportunity.Name)) {
            gen.writeStringField('Name', opportunity.Name);
        }
        // 取引先ID
        if (String.isNotEmpty(opportunity.AccountId)) {
            gen.writeIdField('AccountId', opportunity.AccountId);
        }
        // 非公開
        gen.writeBooleanField('IsPrivate', opportunity.IsPrivate);
        // 完了予定日
        if (opportunity.CloseDate != null) {
            gen.writeDateField('CloseDate', opportunity.CloseDate);
        }
        // 金額
        if (opportunity.Amount != null) {
            gen.writeNumberField('Amount', opportunity.Amount);
        }
        // 数量
        if (opportunity.TotalOpportunityQuantity != null) {
            gen.writeNumberField('TotalOpportunityQuantity', opportunity.TotalOpportunityQuantity );
        }
        // 説明
        if (String.isNotEmpty(opportunity.Description)) {
            gen.writeStringField('Description', opportunity.Description);
        }
        // 『}』を出力
        gen.writeEndObject();
        // Get the JSON string.
        jsonStr = gen.getAsString();
        
        return jsonStr;
    }
    
    /**
     * 改行コード置換
     */
    public String doReplaceBR(String jsonStr) {

        String result = '';
        if (String.isNotEmpty(jsonStr)) {
            result = jsonStr.replace('\n', '<br/>');
        }

        return result;
    }
}