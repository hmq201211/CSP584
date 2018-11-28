package iit.csp584.soccerfan.service;

import iit.csp584.soccerfan.bean.Team;
import iit.csp584.soccerfan.dao.TeamDaoImpl;

import java.util.List;

public class TeamServiceImpl implements TeamService {
    private TeamDaoImpl tdi = new TeamDaoImpl();

    @Override
    public void add(Team team) {
        tdi.add(team);
    }

    @Override
    public void delete(String s) {
        tdi.delete(s);
    }

    @Override
    public List<Team> getAll() {
        return tdi.getAll();
    }

    @Override
    public Team getById(String s) {
        return tdi.getById(s);
    }
}
