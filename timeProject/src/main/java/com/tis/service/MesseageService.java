package com.tis.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MesseageService {
	
  public void sendMessage(String phoneNumber, String numStr) {
    String api_key = "NCSLMXFBVTNKUTGR";
    String api_secret = "NUZHTUVBIHLQ3GB8HCCZS8R5Z4JVUULF";
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", phoneNumber);
    params.put("from", "01049533653");
    params.put("type", "SMS");
    params.put("text", "[TimeShop]인증번호 " + numStr + "을 입력해주세요");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
}