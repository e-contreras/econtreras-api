package py.com.econtreras.api.service;

import java.util.List;
import py.com.econtreras.api.beans.CreditNoteDetail;

public interface CreditNoteDetailService extends GenericService<CreditNoteDetail, CreditNoteDetail, Integer> {

    public List<CreditNoteDetail> findByCreditId(Integer id);

}
