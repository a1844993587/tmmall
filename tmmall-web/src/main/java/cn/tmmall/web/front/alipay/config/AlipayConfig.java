package cn.tmmall.web.front.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/**
 * @Author: Alex Yu
 * @Date: 2019/5/20 23:19
 */
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092600597588";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCmVhZ10Ghg4DaSsk6Oh392HhDctJFH7JBpOvHr9uFh6vhfv7ZBYaZLmWN3UYW19hnDeVeJxVKwWGI6eyvqgiL7UbjIvEg0+IXs1Yp0Kkb9IcLDGS6IKoBd1frgjjZ4a+iNi3vZ9EPBd+qBpagwLg3KD7p5qgkzcHhV+a3jAKnp8E22ZeMSnz7vWWdBUT2s9qtehdjaPliiekCMLj4bgYZfk8jdKkZp/xHVp/zIM5DBcpEQVnxhtdulZmbUFeYdTzBU1+0iYPssdPKiZ9WGtfH1vnt4VcvGjwpofhLMD8CjGAKTz10yQPB5xmPhP27nh7WhrBRa1U5iaRHWLuW176bdAgMBAAECggEAT0yDcK9m06iQ2+b95J1ceudiipXbHTr+rexYIXKViKUIvD0dmpX/PdNmxB+ta05kgfh7b0cPYNsCGXdXPHnGS6JuQeThV7+TuZEkbLUrGsrZm0GKGYiJojK9ZAjolwh62eBBr2rwUm/k8OIVCMMr98T/1bjmogtgkzxxVeOfHdOZiO4TgxLaaGIMOq7pXb2v+SGjminQaBYhyjLMzcHrlM7a7Oig3urDTK8lrSPZwfSPzL4fX27OGxExMGhlwwM9mWOQtz1RyveGqh3Yr+QeKBjOgXNG8B/DJD4+16Urqr+1kc/s/EoNg7wHF4tdPr2FpAPeoUbezUZpUog8m2ET0QKBgQDXY3f5tkayYL1itNKmowmi0ooOpmGRvODuHLHrIQJhgMHyaxrFLPR0lPBm13rWF7xut3JKDzWUc834gskyL9oQTv+XucFe3S2H+krsZaweHzfpi1iz3au5+SHHtCqH8dvccFmrWk1X5KENKiCCRMdHA7bs3LFePTxFQDdm8ttr8wKBgQDFsu2ts7xNRrLsBxPPmhMzjm2srLCLGdpleYJ+bsHtVBDuLRMHpkhgKoJGfjp92hE7eXQKwD6Nk9vHrhIVqlPaqtJAza7G0MrLn1NCnxTr07cvjTUiXp+09CaNDXC26CMS8/2FbsECsO0CY/wtWQUGi8nOEzfln5wcthKjq0Vl7wKBgGtWcq/LGqhCdZ7/JgtNLLwr2Ak8+Vq7mgyP2EqpBJq6o+y/W3Pv11NR9gwKTnjrE0jJuvcVZUo5++dgpguQtUdzVwSx2aAA8XPWVAhDEudf/2kvvGDGk5H2idMQAjIFYeAVTVqLggfPNENvPwwsYnMNctfPk8S3F5YbToDLfnXpAoGARTKixKjjoPy9BaZYhdK9I8+XjdgIFzgeXGRSi6SC1moVXviB76yBKr/WR4xJNuHMJFAXkOfHPVDinZrNE65BmYku/KXBpi9QvELxJqF99ilttgQr8/LA3dqTX82zhSHtnOWv+DNS9XkuDCcpDkpZWvg005+gcgwS3W3RSl5ZdRsCgYEApKux9VaoK5zekF8CKZtpuiwpPh5Q/GzMuhSyFyKMQtnKWAquyg0zU5a48uRwb/LUpWYNefejIezNW5um7nh3DhFmlCUvxjZXKeT1NwR188CeUvUsynMQM7WB0DLr8I20lF3C+l+8JH40GeTEvApYH2WJBE1nwCbMwlxBBJ0ToXo=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAplYWddBoYOA2krJOjod/dh4Q3LSRR+yQaTrx6/bhYer4X7+2QWGmS5ljd1GFtfYZw3lXicVSsFhiOnsr6oIi+1G4yLxINPiF7NWKdCpG/SHCwxkuiCqAXdX64I42eGvojYt72fRDwXfqgaWoMC4Nyg+6eaoJM3B4Vfmt4wCp6fBNtmXjEp8+71lnQVE9rParXoXY2j5YonpAjC4+G4GGX5PI3SpGaf8R1af8yDOQwXKREFZ8YbXbpWZm1BXmHU8wVNftImD7LHTyomfVhrXx9b57eFXLxo8KaH4SzA/AoxgCk89dMkDwecZj4T9u54e1oawUWtVOYmkR1i7lte+m3QIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:80/toOrderItemStatus.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:80/toOrderItemStatus.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关https://openapi.alipaydev.com/gateway.do
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "d:\\";


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
