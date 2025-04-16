package src;

public class Circle {
    protected double _radius;
    public static String _color = "red"; //Không thuộc đối tưỡng nữa, muốn truy cập phải thông qua lớp

    public Circle() {}
    public Circle(double _radius) {
        this._radius = _radius;
    }

    public double getCircum() {
        return this._radius * Math.PI * 2;
    }

    public double getArea() {
        return Math.PI * Math.pow(this._radius, 2);
    }

    public String getColor() {
        return Circle._color; //Truy cập thông qua lớp
    }
}
