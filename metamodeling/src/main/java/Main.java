import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class Main {
    public static void main(String[] args) throws IOException {
        System.out.println("!");
        String a = "ab\ncd";
        ByteArrayInputStream stream = new ByteArrayInputStream(a.getBytes());
        try (InputStreamReader reader = new InputStreamReader(stream);
             BufferedReader bufferedReader = new BufferedReader(reader)) {
            bufferedReader.lines().forEach(System.out::println);
        }
    }
}
