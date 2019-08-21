package py.com.econtreras.api.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories("py.com.econtreras.api.repository")
@EnableTransactionManagement
@EntityScan(basePackages = { "py.com.econtreras.api.entity" })
public class DatasourceConfig {


}
