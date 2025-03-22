package hkmu.comps380f.onlinebookstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication

@ServletComponentScan // filter
public class OnlinebookstoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(OnlinebookstoreApplication.class, args);
    }

}
