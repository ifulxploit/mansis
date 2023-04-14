-- deklarasi variabel
local inventaris = {}
local daftar_produk = {
   {id=1, nama="Buku", harga=5000},
   {id=2, nama="Pensil", harga=1000},
   {id=3, nama="Bolpoin", harga=2000},
}

-- fungsi untuk menambah produk ke inventaris
function tambah_produk(id, jumlah)
   for i=1, #daftar_produk do
      if daftar_produk[i].id == id then
         if inventaris[id] == nil then
            inventaris[id] = jumlah
         else
            inventaris[id] = inventaris[id] + jumlah
         end
         print("Produk '"..daftar_produk[i].nama.."' sebanyak "..jumlah.." berhasil ditambahkan ke inventaris.")
      end
   end
end

-- fungsi untuk menghapus produk dari inventaris
function hapus_produk(id, jumlah)
   if inventaris[id] == nil then
      print("Produk dengan ID "..id.." tidak ditemukan di inventaris.")
   elseif inventaris[id] < jumlah then
      print("Stok produk dengan ID "..id.." tidak mencukupi.")
   else
      inventaris[id] = inventaris[id] - jumlah
      print("Produk dengan ID "..id.." sebanyak "..jumlah.." berhasil dihapus dari inventaris.")
   end
end

-- fungsi untuk menampilkan daftar produk
function tampilkan_produk()
   for i=1, #daftar_produk do
      print(daftar_produk[i].id..". "..daftar_produk[i].nama.." (Rp "..daftar_produk[i].harga..")")
   end
end

-- fungsi untuk menghitung total harga belanjaan
function hitung_total_belanjaan(belanjaan)
   local total = 0
   for id, jumlah in pairs(belanjaan) do
      for i=1, #daftar_produk do
         if daftar_produk[i].id == id then
            total = total + (daftar_produk[i].harga * jumlah)
         end
      end
   end
   return total
end

-- fungsi untuk memproses pesanan
function proses_pesanan(belanjaan, pembayaran)
   local total_belanjaan = hitung_total_belanjaan(belanjaan)
   if total_belanjaan > pembayaran then
      print("Pembayaran tidak mencukupi. Total belanjaan adalah Rp "..total_belanjaan..".")
   else
      for id, jumlah in pairs(belanjaan) do
         hapus_produk(id, jumlah)
      end
      print("Pesanan berhasil diproses. Kembalian anda adalah Rp "..(pembayaran - total_belanjaan)..".")
   end
end

-- banner
print("===============================================")
print("       SELAMAT DATANG DI PROGRAM PENJUALAN     ")
print("              Author : ifulxploit              ")
print("===============================================")

-- contoh penggunaan program
tampilkan_produk()
tambah_produk(1, 5)
tambah_produk(2, 10)
tampilkan_produk()
local belanjaan = {1=2, 2=5}
local pembayaran = 30000
proses_pesanan(belanjaan, pembayaran)
