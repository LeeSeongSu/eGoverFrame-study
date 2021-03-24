package egovframework.practice.test.domain;

import java.util.Date;

public class UserVO {

	private String username;
	private String userid;
	private String password;
	private Date getnerated_date;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getGetnerated_date() {
		return getnerated_date;
	}

	public void setGetnerated_date(Date getnerated_date) {
		this.getnerated_date = getnerated_date;
	}

}
