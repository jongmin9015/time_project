package com.tis.mapper;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.domain.OrderVO;
import com.tis.domain.PayVO;
import com.tis.service.GoodsService;
import com.tis.service.OrderService;
import com.tis.service.PayService;

import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PayMapperTests {
	
	@Autowired
	private PayService payService;
	@Autowired
	private PayMapper mapper;

	@Autowired
	private OrderService orderService;
	
//	@Test
//	public void getNo() {
//		goodsMapper.getGoodsDetail(101L);
//	}
	

//	@Test
//	public void test() {
//	
//		PayVO pay = new PayVO();
//		pay.setAddress("dsdsd");
//		pay.setAddressSub("dsds");
//		pay.setDeliveryLocation("dsdsd");
//		pay.setDeliveryMessage("dsdsd");
//		pay.setDeliveryPhone("dsdsd");
//		pay.setDeliveryName("2332");
//		pay.setMemberId("2323");
//		pay.setOrderEmail("dsdsd");
//		pay.setOrderGoodsName("dsdsd");
//		pay.setOrderPhone("dsdsd");
//		pay.setOrderName("232");
//		pay.setTotalPrice(23232L);
//		pay.setZipcode("2323");
//		pay.setEntrancePw("2323");
//		pay.setEtcLocation("2323");	
//		
//		
//	}
	

	@Test
	public void getNo() {
		
		String api_key = "NCSLMXFBVTNKUTGR";
	    String api_secret = "NUZHTUVBIHLQ3GB8HCCZS8R5Z4JVUULF";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "01049533653");
	    params.put("from", "01049533653");
	    params.put("type", "SMS");
	    params.put("text", "테스트");
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
