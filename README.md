# Quizzler

Ứng dụng trắc nghiệm Đúng/Sai với danh sách câu hỏi tiếng Việt.

Dự án Flutter độc lập, dùng Flutter 3.38.6 / Dart 3.10.7.

## Chức năng

- Class Question lưu nội dung và đáp án.
- Chấm điểm, hiển thị biểu tượng đúng/sai trong scoreKeeper.
- Chuyển câu hỏi và tự đặt lại điểm khi hoàn thành lượt chơi.

## Chạy và kiểm tra

```powershell
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run
```

Tài nguyên cần thiết đã có sẵn trong dự án. Đã kiểm tra bằng analyze, unit/widget test.

## Nền tảng chạy

Dự án chỉ giữ nền tảng Android. Mở máy ảo Android, chạy `flutter devices` để kiểm tra kết nối, sau đó chạy `flutter run` và chọn thiết bị Android. Các thư mục nền tảng khác đã được loại bỏ.
