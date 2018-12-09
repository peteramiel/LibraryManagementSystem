package plm.librarymanagementsystem;

public class User {
    private String userName;
    private String userType;
    private String userNumber;
    private String userProgram;
    private String contactNumber;

    public User(String userName, String userType, String userNumber, String userProgram, String contactNumber) {
        this.userName = userName;
        this.userType = userType;
        this.userNumber = userNumber;
        this.userProgram = userProgram;
        this.contactNumber = contactNumber;
    }

    public User() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }

    public String getUserProgram() {
        return userProgram;
    }

    public void setUserProgram(String userProgram) {
        this.userProgram = userProgram;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }
}
