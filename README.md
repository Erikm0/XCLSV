# xclsv
***A new generation clothing brand***

## Használati útmutató
### Asztali alkalmazás
- A futtatás működéséhez szükséges a backend elindítása.
- `xclsvApp` mappán belül található az `.sln` projekt fájl, amit meg lehet nyitni Visual Studio segítségével.
- NuGet packagek:
  - AWSSDK.Core (3.7.402.42)
  - AWSSDK.S3 (3.7.416.11)
  - Microsoft.Maui.Controls (8.0.100)
  - Microsoft.Maui.Controls.Compatibility (8.0.100)
- További információkat a dokumentációban lehet találni:
  - `XCLSV asztali alkalmazás dokumentáció.docx`
### Web (Backend)
- Laravel projekt

- `backend` mappa
- **Telepítés**:
  - `composer install`
  - XAMPP elindítása (Apache & SQL)
  - `php artisan migrate`
  - `XCLSV.sql` fájlt futtatni sql kódként phpmyadmin-ban
- **Futtatás**:
  - (*opcionális*: `php artisan optimize`)
  - `php artisan serve`
  
### Web (Frontend)
- React projekt

- `frontend` mappa
- **Telepítés**:
  - `npm install`
- **Futtatás**:
  - `npm run start`
