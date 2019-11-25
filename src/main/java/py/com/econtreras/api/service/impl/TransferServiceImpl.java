package py.com.econtreras.api.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import py.com.econtreras.api.beans.WorkOrderRequest;
import py.com.econtreras.api.repository.TransferRepository;
import py.com.econtreras.api.repository.WorkOrderRepository;
import py.com.econtreras.api.service.TransferService;
import py.com.econtreras.entity.Solicitude;
import py.com.econtreras.entity.Transfer;
import py.com.econtreras.entity.User;
import py.com.econtreras.entity.Vehicle;
import py.com.econtreras.entity.Warehouse;
import py.com.econtreras.entity.WorkOrder;
import py.com.econtreras.entity.WorkOrderStatus;

@Service
public class TransferServiceImpl implements TransferService {
    
    @Autowired
    private TransferRepository transferRepository;
    
    @Autowired
    private WorkOrderRepository workOrderRepository;

    @Override
    public WorkOrderRequest asignPackage(WorkOrderRequest request) {
        Transfer transfer = new Transfer();

        Warehouse origin = new Warehouse();
        origin.setId(request.getWarehouse());
        
        Vehicle vehicle = new Vehicle();
        vehicle.setId(request.getVehicle());
        
        User driver = new User();
        driver.setId(request.getDriver());
        
        transfer.setOrigin(origin);
        transfer.setVehicle(vehicle);
        transfer.setDriver(driver);
        
        transferRepository.save(transfer);
        
        Solicitude solicitude = new Solicitude();
        solicitude.setId(request.getSolicitude());
        
        WorkOrderStatus workStatus = new WorkOrderStatus();
        workStatus.setId(request.getStatus());
        
        User warehouse = new User();
        warehouse.setId(request.getWareHousePersonal());
        
        WorkOrder workOrder = new WorkOrder();
        workOrder.setAsignation(request.getAsignation());
        workOrder.setCreationDate(request.getCreationDate());
        workOrder.setSolicitude(solicitude);
        workOrder.setTransfer(transfer);
        workOrder.setStatus(workStatus);
        workOrder.setWareHousePersonal(warehouse);
        
        workOrderRepository.save(workOrder);
        
        return request;
    }

}

