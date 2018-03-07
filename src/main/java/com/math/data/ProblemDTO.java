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
	private String book;
	private String chapter_name;
	private String chapter_m_name;
	private String book_name;
	private String type_name;
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getChapter_name() {
		return chapter_name;
	}
	public String getChapter_m_name() {
		return chapter_m_name;
	}
	public void setChapter_m_name(String chapter_m_name) {
		this.chapter_m_name = chapter_m_name;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public void setChapter_name(String chapter_name) {
		this.chapter_name = chapter_name;
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
	
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
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
