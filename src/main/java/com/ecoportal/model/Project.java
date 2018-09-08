package com.ecoportal.model;


public class Project {
	
	private int pid;
	private String pname;
	private int pendstat;
	private int passstat;
	private int failstat;
	private boolean completed;
	private String subdate;
	private String recdate;
	private int daysLeft;
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public int getPendstat() {
		return pendstat;
	}
	public void setPendstat(int pendstat) {
		this.pendstat = pendstat;
	}
	
	public int getPassstat() {
		return passstat;
	}
	public void setPassstat(int passstat) {
		this.passstat = passstat;
	}
	
	public int getFailstat() {
		return failstat;
	}
	public void setFailstat(int failstat) {
		this.failstat = failstat;
	}

	public boolean isCompleted() {
		return completed;
	}
	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
	
	public String getSubdate() {
		return subdate;
	}
	public void setSubdate(String subdate) {
		this.subdate = subdate;
	}
	
	public String getRecdate() {
		return recdate;
	}
	public void setRecdate(String recdate) {
		this.recdate = recdate;
	}
	
	public int getDaysLeft() {
		return daysLeft;
	}
	public void setDaysLeft(int daysLeft) {
		this.daysLeft = daysLeft;
	}
	
	public void clone(String myString) {
		
		String[] variables = myString.split(";;");
		for (int i=0; i<variables.length; i++) {
			String[] unitVar = variables[i].split("=");
			if (unitVar[0].equals("pid")) {
				this.setPid(Integer.parseInt(unitVar[1]));
			} else if (unitVar[0].equals("pname")) {
				this.setPname(unitVar[1]);
			} else if (unitVar[0].equals("pendstat")) {
				this.setPendstat(Integer.parseInt(unitVar[1]));
			} else if (unitVar[0].equals("passstat")) {
				this.setPassstat(Integer.parseInt(unitVar[1]));
			} else if (unitVar[0].equals("failstat")) {
				this.setFailstat(Integer.parseInt(unitVar[1]));
			} else if (unitVar[0].equals("completed")) {
				if(unitVar[1].equals("true")) {
				    this.setCompleted(true);
				} else {
					this.setCompleted(false);
				}
			} else if (unitVar[0].equals("recdate")) {
				this.setRecdate(unitVar[1]);
			} else if (unitVar[0].equals("subdate")) {
				this.setSubdate(unitVar[1]);
			} else if (unitVar[0].equals("daysLeft")) {
				this.setDaysLeft(Integer.parseInt(unitVar[1]));
			}
		}			
	}
	
	@Override
	public String toString() {
		return "pid=" + pid + ";;pname=" + pname + ";;pendstat=" + pendstat + ";;passstat=" + passstat
				+ ";;failstat=" + failstat + ";;completed=" + completed + ";;subdate=" + subdate + ";;recdate="
				+ recdate + ";;daysLeft=" + daysLeft;
	}
	
	
}
	
