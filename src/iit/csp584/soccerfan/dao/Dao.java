package iit.csp584.soccerfan.dao;

import java.util.List;

public interface Dao<T, ID> {
    void add(T t);

    void delete(ID id);

    List<T> getAll();

    T getById(ID id);


}
