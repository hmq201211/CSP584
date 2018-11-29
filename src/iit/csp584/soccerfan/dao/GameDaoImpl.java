package iit.csp584.soccerfan.dao;

import iit.csp584.soccerfan.bean.Accessory;
import iit.csp584.soccerfan.bean.Game;
import iit.csp584.soccerfan.utility.GetMySQLConnenction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class GameDaoImpl implements GameDao {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    @Override
    public void add(Game game) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("INSERT INTO game values(?,?,?,?,?,?,?) ");
            preparedStatement.setInt(1, game.getId());
            preparedStatement.setString(2, game.getLeague());
            preparedStatement.setString(3, game.getTime());
            preparedStatement.setString(4, game.getHome_team());
            preparedStatement.setString(5, game.getScore());
            preparedStatement.setString(6, game.getGuest_team());
            preparedStatement.setString(7, game.getAddress());
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void delete(Integer integer) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("delete from game where id = ? ");
            preparedStatement.setInt(1, integer);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("delete from game_accessory where gid = ? ");
            preparedStatement.setInt(1, integer);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Game> getAll() {
        List<Game> l = new ArrayList<>();
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from game ");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String league = resultSet.getString("league");
                String time = resultSet.getString("time");
                String home_team = resultSet.getString("home_team");
                String score = resultSet.getString("score");
                String guest_team = resultSet.getString("guest_team");
                String address = resultSet.getString("address");
                Game game = new Game(id, league, time, home_team, score, guest_team, address);
                l.add(game);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    @Override
    public Game getById(Integer integer) {
        Game game = null;
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from game where id  = ?  ");
            preparedStatement.setInt(1,integer);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String league = resultSet.getString("league");
                String time = resultSet.getString("time");
                String home_team = resultSet.getString("home_team");
                String score = resultSet.getString("score");
                String guest_team = resultSet.getString("guest_team");
                String address = resultSet.getString("address");
                game = new Game(id, league, time, home_team, score, guest_team, address);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return game;
    }

    public List<Game> getByLeague(String s) {
        List<Game> l = new ArrayList<>();
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from game where league = ? ");
            preparedStatement.setString(1, s);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String league = resultSet.getString("league");
                String time = resultSet.getString("time");
                String home_team = resultSet.getString("home_team");
                String score = resultSet.getString("score");
                String guest_team = resultSet.getString("guest_team");
                String address = resultSet.getString("address");
                Game game = new Game(id, league, time, home_team, score, guest_team, address);
                l.add(game);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
}
