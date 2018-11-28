package iit.csp584.soccerfan.dao;

import iit.csp584.soccerfan.bean.Player;
import iit.csp584.soccerfan.bean.Team;
import iit.csp584.soccerfan.utility.GetMySQLConnenction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeamDaoImpl implements TeamDao {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    @Override
    public void add(Team team) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("INSERT INTO team values(?,?,?,?,?) ");
            preparedStatement.setString(1, team.getId());
            preparedStatement.setString(2, team.getName());
            preparedStatement.setString(3, team.getLeague());
            preparedStatement.setString(4, team.getCountry());
            preparedStatement.setString(5, team.getAddress());
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void delete(String s) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("delete from team where id = ? ");
            preparedStatement.setString(1, s);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Team> getAll() {
        List<Team> l = new ArrayList<>();
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from team ");

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String league = resultSet.getString("league");
                String country = resultSet.getString("country");
                String address = resultSet.getString("address");
                Team team = new Team(id, name, league, country, address);
                l.add(team);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    @Override
    public Team getById(String s) {
        Team team = null;
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from team where id = ? ");
            preparedStatement.setString(1, s);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String league = resultSet.getString("league");
                String country = resultSet.getString("country");
                String address = resultSet.getString("address");
                team = new Team(id, name, league, country, address);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return team;
    }
}
