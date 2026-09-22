# Gun-Gale-Online

Roblox game project dùng Luau + Rojo.

## Cấu trúc thư mục

```text
project/
├── src/                 ← scripts (client/server/shared)
├── assets/              ← .rbxm/.rbxmx files go here
├── default.project.json
├── aftman.toml
├── README.md
```

```text
assets/
├── models/
├── UI/
├── VFX/
```

## Rojo asset setup

### 1. Point Rojo at the whole assets folder

Trong [default.project.json](default.project.json):

```json
{
  "tree": {
    "$className": "DataModel",
    "ReplicatedStorage": {
      "$className": "ReplicatedStorage",
      "Assets": {
        "$path": "assets"
      },
      "Shared": {
        "$path": "src/shared"
      }
    },
    "ServerScriptService": {
      "$className": "ServerScriptService",
      "Server": {
        "$path": "src/server"
      }
    },
    "StarterPlayer": {
      "$className": "StarterPlayer",
      "StarterPlayerScripts": {
        "$className": "StarterPlayerScripts",
        "Client": {
          "$path": "src/client"
        }
      }
    }
  }
}
```

Every `.rbxm` inside `assets/` automatically becomes a child instance in Studio, named after its filename. Add a new file → it just appears, no config edit needed.

### 2. Exporting an asset from Studio into the project

- Right-click instance in Explorer
- Select **Save to File...**
- Save into `assets/`
- To update an existing asset later, overwrite the same filename instead of creating a new one

### 3. Team sync loop

```text
pull latest from Git
   ↓
rojo serve (if not already running, picks up new/changed .rbxm automatically)
   ↓
open Studio, connect to Rojo plugin (localhost:34872)
   ↓
edit asset in Studio
   ↓
Save to File (overwrite same filename)
   ↓
commit + push to Git
```

### 4. Key rules for the team

- One person edits a given `.rbxm` at a time — binary files can't be merged, last push wins.
- Scripts (`.lua`/`.luau`) are safe to edit simultaneously — those get real diffs/merges.
- For live simultaneous building (not code), use Team Create instead — it complements this setup, doesn't replace it.

## Cài đặt và chạy project trên Windows

### 1. Cài Aftman

```powershell
winget install --id LPGhatguy.Aftman -e --accept-source-agreements --accept-package-agreements
```

Sau khi cài xong, đóng mở lại terminal hoặc VS Code.

### 2. Kiểm tra Aftman

```powershell
aftman --version
```

### 3. Cài Rojo theo project

```powershell
cd C:\Projects\Gun-Gale-Online
aftman install
```

### 4. Chạy server sync

```powershell
$env:Path = "$env:USERPROFILE\.aftman\bin;$env:Path"
rojo --version
rojo serve default.project.json
```

Khi server chạy, terminal sẽ hiển thị:

```text
Rojo 7.7.0
Rojo server listening:
  Address: localhost
  Port:    34872
```

### 5. Kết nối trong Roblox Studio

1. Mở Roblox Studio.
2. Cài plugin **Rojo** nếu chưa có.
3. Mở plugin **Rojo**.
4. Chọn **Connect**.
5. Chọn `localhost:34872`.
6. Play thử game.

### 6. Kiểm tra test

Mở Output trong Studio và xem:

```text
[Gun Gale Online] Server started - version 0.1.0
[Gun Gale Online] Client started - version 0.1.0
```

## Quy tắc đặt file Luau

- `*.server.luau`: script chạy trên server.
- `*.client.luau`: LocalScript chạy trên client.
- `*.luau` không có hậu tố server/client: ModuleScript hoặc code dùng chung.

## Lưu ý cho team asset

- File `.rbxm`/`.rbxmx` nên nằm trong `assets/` và không cần khai báo từng file trong JSON.
- File ảnh/âm thanh/animation không tự động sync bằng Rojo; cần import/publish trong Roblox Studio rồi dùng `rbxassetid://...`.
- File code và script nên được quản lý trên Git như bình thường.
- File .gitkeep dùng để giữ thư mục trên git mà kg bị mất