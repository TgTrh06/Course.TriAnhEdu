package src;

public class User {
    public String _name;
    public String _birthday;
    public String _email;

    public User() {}
    public User(String name,
                String birthday,
                String email) {
        this._name = name;
        this._birthday = birthday;
        this._email = email;
    }

    public String getInfo() {
        return "User: " + this._name + ", Birthday: " + this._birthday +", Email: " + this._email;
    }

    public void setName(String newName) {
        this._name = newName;
    }
}
