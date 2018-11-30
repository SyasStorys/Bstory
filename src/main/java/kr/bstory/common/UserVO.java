package kr.bstory.common;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("userVO")
public class UserVO {

	private int bs_userNumber;
	private String bs_userEmail;
	private String bs_userName;
	private String bs_userPassword;
	private String bs_userAddress;
	private int bs_userPhone;
	private int bs_userAccountNumber;
	private Date regDate;
	private char bs_userDeleteflag;
	
	//비밀번호 일치 여부 체크
	public boolean isCheckedPasswd(String userPasswd) {
		if(bs_userPassword.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public char getBs_userDeleteflag() {
		return bs_userDeleteflag;
	}
	public void setBs_userDeleteflag(char bs_userDeleteflag) {
		this.bs_userDeleteflag = bs_userDeleteflag;
	}
	public int getBs_userNumber() {
		return bs_userNumber;
	}
	public void setBs_userNumber(int bs_userNumber) {
		this.bs_userNumber = bs_userNumber;
	}
	public String getBs_userEmail() {
		return bs_userEmail;
	}
	public void setBs_userEmail(String bs_userEmail) {
		this.bs_userEmail = bs_userEmail;
	}
	public String getBs_userName() {
		return bs_userName;
	}
	public void setBs_userName(String bs_userName) {
		this.bs_userName = bs_userName;
	}
	public String getBs_userPassword() {
		return bs_userPassword;
	}
	public void setBs_userPassword(String bs_userPassword) {
		this.bs_userPassword = bs_userPassword;
	}
	public String getBs_userAddress() {
		return bs_userAddress;
	}
	public void setBs_userAddress(String bs_userAddress) {
		this.bs_userAddress = bs_userAddress;
	}
	public int getBs_userPhone() {
		return bs_userPhone;
	}
	public void setBs_userPhone(int bs_userPhone) {
		this.bs_userPhone = bs_userPhone;
	}
	public int getBs_userAccountNumber() {
		return bs_userAccountNumber;
	}
	public void setBs_userAccountNumber(int bs_userAccountNumber) {
		this.bs_userAccountNumber = bs_userAccountNumber;
	}
	@Override
	public String toString() {
		return "LoginVO [bs_userNumber=" + bs_userNumber + ", bs_userEmail=" + bs_userEmail + ", bs_userName="
				+ bs_userName + ", bs_userPassword=" + bs_userPassword + ", bs_userAddress=" + bs_userAddress
				+ ", bs_userPhone=" + bs_userPhone + ", bs_userAccountNumber=" + bs_userAccountNumber + ", regDate="
				+ regDate + ", bs_userDeleteflag=" + bs_userDeleteflag + "]";
	}

	
}
