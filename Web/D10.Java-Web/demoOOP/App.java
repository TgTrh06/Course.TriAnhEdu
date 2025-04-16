import src.Circle;
import src.Cylinder;
import src.Employee;
import src.Staff;
import src.User;
public class App {
    public static void main(String[] args) {
        User s1 = new Staff("Nhi", "02/03/2003", "nhi@gmail.com", "Level 1");
        User e1 = new Employee("Thanh", "03/02/2002", "nhi@gmail.com", "Ha Noi", "0337675626" );

        Staff s2 = (Staff) s1;
        System.out.println(s2.getRole());

        Circle ci1 = new Circle(4);
        System.out.println(ci1.getCircum());
        System.out.println(ci1.getArea());

        Circle cy1 = new Cylinder(4, 3);
        Cylinder cy2 = (Cylinder) cy1;
        System.out.println(cy2.getVolume());
    }
}
