package iit.csp584.soccerfan.utility;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import iit.csp584.soccerfan.bean.Review;
import org.bson.Document;
import static com.mongodb.client.model.Filters.*;

import java.util.ArrayList;
import java.util.List;

public class MongoDatabaseUtility {
    static MongoCollection<Document> myReviews;

    public static void getConnection() {
        MongoClient mongo;
        mongo = new MongoClient("localhost", 27017);
        MongoDatabase md = mongo.getDatabase("soccerfan");
        myReviews = md.getCollection("myReviews");
    }

    public static String insertReview(String reviewId, String reviewType, String reviewStar, String reviewContent) {
        try {
            getConnection();
            Document doc = new Document("title", "myReviews").
                    append("reviewId", reviewId).
                    append("reviewType", reviewType).
                    append("reviewStar", reviewStar).
                    append("reviewContent", reviewContent).
                    append("reviewUsername", Utilities.getCurrentUser().getUsername()).
                    append("reviewTime", Utilities.getCurrentTime());
            myReviews.insertOne(doc);
            return "Successful";
        } catch (Exception e) {
            return "UnSuccessful";
        }
    }

    public static List<Review> selectReview() {
        ArrayList<Review> reviews = new ArrayList<>();
        try {
            getConnection();
            FindIterable<Document> collections = myReviews.find();
            return getReviews(reviews, collections);
        } catch (Exception e) {
            return null;
        }


    }
    public static List<Review> selectReviewByIdAndType(String id, String type) {
        ArrayList<Review> reviews = new ArrayList<>();
        try {
            getConnection();
            FindIterable<Document> collections = myReviews.find(and(eq("reviewId",id),eq("reviewType",type)));
            return getReviews(reviews, collections);
        } catch (Exception e) {
            return null;
        }


    }

    private static List<Review> getReviews(ArrayList<Review> reviews, FindIterable<Document> collections) {
        MongoCursor<Document> documents = collections.iterator();
        while (documents.hasNext()) {
            Document obj = documents.next();
            System.out.println(obj);
            Review review = new Review(obj.getString("reviewId"), obj.getString("reviewType"), obj.getString("reviewStar"), obj.getString("reviewContent"), obj.getString("reviewUsername"), obj.getString("reviewTime"));
            reviews.add(review);
        }
        return reviews;
    }


}
