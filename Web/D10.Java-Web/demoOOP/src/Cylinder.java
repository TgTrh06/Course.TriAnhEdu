package src;

public class Cylinder extends Circle {
    protected double _height;

    public Cylinder(double height) {
        this._height = height;
    }

    public Cylinder(double radius, double height) {
        super(radius);
        this._height = height;
    }

    public double getVolume() {
        return this.getArea() * this._height;
    }
}
