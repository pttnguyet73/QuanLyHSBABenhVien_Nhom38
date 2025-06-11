Đề tài: Quản lý hồ sơ bệnh án tại bệnh viện
## Hướng dẫn cài đặt thêm sau khi clone về
 1.Cài đặt nuget
  + Tool(Thanh công cụ nằm trên cùng màn hình) -> Nuget Package Manager -> Packages Nuget Manager for solution -> Browser
  + Tìm kiếm và install từng các nullget sau vào project
    - text7.bouncy-castle-adapter\9.2.0
    - microsoft.aspnetcore.http\2.3.0
    - microsoft.entityframeworkcore\8.0.4
    - microsoft.entityframeworkcore.sqlserver\8.0.0
    - newtonsoft.json\13.0.3
    - swashbuckle.aspnetcore\6.4.0
    - system.diagnostics.tools\4.3.0
    - epplus\7.0.5
    - EntityFrameworkCore.design\8.0.5
2. Cấu hình chạy đa project
   - Chuột phải solution → Set Startup Projects
   - Chọn Multiple startup projects
   - Đặt Start cho cả API_HOSOBENHAN và HOSOBENHAN
   - Bấm OK → Nhấn F5 để chạy cả API và Web cùng lúc.
