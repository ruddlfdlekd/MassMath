package com.math.data;

public class ProblemDTO {
	
	private int pnum;
	private String contents;
	private String chapter;
	private String chapter_m;
	private String chapter_s;
	private String type;
	private String answerlist;
	private int rightCount;
	private int count;
	private int answer;
	private String commentary;
	private double percentage;
	private String id;
	private int my_answer;
	private String book;
	private String rate;
	private int test;
	private String reason;


	

	
	
	
	
	
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getTest() {
		return test;
	}
	public void setTest(int test) {
		this.test = test;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMy_answer() {
		return my_answer;
	}
	public void setMy_answer(int my_answer) {
		this.my_answer = my_answer;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public double getRightCount() {
		return rightCount;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		if(Double.isNaN(percentage)){
			percentage = 0;
		}
		this.percentage = percentage;
	}
	public void setRightCount(int rightCount) {
		this.rightCount = rightCount;
	}
	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getChapter_m() {
		return chapter_m;
	}
	public void setChapter_m(String chapter_m) {
		this.chapter_m = chapter_m;
	}
	public String getChapter_s() {
		return chapter_s;
	}
	public void setChapter_s(String chapter_s) {
		this.chapter_s = chapter_s;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAnswerlist() {
		return answerlist;
	}
	public void setAnswerlist(String answerlist) {
		this.answerlist = answerlist;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getCommentary() {
		return commentary;
	}
	public void setCommentary(String commentary) {
		this.commentary = commentary;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	
	

}
