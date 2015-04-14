/**
 * Apex JSON Generator Demo
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class JSONGeneratorDemoController {
    
    // Helperクラス
    private JSONGeneratorDemoHelper helper = new JSONGeneratorDemoHelper();
    // 商談
    public Opportunity opportunity {get; set;}
    // JSON文字列
    public String jsonStr {get; set;}

    /**
     * コンストラクタ
     */
    public JSONGeneratorDemoController() {
        try {
            // 商談
            this.opportunity  = new Opportunity();
        } catch(Exception e) {
            CommonUtil.msgException(e);
            return;
        }
    }
    
    /**
     * JSON文字列作成
     */
    public void doCreateJSON() {
        try {
            // JSON文字列取得
            String jsonString= this.helper.createJSON(this.opportunity);
            // 表示用に改行コード置換
            this.jsonStr = this.helper.doReplaceBR(jsonString);
        } catch(Exception e) {
            CommonUtil.msgException(e);
            return;
        }
    }
    
    /**
     * JSON文字列クリア
     */
    public void doClearJSON() {
        try {
            // JSON文字列クリア
            this.jsonStr = '';
        } catch(Exception e) {
            CommonUtil.msgException(e);
            return;
        }
    }
}