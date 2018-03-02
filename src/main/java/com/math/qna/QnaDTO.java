package com.math.qna;

import com.math.board.BoardDTO;

public class QnaDTO extends BoardDTO {
	
	private int ref;
	private int step;
	private int s_re;
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getS_re() {
		return s_re;
	}
	public void setS_re(int s_re) {
		this.s_re = s_re;
	}
	
	

}
