package iit.csp584.soccerfan.service;

import iit.csp584.soccerfan.bean.Player;
import iit.csp584.soccerfan.dao.PlayerDaoImpl;

import java.util.List;

public class PlayerServiceImpl implements PlayerService {
    PlayerDaoImpl pdi = new PlayerDaoImpl();

    @Override
    public void add(Player player) {
        pdi.add(player);
    }

    @Override
    public void delete(String s) {
        pdi.delete(s);
    }

    @Override
    public List<Player> getAll() {
        return pdi.getAll();
    }

    @Override
    public Player getById(String s) {
        return pdi.getById(s);
    }
}
