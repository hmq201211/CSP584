package iit.csp584.soccerfan.test;

import iit.csp584.soccerfan.bean.Game;
import iit.csp584.soccerfan.bean.User;
import iit.csp584.soccerfan.dao.GameDaoImpl;
import iit.csp584.soccerfan.dao.UserDaoImpl;
import iit.csp584.soccerfan.utility.MongoDatabaseUtility;
import iit.csp584.soccerfan.utility.Utilities;

import java.sql.Date;
import java.sql.Timestamp;

public class test {
    public static void main(String[] args) {
        System.out.println( MongoDatabaseUtility .insertReview("1","player","3","4"));
    }
}
