package simple.container;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class AppTest {

    @Test
    public void shouldSayHello() {
        Assertions.assertEquals("Hello, world!", new App().hello());
    }
}