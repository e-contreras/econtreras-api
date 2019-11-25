package py.com.econtreras.api.repository;

import org.springframework.data.repository.CrudRepository;
import py.com.econtreras.entity.Transfer;

public interface TransferRepository extends CrudRepository<Transfer, Integer> {}
