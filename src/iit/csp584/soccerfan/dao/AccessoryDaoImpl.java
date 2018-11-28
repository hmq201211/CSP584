package iit.csp584.soccerfan.dao;

import iit.csp584.soccerfan.bean.Accessory;
import iit.csp584.soccerfan.bean.Team;
import iit.csp584.soccerfan.utility.GetMySQLConnenction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AccessoryDaoImpl implements AccessoryDao {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    @Override
    public void add(Accessory accessory) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("INSERT INTO accessory values(?,?,?,?,?) ");
            preparedStatement.setString(1, accessory.getId());
            preparedStatement.setString(2, accessory.getName());
            preparedStatement.setDouble(3, accessory.getPrice());
            preparedStatement.setString(4, accessory.getMaker());
            preparedStatement.setDouble(5, accessory.getDiscount());
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
            preparedStatement = connection.prepareStatement("delete from accessory where id = ? ");
            preparedStatement.setString(1, s);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("delete from game_accessory where aid = ? ");
            preparedStatement.setString(1, s);
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Accessory> getAll() {
        List<Accessory> l = new ArrayList<>();
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from accessory ");

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                String maker = resultSet.getString("maker");
                Double discount = resultSet.getDouble("discount");
                Accessory accessory = new Accessory(id, name, price, maker, discount);
                l.add(accessory);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    @Override
    public Accessory getById(String s) {
        Accessory accessory = null;
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from accessory where id = ? ");
            preparedStatement.setString(1, s);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                String maker = resultSet.getString("maker");
                Double discount = resultSet.getDouble("discount");
                accessory = new Accessory(id, name, price, maker, discount);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accessory;
    }
    public List<Accessory> getByMaker(String s) {
        List<Accessory> l = new ArrayList<>();
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from accessory where maker = ? ");
            preparedStatement.setString(1, s);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                String maker = resultSet.getString("maker");
                Double discount = resultSet.getDouble("discount");
                Accessory accessory = new Accessory(id, name, price, maker, discount);
                l.add(accessory);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
}
