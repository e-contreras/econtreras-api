package py.com.econtreras.api.service;

import py.com.econtreras.api.beans.WorkOrderRequest;

public interface TransferService {
    public WorkOrderRequest asignPackage(WorkOrderRequest request);
}
