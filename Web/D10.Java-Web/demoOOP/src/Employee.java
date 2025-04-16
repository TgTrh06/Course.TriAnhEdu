package src;

public class Employee extends User{
    public String _address;
    public String _phone;

    public Employee() {}
    public Employee(String name, String birthday, String email, String _address, String _phone) {
        super(name, birthday, email);
        this._address = _address;
        this._phone = _phone;
    }
}
