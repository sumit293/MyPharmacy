package pojo;

public class PharId {

	
	static int pid;
	public static int getPid() {
		return pid;
	}
	public static void setPid(int pid) {
		PharId.pid = pid;
	}
	public static String getName() {
		return name;
	}
	public static void setName(String name) {
		PharId.name = name;
	}
	public static String getLocation() {
		return location;
	}
	public static void setLocation(String location) {
		PharId.location = location;
	}
	public static String getContact() {
		return contact;
	}
	public static void setContact(String contact) {
		PharId.contact = contact;
	}
	public static String getEmail() {
		return email;
	}
	public static void setEmail(String email) {
		PharId.email = email;
	}
	public static String getPassword() {
		return password;
	}
	public static void setPassword(String password) {
		PharId.password = password;
	}
	static   String name,location,contact,email,password;
}
