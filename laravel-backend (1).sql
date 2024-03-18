-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Mar 2024 pada 06.49
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-backend`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_customer` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `addres` varchar(255) NOT NULL,
  `telp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `kode_customer`, `nama`, `addres`, `telp`, `created_at`, `updated_at`) VALUES
(1, 'C001', 'Angga Saputra', 'Jakarta Selatan', 83142322, '2024-03-18 05:02:58', NULL),
(2, 'C002', 'Bunga Citra', 'bekasi', 21923200, NULL, NULL),
(3, 'C003', 'Mitra Septiyani', 'Bandung', 85689921, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keuntungans`
--

CREATE TABLE `keuntungans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `marketing_id` varchar(255) NOT NULL,
  `bulan` date NOT NULL,
  `omzet` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keuntungans`
--

INSERT INTO `keuntungans` (`id`, `marketing_id`, `bulan`, `omzet`, `created_at`, `updated_at`) VALUES
(1, '1', '2023-05-03', 138000000, NULL, NULL),
(2, '2', '2023-05-05', 80000000, NULL, NULL),
(3, '3', '2023-05-05', 44320000, NULL, NULL),
(4, '1', '2023-06-08', 75000000, NULL, NULL),
(5, '2', '2023-06-08', 1010020000, NULL, NULL),
(6, '3', '2023-06-08', 138000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `marketinggs`
--

CREATE TABLE `marketinggs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `marketinggs`
--

INSERT INTO `marketinggs` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Alfandy', '2024-03-06 11:18:42', '2024-03-06 11:18:42'),
(2, 'Mery', NULL, NULL),
(3, 'Danang', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_06_110536_create_marketinggs_table', 1),
(6, '2024_03_06_110547_create_penjualanns_table', 2),
(16, '2024_03_06_131055_create_keuntungans_table', 3),
(17, '2024_03_06_135921_create_pembayarans_table', 4),
(18, '2024_03_06_175413_drop_tabel_pembayarans', 4),
(19, '2024_03_18_043343_create_customers_table', 5),
(20, '2024_03_18_043642_create_produks_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penjualan_id` bigint(20) UNSIGNED NOT NULL,
  `marketing_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `status` enum('Belum Lunas','Lunas') NOT NULL DEFAULT 'Belum Lunas',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembayarans`
--

INSERT INTO `pembayarans` (`id`, `penjualan_id`, `marketing_id`, `jumlah`, `tanggal_jatuh_tempo`, `status`, `created_at`, `updated_at`) VALUES
(15, 1, 1, 30000000, '2023-06-25', 'Lunas', '2024-03-06 12:14:25', '2024-03-06 12:14:25'),
(16, 2, 3, 320000, '2023-06-25', 'Belum Lunas', '2024-03-06 12:15:26', '2024-03-06 12:15:26'),
(17, 3, 1, 65000000, '2023-06-25', 'Belum Lunas', '2024-03-06 12:16:02', '2024-03-06 12:16:02'),
(18, 3, 1, 65000000, '2023-06-25', 'Lunas', '2024-03-17 22:16:15', '2024-03-17 22:16:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualanns`
--

CREATE TABLE `penjualanns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_number` varchar(255) NOT NULL,
  `marketing_id` int(20) NOT NULL,
  `date` date NOT NULL,
  `cargo_fee` int(20) NOT NULL,
  `total` int(30) NOT NULL,
  `total_semua` int(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penjualanns`
--

INSERT INTO `penjualanns` (`id`, `transaction_number`, `marketing_id`, `date`, `cargo_fee`, `total`, `total_semua`, `created_at`, `updated_at`) VALUES
(1, 'TRX001', 1, '2023-05-22', 25000, 3000000, 3025000, NULL, NULL),
(2, 'TRX002', 3, '2023-05-22', 25000, 320000, 345000, NULL, NULL),
(3, 'TRX003', 1, '2023-05-22', 0, 65000000, 65000000, NULL, NULL),
(4, 'TRX004', 1, '2023-05-23', 10000, 70000000, 70010000, NULL, NULL),
(5, 'TRX012', 3, '2023-06-01', 0, 130000000, 130000000, NULL, NULL),
(6, 'TRX005', 2, '2023-05-23', 10000, 80000000, 80010000, NULL, NULL),
(7, 'TRX006', 3, '2023-05-23', 12000, 44000000, 44012000, NULL, NULL),
(8, 'TRX007', 1, '2023-06-01', 0, 75000000, 75000000, NULL, NULL),
(9, 'TRX008', 2, '2023-06-02', 0, 85000000, 85000000, NULL, NULL),
(10, 'TRX009', 2, '2023-06-01', 0, 175000000, 175000000, NULL, NULL),
(11, 'TRX010', 3, '2023-06-01', 0, 75000000, 75000000, NULL, NULL),
(12, 'TRX011', 2, '2023-06-01', 0, 750020000, 750020000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produks`
--

INSERT INTO `produks` (`id`, `kode_produk`, `nama_produk`, `jumlah`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'P001', 'sepatu', 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `transaksi_kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `keuntungans`
--
ALTER TABLE `keuntungans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `marketinggs`
--
ALTER TABLE `marketinggs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayarans_penjualan_id_foreign` (`penjualan_id`),
  ADD KEY `pembayarans_marketing_id_foreign` (`marketing_id`);

--
-- Indeks untuk tabel `penjualanns`
--
ALTER TABLE `penjualanns`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksis_customer_id_foreign` (`customer_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keuntungans`
--
ALTER TABLE `keuntungans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `marketinggs`
--
ALTER TABLE `marketinggs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `penjualanns`
--
ALTER TABLE `penjualanns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD CONSTRAINT `pembayarans_marketing_id_foreign` FOREIGN KEY (`marketing_id`) REFERENCES `marketinggs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayarans_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualanns` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD CONSTRAINT `transaksis_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
