package py.com.econtreras.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan( basePackages = {"py.com.econtreras.api.entity"} )
public class EcontrerasApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(EcontrerasApiApplication.class, args);
	}

}
