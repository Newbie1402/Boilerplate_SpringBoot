# 🛠️ Hướng dẫn chạy Backend (Spring Boot)

## 1. Chạy bằng Docker (Khuyến nghị)

### Bước 1: Build project
```bash
  mvn clean package -DskipTests
```

### Bước 2: Build & Run Docker Compose
```bash
  docker-compose up --build -d
```

### Bước 3: Kiểm tra logs (nếu cần)
```bash
  docker-compose logs -f
```

### Bước 4: Dừng dịch vụ
```bash
  docker-compose down
```

---

## 2. Chạy trực tiếp trên máy (Local)

### Bước 1: Cài đặt Java 21 và Maven 3.9+
- Đảm bảo đã cài đặt Java 21 và Maven (kiểm tra bằng `java -version` và `mvn -version`).

### Bước 2: Tạo file cấu hình môi trường
- Tạo file `.env` dựa trên cấu trúc của `.env.example` và điền đầy đủ thông tin.

### Bước 3: Build project
```bash
  mvn clean package -DskipTests
```

### Bước 4: Chạy ứng dụng
```bash
  java -jar target/*.jar
```

---

## 3. Thiết lập IDE (IntelliJ IDEA - Khuyến nghị)

1. Cài plugin **EnvFile** trong IntelliJ IDEA.
2. Copy file `.env` vào thư mục gốc project (`Boilerplate`).
3. Vào **Run → Edit Configurations**.
4. Chọn cấu hình chạy `CodeApplication` → Enable EnvFile.
5. Thêm file `.env` vừa tạo ở folder Backend vào cấu hình.
6. Apply và Run.

---

## 4. Một số lệnh hữu ích

- Build project: `mvn clean package -DskipTests`
- Chạy bằng Docker: `docker-compose up --build -d`
- Dừng Docker: `docker-compose down`
- Xem logs: `docker-compose logs -f`

---

## 5. Lưu ý
- Luôn tạo file `.env` theo mẫu `.env.example` trước khi chạy.
- Nếu thay đổi code, cần build lại project và Docker image.
- Đảm bảo port trong `docker-compose.yml` không bị trùng với ứng dụng khác.

---

## 6. Liên hệ hỗ trợ
- Nếu gặp lỗi, kiểm tra lại logs hoặc liên hệ team backend để được hỗ trợ (Newbie).
