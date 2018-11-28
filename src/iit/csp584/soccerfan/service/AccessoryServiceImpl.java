package iit.csp584.soccerfan.service;

import iit.csp584.soccerfan.bean.Accessory;
import iit.csp584.soccerfan.dao.AccessoryDaoImpl;

import java.util.List;

public class AccessoryServiceImpl implements AccessoryService {
    private AccessoryDaoImpl adi = new AccessoryDaoImpl();

    @Override
    public void add(Accessory accessory) {
        adi.add(accessory);
    }

    @Override
    public void delete(String s) {
        adi.delete(s);
    }

    @Override
    public List<Accessory> getAll() {
        return adi.getAll();
    }

    @Override
    public Accessory getById(String s) {
        return adi.getById(s);
    }

    public List<Accessory> getByMaker(String s) {
        return adi.getByMaker(s);
    }

}
