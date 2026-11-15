package vn.iotstar.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Video;

public class Test {
    public static void main(String[] args) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();

        // 1. Khởi tạo một đối tượng Category mẫu
        Category cate = new Category();
        cate.setCategoryname("Iphone");
        cate.setImages("abc.jpg");
        cate.setStatus(1);

        // 2. Khởi tạo một đối tượng Video mẫu gán vào Category trên
        Video video = new Video();
        video.setVideoId("v01");
        video.setTitle("Review Iphone 16 Pro");
        video.setCategory(cate);

        try {
            trans.begin();
            enma.persist(cate);   // Thêm Category vào CSDL
            enma.persist(video);  // Thêm Video vào CSDL
            trans.commit();
            System.out.println("===============================================");
            System.out.println("CHÚC MỪNG: KẾT NỐI VÀ TẠO BẢNG JPA THÀNH CÔNG!");
            System.out.println("===============================================");
        } catch (Exception e) {
            e.printStackTrace();
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            enma.close();
        }
    }
}