package py.com.econtreras.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import py.com.econtreras.api.config.FileStorageProperties;

@SpringBootApplication
@EnableConfigurationProperties({
    FileStorageProperties.class
})	
public class EcontrerasApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(EcontrerasApiApplication.class, args);
	}

}
