package iit.csp584.soccerfan.utility;

import iit.csp584.soccerfan.bean.Accessory;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


public class AjaxUtility {
    StringBuffer sb = new StringBuffer();
    boolean namesAdded = false;
    static Connection conn = null;
    static String message;

    public static String getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/soccerfan", "root", "root");
            message = "Successfull";
            return message;
        } catch (SQLException e) {
            message = "unsuccessful";
            return message;
        } catch (Exception e) {
            message = "unsuccessful";
            return message;
        }
    }

    public StringBuffer readdata(String searchId) {
        ArrayList<Accessory> data;
        data = getData(searchId);

        Iterator it = data.iterator();
        while (it.hasNext()) {
            Accessory pi = (Accessory) it.next();
            if (pi != null) {

                if (pi.getName().toLowerCase().startsWith(searchId)) {
                    sb.append("<product>");
                    sb.append("<id>" + pi.getId() + "</id>");
                    sb.append("<productName>" + pi.getName() + "</productName>");
                    sb.append("</product>");
                }
            }
        }

        return sb;
    }

    public static ArrayList<Accessory> getData(String searchId) {
        ArrayList<Accessory> hm = new ArrayList<>();
        try {
            getConnection();

            String selectproduct = "select * from  accessory";
            PreparedStatement pst = conn.prepareStatement(selectproduct);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Accessory p = new Accessory(rs.getString("id"), rs.getString("name"), rs.getDouble("price"), rs.getString("maker"), rs.getDouble("discount"));

                    hm.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hm;
    }

}
