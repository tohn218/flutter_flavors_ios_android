# firebase_flavors

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

Để build APK flavor pro run
```
flutter build apk --flavor pro -t lib/main_pro.dart 
```

Để build APK flavor dev run
```
flutter build apk --flavor dev -t lib/main_dev.dart 
```

Để build aab flavor dev run
```
flutter build appbundle --flavor dev -t lib/main_dev.dart 
```

Để build aab flavor pro run
```
flutter build appbundle --flavor pro -t lib/main_pro.dart 
```

## Config flavors android

Chỉ cần tạo thư mục dev và pro trong ``android\app\src`` và paste file `google-services.json` đúng môi trường đã tạo trên
Firebase bỏ vào đúng folder môi trường của đường dẫn ``android\app\src ``là liên kết thành công đến Firebase

Trong ``android\app\build.gradle`` paste đoạn tạo flavors như sau:
```
 flavorDimensions "default"
    productFlavors {
        pro {
            dimension "default"
            applicationId "com.example.pro"
            applicationIdSuffix ""
            resValue "string", "app_name", "App Pro"
        }
        dev {
            dimension "default"
            applicationId "com.example.dev"
            applicationIdSuffix ""
            resValue "string", "app_name", "App Dev"
        }
    }
```
và sửa lại theo môi trường bạn muốn. Lưu ý tên thư mục phải trùng với tên môi trường trong `productFlavors`

## Cách genkey - key store ký với Google play với window
```
keytool -genkey -v -keystore D:\Code_Programmer\upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```