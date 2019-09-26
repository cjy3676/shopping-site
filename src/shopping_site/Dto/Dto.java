package shopping_site.Dto;

public class Dto {
	// 데이터베이스의 테이블 구조랑 동일하게 정의
	private int id;
	private int mem_type;
	private String userid;
	private String pwd;
	private int pwd_qu;
	private String pwd_an;
	private String name;
	private String zip;
	private String addr1;
	private String addr2;
	private String phone;
	private String hphone;
	private String email;
	private int gender;
	private String birth;
	private int chk1;
	private int chk2;
	private int chk3;
	private int chk4;
	private String writeday;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMem_type() {
		return mem_type;
	}
	public void setMem_type(int mem_type) {
		this.mem_type = mem_type;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getPwd_qu() {
		return pwd_qu;
	}
	public void setPwd_qu(int pwd_qu) {
		this.pwd_qu = pwd_qu;
	}
	public String getPwd_an() {
		return pwd_an;
	}
	public void setPwd_an(String pwd_an) {
		this.pwd_an = pwd_an;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getChk1() {
		return chk1;
	}
	public void setChk1(int chk1) {
		this.chk1 = chk1;
	}
	public int getChk2() {
		return chk2;
	}
	public void setChk2(int chk2) {
		this.chk2 = chk2;
	}
	public int getChk3() {
		return chk3;
	}
	public void setChk3(int chk3) {
		this.chk3 = chk3;
	}
	public int getChk4() {
		return chk4;
	}
	public void setChk4(int chk4) {
		this.chk4 = chk4;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	public String atoString() {
		return "Dto [id=" + id + ", mem_type=" + mem_type + ", userid=" + userid + ", pwd=" + pwd + ", pwd_qu=" + pwd_qu
				+ ", pwd_an=" + pwd_an + ", name=" + name + ", zip=" + zip + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", phone=" + phone + ", hphone=" + hphone + ", email=" + email + ", gender=" + gender + ", birth="
				+ birth + ", chk1=" + chk1 + ", chk2=" + chk2 + ", chk3=" + chk3 + ", chk4=" + chk4 + ", writeday="
				+ writeday + "]";
	}
	
	
}
