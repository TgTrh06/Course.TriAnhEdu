package src;

public class Staff extends User {
    public String _role;

    public Staff() {
        super();
    }
    public Staff(String name,
                 String birthday,
                 String email,
                 String role) {
        super(name, birthday, email);
        this._role = role;
    }

    @Override
    public String getInfo() {
        return super.getInfo() + ", Role: " + this._role;
    }

    public String getRole() {
        return this._role;
    }
}
