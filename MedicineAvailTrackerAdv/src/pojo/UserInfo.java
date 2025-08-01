package pojo;

public class UserInfo {
static int  uid;

public static int getUid() {
	return uid;
}

public static void setUid(int uid) {
	UserInfo.uid = uid;
}

public static String getUname() {
	return uname;
}

public static void setUname(String uname) {
	UserInfo.uname = uname;
}

public static String getUcontact() {
	return ucontact;
}

public static void setUcontact(String ucontact) {
	UserInfo.ucontact = ucontact;
}

public static String getUadress() {
	return uadress;
}

public static void setUadress(String uadress) {
	UserInfo.uadress = uadress;
}

public static String getUemail() {
	return uemail;
}

public static void setUemail(String uemail) {
	UserInfo.uemail = uemail;
}

public static String getUpassword() {
	return upassword;
}

public static void setUpassword(String upassword) {
	UserInfo.upassword = upassword;
}

static String uname,ucontact,uadress,uemail,upassword;
}
