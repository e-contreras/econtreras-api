package py.com.econtreras.api.service;

import py.com.econtreras.api.beans.WorkOrderRequest;
import py.com.econtreras.api.beans.WorkOrderResponse;

import java.util.List;

public interface WorkOrderService {

    List<WorkOrderResponse> findAll();
    WorkOrderResponse findById(Integer id);
    void save(WorkOrderRequest request);

}
