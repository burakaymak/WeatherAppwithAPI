# 🌤️ Weather & Map App

📱 **Weather & Map**, kullanıcının mevcut konumunu alarak harita üzerinde gösteren ve aynı zamanda **OpenWeatherMap API** üzerinden anlık hava durumu bilgilerini sunan bir iOS uygulamasıdır.  
Uygulama, kullanıcının konumunu alır, haritada pin ile işaretler ve sıcaklık, hissedilen sıcaklık ve hava durumu açıklamasını ekranda gösterir.  

---

## ✨ Özellikler
- 🗺 Mevcut konumu **MapKit** ile harita üzerinde gösterme  
- 📍 Kullanıcının konumunu **pin** ile işaretleme  
- 🌡️ **OpenWeatherMap API** üzerinden anlık hava durumu bilgilerini çekme  
- 📊 Ekranda:
  - Bulunduğunuz yerin adı  
  - Sıcaklık (`Temperature`)  
  - Hissedilen sıcaklık (`Feels Like`)  
  - Hava durumu açıklaması (`Description`)  
- ⚠️ Hata durumunda kullanıcıya **alert** gösterme  

---

## 📖 Uygulama Akışı
1. Uygulama açıldığında `CLLocationManager` kullanılarak kullanıcının konumu alınır.  
2. Konum bilgisi ile harita merkezlenir ve pin eklenir.  
3. Latitude ve longitude bilgileri kullanılarak **OpenWeatherMap API** çağrısı yapılır.  
4. API’den dönen JSON yanıtı parse edilerek:
   - `locationLabel` → Konum adı  
   - `tempLabel` → Sıcaklık  
   - `feelsLikeLabel` → Hissedilen sıcaklık  
   - `descriptionLabel` → Hava durumu açıklaması  
5. Veriler ekranda güncellenir.  

---

## 🛠 Kullanılan Yapılar
- **UIKit** → Label ve UI elemanları  
- **MapKit** → Harita ve pin ekleme  
- **CoreLocation** → Kullanıcının mevcut konumunu almak  
- **URLSession** → API isteği yapmak  
- **JSONSerialization** → JSON verisini parse etmek  
- **DispatchQueue.main.async** → UI güncellemeleri için ana thread kullanımı  

---

## 🚀 Çalışma Mantığı
- `locationManager(_:didUpdateLocations:)` ile konum güncellemeleri alınır.  
- Konum bilgisi ile harita merkezlenir ve pin eklenir.  
- OpenWeatherMap API çağrısı yapılır ve gelen JSON verisi parse edilir.  
- Parse edilen veriler label’lara atanır ve kullanıcıya gösterilir.  
- Hata durumunda alert gösterilir ve kullanıcı bilgilendirilir.  

---

## 🔧 Uygulamada Kullanılanlar
- `CLLocationManager` ile kullanıcının konumu alındı.
- `MapKit` ile harita ve pin gösterimi uygulandı.
- `URLSession` kullanarak **API çağrısı** yapıldı.
- `JSONSerialization` ile JSON verilerini parse edildi.
- **DispatchQueue.main.async** kullanarak UI güncellemelerini güvenli şekilde yapıldı.
- Hata durumlarını `UIAlertController` ile kullanıcıya bildirildi.
