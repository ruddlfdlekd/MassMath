package com.math.reply;

import com.math.qna.QnaDTO;

public class ReplyDTO extends QnaDTO {
private int rnum;
private int num;
private String reply_contents;

public int getRnum() {
	return rnum;
}
public void setRnum(int rnum) {
	this.rnum = rnum;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getReply_contents() {
	return reply_contents;
}
public void setReply_contents(String reply_contents) {
	this.reply_contents = reply_contents;
}

}
