package com.math.member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {

  PasswordAuthentication pa;
  
  public MyAuthentication(){ // 사용하고자 하는 메일서버에서
                             // 인증받은 계정,비번
	pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com","soldesk6901");
        
    
  }
  
  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return pa;
  }
  
}
