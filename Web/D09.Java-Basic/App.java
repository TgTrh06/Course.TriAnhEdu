import Demo.Calculator;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a number: ");
        int a = Integer.parseInt(sc.nextLine());
        System.out.println("Enter another number: ");
        int b = Integer.parseInt(sc.nextLine());
        
        int result = Calculator.sum(a, b);
        System.out.println("Sum: " + result); 
    }

    public static int[] addItem(int value, int[] arr) {
        int[] newArr = new int[arr.length + 1];

        for (int i = 0; i < arr.length; i++) {
            newArr[i] = arr[i];
        }

        newArr[arr.length] = 6;
        arr = newArr;

        return arr;
    }
}