package simple.container;

public class App {

    public String hello(){
        return "Hello, world!";
    }

    public static void main(String ...args) {
        System.out.println(new App().hello());
    }
}