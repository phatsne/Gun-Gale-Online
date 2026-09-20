# Gun-Gale-Online

Roblox game project dùng Luau + Rojo.

## Cấu trúc

```text
Gun-Gale-Online/
├── default.project.json     # Mapping từ file system vào Roblox DataModel
├── src/
│   ├── server/               # Script chạy trên server
│   │   └── Main.server.luau
│   ├── client/               # LocalScript chạy trên client
│   │   └── Main.client.luau
│   └── shared/               # ModuleScript dùng chung
│       └── Config.luau
└── README.md
```

## Cài Rojo trên Windows

1. Cài **Rojo** plugin trong Roblox Studio từ Creator Store: https://create.roblox.com/store/asset/2611598175/Rojo
2. Cài **Rojo CLI** theo một trong hai cách:
	- Dùng Aftman: cài Aftman, mở Terminal tại thư mục project, rồi chạy:

	  ```powershell
	  aftman add rojo-rbx/rojo
	  aftman install
	  ```

	- Hoặc tải bản phát hành Rojo và thêm file `rojo.exe` vào `PATH`.

3. Kiểm tra CLI:

	```powershell
	rojo --version
	```

## Link project vào Roblox Studio

1. Mở Roblox Studio và tạo một **Baseplate** mới.
2. Trong VS Code, mở Terminal tại `C:\Projects\Gun-Gale-Online`.
3. Chạy:

	```powershell
	rojo serve default.project.json
	```

4. Trong Roblox Studio, mở plugin **Rojo** và chọn **Connect**.
5. Chọn server đang chạy, thường là `localhost:34872`.
6. Khi kết nối thành công, cây object trong Studio sẽ được tạo từ `default.project.json`.

Không chỉnh sửa script được Rojo quản lý trực tiếp trong Studio. Hãy sửa file trong VS Code, sau đó Rojo sẽ tự đồng bộ thay đổi.

## Chạy và test

- Nhấn **Play** trong Studio để chạy cả server và client.
- Mở cửa sổ **View > Output**. Bạn sẽ thấy:
  - `[Gun Gale Online] Server started - version 0.1.0`
  - `[Gun Gale Online] Client started - version 0.1.0`
- Khi test multiplayer, dùng **Test > Start** và chọn số lượng player mong muốn.
- Khi dừng test, giữ Terminal Rojo chạy để tiếp tục đồng bộ; nhấn `Ctrl+C` khi muốn ngắt kết nối.

## Quy tắc đặt file Luau

- `*.server.luau`: script chạy trên server.
- `*.client.luau`: LocalScript chạy trên client.
- `*.luau` không có hậu tố server/client: ModuleScript hoặc code dùng chung.
