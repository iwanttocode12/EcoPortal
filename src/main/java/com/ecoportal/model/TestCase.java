package com.ecoportal.model;

public class TestCase {
	
	private int tcid;
	private String testcase;
	private String exResults;
	private String status;
	private String comment;
	
	public int getTcid() {
		return tcid;
	}
	public void setTcid(int tcid) {
		this.tcid = tcid;
	}
	public String getTestcase() {
		return testcase;
	}
	public void setTestcase(String testcase) {
		this.testcase = testcase;
	}
	public String getExResults() {
		return exResults;
	}
	public void setExResults(String exResults) {
		this.exResults = exResults;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "TestCase [tcid=" + tcid + ", testcase=" + testcase + ", exResults=" + exResults + ", status=" + status
				+ ", comment=" + comment + "]";
	}


}
