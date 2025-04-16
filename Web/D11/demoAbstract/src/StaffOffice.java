package src;

public class StaffOffice extends Staff {
    private final String _role;

    @Override
    public double getSalary() {
        if (_role.equals("admin")) {
            return 30000;
        }

        return 10000;
    }
}