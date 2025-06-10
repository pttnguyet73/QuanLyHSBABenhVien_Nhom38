Đề tài: Quản lý hồ sơ bệnh án tại bệnh viện
## Hướng dẫn cài đặt Project
1.Mở Visual Studio
2.Chọn Create a new project
3.Chọn ASP.NET Core Web API
4.Đặt tên "HOSOBENHAN" → Next
5.Ở phần Framework:
Chọn .NET 8.0 (LTS) -> Next
6.Chuột phải vào Solution HOSOBENHAN → Add → New Project
7.Chọn: ASP.NET Core Web API -> Đặt tên: API_HOSOBENHAN
8.Framework: .NET 8 → Bấm Create
9. Cài đặt nuget
+ Tool -> Nuget Package Manager -> Packages Nuget Manager for solution -> Browser
+ Tìm kiếm và install từng các nullget sau vào project
- text7.bouncy-castle-adapter\9.2.0
- microsoft.aspnetcore.http\2.3.0
- microsoft.entityframeworkcore\8.0.4
- microsoft.entityframeworkcore.sqlserver\8.0.0
- newtonsoft.json\13.0.3
- swashbuckle.aspnetcore\6.4.0
- system.diagnostics.tools\4.3.0
10.Trong HOSOBENHAN (Web MVC):
+ Tạo các thư mục cần thiết images ...
+ Tạo thư mục Views → chia thư mục con như NhanVienYTe, Home, ....
+ Tạo các controller MVC tương ứng để gọi API và trả về View:
NhanVienYTeController.cs
HomeController.cs
Timkiem_CongHieuController.cs , ...
11. Trong API_HOSOBENHAN:
+ Tạo thư mục ClassModels → chứa các class (model dữ liệu)
+ Tạo thư mục Controllers → chứa các API controller như:
NhanVienYTeController.cs
ThongKe_ThuNguyetController.cs ,...
12 .Kết nối API từ Web (MVC gọi API)
13. Cấu hình chạy đa project
- Chuột phải solution → Set Startup Projects
- Chọn Multiple startup projects
- Đặt Start cho cả API_HOSOBENHAN và HOSOBENHAN
- Bấm OK → Nhấn F5 để chạy cả API và Web cùng lúc.
