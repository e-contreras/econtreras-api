package py.com.econtreras.api.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.apache.commons.collections4.IterableUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import py.com.econtreras.api.beans.ProviderRequest;
import py.com.econtreras.api.beans.ProviderResponse;
import py.com.econtreras.api.converter.PersonConverter;
import py.com.econtreras.api.converter.ProviderConverter;
import py.com.econtreras.api.exception.APIException;
import py.com.econtreras.api.messages.ApiMessage;
import py.com.econtreras.api.repository.PersonRepository;
import py.com.econtreras.api.repository.ProviderRepository;
import py.com.econtreras.api.service.ProviderService;

@Service
public class ProviderServiceImpl implements ProviderService {

    @Autowired
    private PersonRepository personRepository;
    @Autowired
    private ProviderRepository repository;
    @Autowired
    private PersonConverter personConverter;
    @Autowired
    private ProviderConverter converter;
    @Autowired
    ApiMessage message;
    private Link[] links;

    private static final Logger LOGGER = LogManager.getLogger(ProviderServiceImpl.class);

    @Override
    public ProviderResponse findById(Integer id) {
        try {
            Optional<py.com.econtreras.entity.Provider> optional = repository.findById(id);
            if (!optional.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                return this.getBean(optional.get());
            }

        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    public List<ProviderResponse> findAll() {
        try {
            Iterable<py.com.econtreras.entity.Provider> entityList = repository.findAll();
            if (IterableUtils.isEmpty(entityList)) {
                throw new APIException(HttpStatus.NO_CONTENT);
            }

            List<ProviderResponse> beans = new ArrayList<>();
            for (py.com.econtreras.entity.Provider entity : entityList) {
                beans.add(this.getBean(entity));
            }
            return beans;
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public ProviderResponse save(ProviderRequest provider) {
        try {
            provider.setPersonId(personConverter.buildBean(personRepository.save(personConverter.buildEntity(provider.getPerson()))).getPersonId());
            return this.getBean(repository.save(converter.buildEntity(provider)));
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public ProviderResponse update(ProviderRequest provider) {
        try {
            Optional<py.com.econtreras.entity.Provider> optionalEntity = repository.findById(provider.getId());
            if (!optionalEntity.isPresent()) {
                throw new APIException(HttpStatus.NO_CONTENT);
            } else {
                provider.setPersonId(personConverter.buildBean(personRepository.save(personConverter.buildEntity(provider.getPerson()))).getPersonId());
                py.com.econtreras.entity.Provider providerAux = converter.buildEntity(provider);
                providerAux.setCreationDate(optionalEntity.get().getCreationDate());
                return this.getBean(repository.save(providerAux));
            }
        } catch (APIException e) {
            throw e;
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new APIException(HttpStatus.INTERNAL_SERVER_ERROR, message.getInternalServerError());
        }
    }

    @Override
    @Transactional
    public Boolean delete(Integer id) {
        Optional<py.com.econtreras.entity.Provider> optionalEntity = repository.findById(id);
        if (!optionalEntity.isPresent()) {
            throw new APIException(HttpStatus.NO_CONTENT);
        } else {
            py.com.econtreras.entity.Provider provider = optionalEntity.get();
            provider.setErased(new Short("1"));
            provider.setDeletedDate(new Date());
            personRepository.save(provider.getPerson());
            return true;
        }
    }

    private ProviderResponse getBean(py.com.econtreras.entity.Provider provider) {
        links = cargarEnlaces(provider);
        if (links == null || links.length == 0) {
            return converter.buildBean(provider);
        } else {
            return converter.buildBean(provider, links);
        }
    }

    private Link[] cargarEnlaces(py.com.econtreras.entity.Provider provider) {
        List<Link> l = new ArrayList<>();
        Link link;
        l.add(new Link("http://localhost:8080/providers/" + provider.getId()).withSelfRel());
//        if (provider.getPerson() != null) {
//            link = new Link("http://localhost:8080/persons/" + provider.getPerson().getId()).withRel("person");
//            l.add(link);
//        }

        Link[] linkArray = new Link[l.size()];
        for (int i = 0; i < l.size(); i++) {
            Link lo = l.get(i);
            linkArray[i] = lo;
        }
        return linkArray;
    }
}
