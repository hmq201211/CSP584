package iit.csp584.soccerfan.service;

import iit.csp584.soccerfan.bean.Game;
import iit.csp584.soccerfan.dao.GameDaoImpl;

import java.util.List;

public class GameServiceImpl implements GameService {
    private GameDaoImpl gdi = new GameDaoImpl();

    @Override
    public void add(Game game) {
        gdi.add(game);
    }

    @Override
    public void delete(String s) {
        gdi.delete(s);
    }

    @Override
    public List<Game> getAll() {
        return gdi.getAll();
    }

    @Override
    public Game getById(String s) {
        return gdi.getById(s);
    }

    public List<Game> getByLeague(String  s) {
        return gdi.getByLeague(s);
    }
}
