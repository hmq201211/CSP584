package iit.csp584.soccerfan.service;

import java.util.List;

public interface Service<T, ID> {
    void add(T t);

    void delete(ID id);

    List<T> getAll();

    T getById(ID id);

}
