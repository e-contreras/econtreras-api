package py.com.econtreras.api.service.impl;

import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.WorkOrderRequest;
import py.com.econtreras.api.beans.WorkOrderResponse;
import py.com.econtreras.api.repository.WorkOrderRepository;
import py.com.econtreras.api.service.WorkOrderService;

import java.util.List;

@Service
public class WorkOrderServiceImpl implements WorkOrderService {

    private WorkOrderRepository repository;

    @Override
    public List<WorkOrderResponse> findAll() {
        return null;
    }

    @Override
    public WorkOrderResponse findById(Integer id) {
        return null;
    }

    @Override
    public void save(WorkOrderRequest request) {

    }
}
