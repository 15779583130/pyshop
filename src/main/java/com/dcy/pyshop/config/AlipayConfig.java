package com.dcy.pyshop.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2020-03-15
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016091600528235";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC4+kFNqAz9Xr1xcGUGr5wmMVQDnoBk17m2CH2P8e1ah0fon7XzH2hK6DxGOCKUQlJbjeJ6U8SFO7rkaAvy1wQLoghLVbPIe4eqoVyc0UBx/MUP6zUkkB6NhgKUDLXz4HjQFS9NP8zah//8JxTz6K3f2YfTOSf7NBBzN/sQ2/DhVMxntjkE6AMrlG0mcZ3B4QFxAGd6Qh5labsyILgIuGJa4JMxpE+ZTx4UinUwIHwJkkgNItIY/J+JVYoHYIDrdnx9i1Tb93e4mGrcmRp0ir8yXXF+wN7znAdfjurnn0dPbimmhDJL8I5++mjIUN9pfjjq0KyWUi8R2wzE2bze2VQdAgMBAAECggEBAJpPqsqttqhnsIJB0QWS2iDCZePfBh0aGcLRsm2y1N8Am+xjz9XSDZ7vvdiWW8Jy0WGvK5AA8aB0A6UnZ1BeLvHFakXuaNyGsNaXZjssFScCRyLQhLTLxbEqalw3flLEoAR2p885uhtT+SjRMZmIMgTb44NB2yikdlSoDroxwPE38NnuW/rTec1tCjWIurNz4zmK7LrBJYrmHhiwO1GCmJGJqRpl2yyIoUhDdsxUz6/iFgYpmMNq1La+PQHjCS0IwbBfaLXBZSI6lE2GhyvTXhhOnxQYPRron07B7DeJ6enyJk+62a+LhOtzq/LYq0euMLc3sLgnPaGWssLCoZbR5AECgYEA5siZ8l/AAUMBNzPk1msaDvf3LVtXfWPTGv6UEmSqDTgLvp1wavpypV/Nqur2R6ndfmMi4uP/9Z2DhuQI2wIZyOF9G8nQwo9olstTEk6kR21tcucX4NHhFlL0gD17thKDndapJZBFUujFJeFC4D3nVbD+XBS+Vhn6CMNjyUvHpjECgYEAzTBiEsIAulsrfIJ04NRZTwKr/26kDah0WG8eRZX7GyEF2lQmwYwJ4gnmEz4kmrEiqsIzVY+fbQEVbBmHGGNln30Iouhy2Y4HpBS+ev0YPi0qeNkuMalh9tu/+ZEWTL5SFW4nuSYuGKRAsHqzDaDLSr1EFH8RYrQ01ImQc94MFa0CgYEAq/ucNfJC/O25DzFd/Kgt8C+8BRIH3gqxPHGxWQ+pZlZ48iETsLVZEIKXmyKkS/17cX9hdSIiEiDC7pgrPUKQgpH/kODR8Nu8PnvhOUhfxlb29GTg94qQqflB+ftXoPSlHs/kl3ivIL0UhkkbdE7NgZ93vpk6yqFrInKxf0Y4z1ECgYA0Ne9+nmbZBIHYOMnMu7vN4vwpDtonr4mLRxsI0dUHXivDFk6WSS/qmGI220UtJ42OrcOqLdV/QxtUWlqJ1iDxqDseWM+AlCdVlQGzAdu9VnjML1cVw+ftjJUYx9ZIyNTSJylsb06jbogXX+FXwmZ4Khi8rmiaGQioXCipkwK4MQKBgQC36htcPwKIKtoC/ydklXWsrJr8perYsqxDPrduVDffCAvXuyxwj74w6MzadxCOReI2xkbUXhrjLRpCosOU/0u5idjdpB0wZHqpe6WCbAdurwYjWfEg1x7mNdBtzwaGB0XpvKWaewPisrhKlEPGT8WcR1KNAYFsouk7CSOgAJ9Fsg==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2TR7LbQ0+typjex8+thTUGBWftwWTiAMEJh/zVZgWjMpZY2XBDKrisCCqTbYoENcRkHR75r1HwFeC0GtIbq+agX7y7bqaxzjfcJeY20DjbM2NYaU8DSnF0h7wjLmUNJJceg/RiQmDYXcXqLsBhPxiljcDhfyBPAUK45fC4gMPa8nPfmKreBMMh60bkUhB144pWd/PriI5YCTNN0ydRG6elrR4UP8iD+TFofo29k5MFMg7GtXKzWqByOcZpb1GDzX3Y/wUL3FTNpUxBMNsVk2xPexRxLJIosXZ1HwFDkHHIJ49dPssWxP84nU80XQvdkKKER7KWlBRp1tK5IUI80J1QIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8888/XyShop/user/notifyurl";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8888/XyShop/user/returnurl";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

