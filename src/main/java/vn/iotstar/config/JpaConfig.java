package vn.iotstar.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaConfig {
    // Tạo và trả về EntityManager để thực hiện các thao tác thêm, sửa, xóa, truy vấn
    public static EntityManager getEntityManager() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("jpa-hibernate-mysql");
        return factory.createEntityManager();
    }
}