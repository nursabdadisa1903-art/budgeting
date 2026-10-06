# Daily Budgeting (Kuliah · Jajan · Kerja)

Web budgeting 3 halaman. Hosting di GitHub Pages, data disimpan di Supabase (gratis), jadi sama di semua perangkat.

Isi folder: `index.html` (aplikasi), `supabase-setup.sql` (tabel + keamanan), `README.md` (panduan ini).

## 1. Buat project Supabase
1. Daftar di https://supabase.com lalu **New project** (nama bebas, pilih region terdekat, catat password database).
2. Tunggu project selesai dibuat.

## 2. Buat tabel
1. Menu **SQL Editor** → **New query**.
2. Salin seluruh isi `supabase-setup.sql`, tempel, klik **Run**. Harus muncul "Success".

## 3. Ambil URL dan kunci
1. Menu **Project Settings → API** (atau **API Keys**).
2. Salin **Project URL** dan kunci **anon / publishable**. Kunci ini memang aman dipublikasikan karena data dilindungi aturan RLS dari langkah 2.
3. **Jangan pernah** memakai kunci `service_role` / secret di `index.html`.

## 4. Isi konfigurasi
Buka `index.html`, cari baris ini dan ganti isinya:
```js
const SUPABASE_URL="https://YOUR-PROJECT.supabase.co", SUPABASE_ANON_KEY="YOUR-ANON-KEY";
```

## 5. Upload ke GitHub
1. Di GitHub: **New repository** (mis. `daily-budgeting`), Public.
2. **Add file → Upload files**, upload `index.html`, `README.md`, `supabase-setup.sql`, lalu **Commit**.
3. **Settings → Pages** → Source: **Deploy from a branch** → Branch: `main`, folder `/ (root)` → **Save**.
4. Tunggu 1-2 menit. Alamatnya: `https://USERNAME.github.io/daily-budgeting/`

## 6. Atur login di Supabase
1. **Authentication → URL Configuration**: isi **Site URL** dengan alamat GitHub Pages dari langkah 5.
2. **Authentication → Sign In / Providers → Email**: untuk pemakaian pribadi, boleh matikan **Confirm email** supaya bisa langsung masuk. Kalau dibiarkan aktif, klik link konfirmasi di email dulu setelah daftar.

## 7. Daftar lalu kunci pendaftaran
1. Buka alamat situsmu, klik **Daftar akun baru** dengan emailmu, lalu **Masuk**.
2. Setelah akunmu jadi, matikan pendaftaran baru: **Authentication → Sign In / Providers → matikan "Allow new users to sign up"**. Dengan begitu orang lain tidak bisa membuat akun di situsmu.

## Catatan
- Project Supabase gratis bisa **dijeda otomatis** kalau tidak dipakai sekitar 1 minggu. Kalau situs error, buka dashboard Supabase dan klik **Restore**. Datanya tidak hilang.
- Kategori, warna, dan daftar pilihan ada di konstanta awal `<script>` di `index.html`.
- Ekspor CSV ada di tiap tab (per budget). Untuk cadangan penuh, ekspor tiap budget sesekali.
- Data contoh di tab Jajan hanya muncul untuk akun baru; hapus lewat "Kosongkan semua".
