package com.math.util;



public class MyNotePageMaker {
	
	public void pageMaker(int totalCount, MyNoteListData myNoteListData){
		//1.totalCount
		//2.totalPage
		int totalPage=0;
		if(totalCount%myNoteListData.getPerPage()==0){
			totalPage=totalCount/myNoteListData.getPerPage();
		}else {
			totalPage=totalCount/myNoteListData.getPerPage()+1;
		}
		//3.totalBlock
		int totalBlock=0;
		int perBlock=5;
		if(totalPage%perBlock==0){
			totalBlock=totalPage/perBlock;
		}else {
			totalBlock=totalPage/perBlock+1;
		}
		
		//4.curBlock-curPage이용 
		int curBlock=0;
		if(myNoteListData.getCurPage()%perBlock==0){
			curBlock=myNoteListData.getCurPage()/perBlock;
		}else {
			curBlock=myNoteListData.getCurPage()/perBlock+1;
		}
		//5.startNum, lastNum
		int startNum=(curBlock-1)*perBlock+1;
		int lastNum = curBlock*perBlock;
		
		//6.
		if(curBlock==totalBlock){
			lastNum=totalPage;
		}
		
		myNoteListData.setStartNum(startNum);
		myNoteListData.setLastNum(lastNum);
		myNoteListData.setCurBlock(curBlock);
		myNoteListData.setTotalBlock(totalBlock);
		
		
	}

}
