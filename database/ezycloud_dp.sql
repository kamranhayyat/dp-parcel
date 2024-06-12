-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 20, 2024 at 12:21 AM
-- Server version: 10.6.16-MariaDB-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ezycloud_dp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=Admin, 2=User',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gateway` tinyint(4) DEFAULT NULL,
  `balance` decimal(16,2) NOT NULL DEFAULT 0.00,
  `account_holder_name` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `bank` tinyint(4) DEFAULT NULL,
  `branch_name` varchar(191) DEFAULT NULL,
  `opening_balance` decimal(16,2) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `account_type` tinyint(4) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `type`, `user_id`, `gateway`, `balance`, `account_holder_name`, `account_no`, `bank`, `branch_name`, `opening_balance`, `mobile`, `account_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, 3.00, 'adsfasdf', NULL, NULL, NULL, 3.00, '12345678', 1, 1, '2024-02-12 03:22:03', '2024-02-12 03:22:03'),
(2, 1, 2, 3, 3.00, 'asdfa', NULL, NULL, NULL, 3.00, '1234567', 1, 1, '2024-02-12 03:22:22', '2024-02-12 03:22:22'),
(3, 1, 2, 4, 22.00, 'adfas', NULL, NULL, NULL, 22.00, '12345678', 1, 1, '2024-02-12 03:29:01', '2024-02-12 03:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `account_heads`
--

CREATE TABLE `account_heads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=Income, 2=Expense',
  `name` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_heads`
--

INSERT INTO `account_heads` (`id`, `type`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Payment received from Merchant', 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 1, 'Cash received from delivery man', 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 1, 'Others', 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 2, 'Payment paid to merchant', 0, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 2, 'Commission paid to delivery man', 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 2, 'Others', 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(7, 1, 'Payment receive from hub', 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 1, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user.png\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(2, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 2, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user2.png\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(3, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 3, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user3.png\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(4, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 4, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user4.png\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(5, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 5, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user5.png\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(6, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 6, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user6.png\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(7, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 7, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user7.png\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(8, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"Mirpur-10\",\"phone\":\"01000000001\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(9, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 2, NULL, NULL, '{\"attributes\":{\"name\":\"Uttara\",\"phone\":\"01000000002\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(10, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 3, NULL, NULL, '{\"attributes\":{\"name\":\"Dhanmundi\",\"phone\":\"01000000003\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(11, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 4, NULL, NULL, '{\"attributes\":{\"name\":\"Old Dhaka\",\"phone\":\"01000000004\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(12, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 5, NULL, NULL, '{\"attributes\":{\"name\":\"Jatrabari\",\"phone\":\"01000000005\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(13, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 6, NULL, NULL, '{\"attributes\":{\"name\":\"Badda\",\"phone\":\"01000000006\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(14, 'Department', 'created', 'App\\Models\\Backend\\Department', 'created', 1, NULL, NULL, '{\"attributes\":{\"title\":\"General Management\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(15, 'Department', 'created', 'App\\Models\\Backend\\Department', 'created', 2, NULL, NULL, '{\"attributes\":{\"title\":\"Marketing\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(16, 'Department', 'created', 'App\\Models\\Backend\\Department', 'created', 3, NULL, NULL, '{\"attributes\":{\"title\":\"Operations\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(17, 'Department', 'created', 'App\\Models\\Backend\\Department', 'created', 4, NULL, NULL, '{\"attributes\":{\"title\":\"Finance\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(18, 'Department', 'created', 'App\\Models\\Backend\\Department', 'created', 5, NULL, NULL, '{\"attributes\":{\"title\":\"Sales\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(19, 'Department', 'created', 'App\\Models\\Backend\\Department', 'created', 6, NULL, NULL, '{\"attributes\":{\"title\":\"Human Resource\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(20, 'Department', 'created', 'App\\Models\\Backend\\Department', 'created', 7, NULL, NULL, '{\"attributes\":{\"title\":\"Purchase\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(21, 'Designation', 'created', 'App\\Models\\Backend\\Designation', 'created', 1, NULL, NULL, '{\"attributes\":{\"title\":\"Chief Executive Officer (CEO)\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(22, 'Designation', 'created', 'App\\Models\\Backend\\Designation', 'created', 2, NULL, NULL, '{\"attributes\":{\"title\":\"Chief Operating Officer (COO)\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(23, 'Designation', 'created', 'App\\Models\\Backend\\Designation', 'created', 3, NULL, NULL, '{\"attributes\":{\"title\":\"Chief Financial Officer (CFO)\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(24, 'Designation', 'created', 'App\\Models\\Backend\\Designation', 'created', 4, NULL, NULL, '{\"attributes\":{\"title\":\"Chief Technology Officer (CTO)\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(25, 'Designation', 'created', 'App\\Models\\Backend\\Designation', 'created', 5, NULL, NULL, '{\"attributes\":{\"title\":\"Chief Legal Officer (CLO)\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(26, 'Designation', 'created', 'App\\Models\\Backend\\Designation', 'created', 6, NULL, NULL, '{\"attributes\":{\"title\":\"Chief Marketing Officer (CMO)\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(27, 'Role', 'created', 'App\\Models\\Backend\\Role', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"Super Admin\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_read\",\"user_create\",\"user_update\",\"user_delete\",\"permission_update\",\"merchant_read\",\"merchant_create\",\"merchant_update\",\"merchant_delete\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_delete\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"hub_payment_request_delete\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"database_backup_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_delete\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"payout_setup_settings_update\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"hub_view\",\"paid_invoice_read\",\"invoice_generate_menually\",\"currency_read\",\"currency_create\",\"currency_update\",\"currency_delete\",\"social_link_read\",\"social_link_create\",\"social_link_update\",\"social_link_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"why_courier_read\",\"why_courier_create\",\"why_courier_update\",\"why_courier_delete\",\"faq_read\",\"faq_create\",\"faq_update\",\"faq_delete\",\"partner_read\",\"partner_create\",\"partner_update\",\"partner_delete\",\"blogs_read\",\"blogs_create\",\"blogs_update\",\"blogs_delete\",\"pages_read\",\"pages_update\",\"section_read\",\"section_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(28, 'Role', 'created', 'App\\Models\\Backend\\Role', 'created', 2, NULL, NULL, '{\"attributes\":{\"name\":\"Admin\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_incharge_read\",\"account_read\",\"income_read\",\"expense_read\",\"todo_read\",\"sms_settings_read\",\"sms_send_settings_read\",\"general_settings_read\",\"notification_settings_read\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"account_heads_read\",\"salary_read\",\"support_read\",\"fund_transfer_read\",\"role_read\",\"designation_read\",\"department_read\",\"user_read\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_shop_read\",\"merchant_payment_read\",\"payment_read\",\"hub_payment_request_read\",\"hub_payment_read\",\"parcel_read\",\"delivery_man_read\",\"delivery_category_read\",\"delivery_charge_read\",\"delivery_type_read\",\"liquid_fragile_read\",\"packaging_read\",\"category_read\",\"asset_category_read\",\"news_offer_read\",\"sms_settings_status_change\",\"sms_send_settings_status_change\",\"bank_transaction_read\",\"database_backup_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"assets_read\",\"fraud_read\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"cash_received_from_delivery_man_delete\",\"invoice_read\",\"invoice_status_update\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"hub_view\",\"paid_invoice_read\",\"invoice_generate_menually\",\"currency_read\"]}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(29, 'User', 'created', 'App\\Models\\User', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"WemaxDevs\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(30, 'User', 'created', 'App\\Models\\User', 'created', 2, NULL, NULL, '{\"attributes\":{\"name\":\"Branch\",\"email\":\"branch@wemaxdevs.com\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(31, 'User', 'created', 'App\\Models\\User', 'created', 3, NULL, NULL, '{\"attributes\":{\"name\":\"Delivery Man\",\"email\":\"deliveryman@wemaxit.com\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(32, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 1, NULL, NULL, '{\"attributes\":{\"user.name\":\"Delivery Man\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(33, 'InCharges', 'created', 'App\\Models\\Backend\\HubInCharge', 'created', 1, NULL, NULL, '{\"attributes\":{\"user.name\":\"Branch\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(34, 'Deliverycategory', 'created', 'App\\Models\\Backend\\Deliverycategory', 'created', 1, NULL, NULL, '{\"attributes\":{\"title\":\"KG\",\"description\":null}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(35, 'Deliverycategory', 'created', 'App\\Models\\Backend\\Deliverycategory', 'created', 2, NULL, NULL, '{\"attributes\":{\"title\":\"Mobile\",\"description\":null}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(36, 'Deliverycategory', 'created', 'App\\Models\\Backend\\Deliverycategory', 'created', 3, NULL, NULL, '{\"attributes\":{\"title\":\"Laptop\",\"description\":null}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(37, 'Deliverycategory', 'created', 'App\\Models\\Backend\\Deliverycategory', 'created', 4, NULL, NULL, '{\"attributes\":{\"title\":\"Tabs\",\"description\":null}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(38, 'Deliverycategory', 'created', 'App\\Models\\Backend\\Deliverycategory', 'created', 5, NULL, NULL, '{\"attributes\":{\"title\":\"Gaming Kybord\",\"description\":null}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(39, 'Deliverycategory', 'created', 'App\\Models\\Backend\\Deliverycategory', 'created', 6, NULL, NULL, '{\"attributes\":{\"title\":\"Cosmetices\",\"description\":null}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(40, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 1, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\",\"position\":1}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(41, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 2, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\",\"position\":2}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(42, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 3, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\",\"position\":3}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(43, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 4, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\",\"position\":4}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(44, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 5, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\",\"position\":5}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(45, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 6, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\",\"position\":6}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(46, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 7, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\",\"position\":7}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(47, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 8, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\",\"position\":8}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(48, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 9, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\",\"position\":9}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(49, 'DeliveryCharge', 'created', 'App\\Models\\Backend\\DeliveryCharge', 'created', 10, NULL, NULL, '{\"attributes\":{\"category.name\":null,\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\",\"position\":10}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(50, 'User', 'created', 'App\\Models\\User', 'created', 4, NULL, NULL, '{\"attributes\":{\"name\":\"Merchant\",\"email\":\"merchant@wemaxdevs.com\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(51, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 1, NULL, NULL, '{\"attributes\":{\"user.name\":\"Merchant\",\"business_name\":\"WemaxDevs\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(52, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 1, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(53, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 2, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(54, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 3, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(55, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 4, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(56, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 5, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(57, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 6, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(58, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 7, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(59, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 8, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(60, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 9, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(61, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 10, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(62, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 1, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"name\":\"Shop 1\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(63, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 2, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"name\":\"Shop 2\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(64, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 3, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"name\":\"Shop 3\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(65, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 4, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"name\":\"Shop 4\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(66, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 5, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"name\":\"Shop 5\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(67, 'Config', 'created', 'App\\Models\\Config', 'created', 1, NULL, NULL, '{\"attributes\":{\"key\":\"fragile_liquid_status\",\"value\":\"1\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(68, 'Config', 'created', 'App\\Models\\Config', 'created', 2, NULL, NULL, '{\"attributes\":{\"key\":\"fragile_liquid_charge\",\"value\":\"20\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(69, 'Config', 'created', 'App\\Models\\Config', 'created', 3, NULL, NULL, '{\"attributes\":{\"key\":\"same_day\",\"value\":\"1\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(70, 'Config', 'created', 'App\\Models\\Config', 'created', 4, NULL, NULL, '{\"attributes\":{\"key\":\"next_day\",\"value\":\"1\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(71, 'Config', 'created', 'App\\Models\\Config', 'created', 5, NULL, NULL, '{\"attributes\":{\"key\":\"sub_city\",\"value\":\"1\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(72, 'Config', 'created', 'App\\Models\\Config', 'created', 6, NULL, NULL, '{\"attributes\":{\"key\":\"outside_City\",\"value\":\"1\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(73, 'Packaging', 'created', 'App\\Models\\Backend\\Packaging', 'created', 1, NULL, NULL, '{\"attributes\":{\"name\":\"Poly\",\"price\":\"10.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(74, 'Packaging', 'created', 'App\\Models\\Backend\\Packaging', 'created', 2, NULL, NULL, '{\"attributes\":{\"name\":\"Bubble Poly\",\"price\":\"20.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(75, 'Packaging', 'created', 'App\\Models\\Backend\\Packaging', 'created', 3, NULL, NULL, '{\"attributes\":{\"name\":\"Box\",\"price\":\"30.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(76, 'Packaging', 'created', 'App\\Models\\Backend\\Packaging', 'created', 4, NULL, NULL, '{\"attributes\":{\"name\":\"Box Poly\",\"price\":\"40.00\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(77, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 1, NULL, NULL, '{\"attributes\":{\"key\":\"reve_api_key\",\"value\":\"a7e4166cc9967d80\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(78, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 2, NULL, NULL, '{\"attributes\":{\"key\":\"reve_secret_key\",\"value\":\"e863dd2f\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(79, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 3, NULL, NULL, '{\"attributes\":{\"key\":\"reve_api_url\",\"value\":\"http:\\/\\/smpp.ajuratech.com:7788\\/sendtext\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(80, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 4, NULL, NULL, '{\"attributes\":{\"key\":\"reve_username\",\"value\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(81, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 5, NULL, NULL, '{\"attributes\":{\"key\":\"reve_user_password\",\"value\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(82, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 6, NULL, NULL, '{\"attributes\":{\"key\":\"reve_status\",\"value\":\"0\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(83, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 7, NULL, NULL, '{\"attributes\":{\"key\":\"twilio_sid\",\"value\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(84, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 8, NULL, NULL, '{\"attributes\":{\"key\":\"twilio_token\",\"value\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(85, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 9, NULL, NULL, '{\"attributes\":{\"key\":\"twilio_from\",\"value\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(86, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 10, NULL, NULL, '{\"attributes\":{\"key\":\"twilio_status\",\"value\":\"0\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(87, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 11, NULL, NULL, '{\"attributes\":{\"key\":\"nexmo_key\",\"value\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(88, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 12, NULL, NULL, '{\"attributes\":{\"key\":\"nexmo_secret_key\",\"value\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(89, 'smsSettings', 'created', 'App\\Models\\Backend\\SmsSetting', 'created', 13, NULL, NULL, '{\"attributes\":{\"key\":\"nexmo_status\",\"value\":\"0\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(90, 'SmsSendSetting', 'created', 'App\\Models\\Backend\\SmsSendSetting', 'created', 1, NULL, NULL, '{\"attributes\":{\"sms_send_status\":1}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(91, 'SmsSendSetting', 'created', 'App\\Models\\Backend\\SmsSendSetting', 'created', 2, NULL, NULL, '{\"attributes\":{\"sms_send_status\":2}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(92, 'SmsSendSetting', 'created', 'App\\Models\\Backend\\SmsSendSetting', 'created', 3, NULL, NULL, '{\"attributes\":{\"sms_send_status\":3}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(93, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 8, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user8.png\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(94, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 9, NULL, NULL, '{\"attributes\":{\"original\":\"uploads\\/users\\/user9.png\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(95, 'General Settings', 'created', 'App\\Models\\Backend\\GeneralSettings', 'created', 1, NULL, NULL, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"We Courier\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(96, 'Notification Settings', 'created', 'App\\Models\\Backend\\NotificationSettings', 'created', 1, NULL, NULL, '{\"attributes\":{\"fcm_secret_key\":\"\",\"fcm_topic\":\"\"}}', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(97, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 10, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/services\\/truck.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(98, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 11, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/services\\/pick-drop.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(99, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 12, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/services\\/packageing.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(100, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 13, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/services\\/warehouse.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(101, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 14, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/whycourier\\/timly-delivery.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(102, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 15, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/whycourier\\/limitless-pickup.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(103, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 16, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/whycourier\\/cash-on-delivery.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(104, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 17, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/whycourier\\/payment.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(105, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 18, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/whycourier\\/handling.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(106, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 19, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/whycourier\\/live-tracking.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(107, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 20, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/1.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(108, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 21, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/atom.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(109, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 22, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/digg.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(110, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 23, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/2.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(111, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 24, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/huawei.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(112, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 25, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/ups.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(113, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 26, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/1.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(114, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 27, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/atom.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(115, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 28, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/digg.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(116, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 29, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/2.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(117, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 30, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/huawei.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(118, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 31, NULL, NULL, '{\"attributes\":{\"original\":\"frontend\\/images\\/partner\\/ups.png\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(119, 'User', 'updated', 'App\\Models\\User', 'updated', 1, NULL, NULL, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"hari@ezycode.lk\"},\"old\":{\"name\":\"WemaxDevs\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(120, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"We Courier\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-08 18:34:41', '2023-12-08 18:34:41'),
(121, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-08 18:36:26', '2023-12-08 18:36:26'),
(122, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-08 18:37:13', '2023-12-08 18:37:13'),
(123, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-10 01:23:19', '2023-12-10 01:23:19'),
(124, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-10 01:24:01', '2023-12-10 01:24:01'),
(125, 'User', 'created', 'App\\Models\\User', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"shop@gmail.com\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(126, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Islam\",\"business_name\":\"shop\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(127, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"name\":\"shop\",\"contact_no\":\"01516546454156\",\"address\":\"Colombo,Srilanka\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(128, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(129, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(130, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(131, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(132, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(133, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(134, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(135, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(136, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(137, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"shop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(138, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"name\":\"Shao41\",\"contact_no\":\"026515615165\",\"address\":\"Dhaha,Bangladeesh\"}}', NULL, '2023-12-10 01:31:08', '2023-12-10 01:31:08'),
(139, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 1, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"WemaxDevs\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2023-12-10 01:40:33', '2023-12-10 01:40:33'),
(140, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 1, 'App\\Models\\User', 4, '{\"attributes\":{\"user.name\":\"Merchant\",\"business_name\":\"WemaxDevs\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Merchant\",\"business_name\":\"WemaxDevs\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-10 01:40:33', '2023-12-10 01:40:33'),
(141, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Colombo,Head Office\",\"phone\":\"03521654156\",\"address\":\"Colombo,Srilanka\"}}', NULL, '2023-12-10 01:46:45', '2023-12-10 01:46:45'),
(142, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"\"}}', NULL, '2023-12-10 01:48:37', '2023-12-10 01:48:37'),
(143, 'User', 'created', 'App\\Models\\User', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Hari\",\"email\":\"mni.jibon@gmail.com\"}}', NULL, '2023-12-10 01:48:37', '2023-12-10 01:48:37'),
(144, 'Hub', 'deleted', 'App\\Models\\Backend\\Hub', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Colombo,Head Office\",\"phone\":\"03521654156\",\"address\":\"Colombo,Srilanka\"}}', NULL, '2023-12-11 22:28:36', '2023-12-11 22:28:36'),
(145, 'Hub', 'deleted', 'App\\Models\\Backend\\Hub', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Badda\",\"phone\":\"01000000006\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-11 22:28:45', '2023-12-11 22:28:45'),
(146, 'Hub', 'deleted', 'App\\Models\\Backend\\Hub', 'deleted', 5, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"Jatrabari\",\"phone\":\"01000000005\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-11 22:37:33', '2023-12-11 22:37:33'),
(147, 'Salary Generate', 'created', 'App\\Models\\Backend\\Payroll\\SalaryGenerate', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Delivery Partner\",\"month\":\"2023-12\",\"amount\":\"7000.00\",\"due\":\"0.00\",\"advance\":\"0.00\",\"note\":\"Auto Generated\"}}', NULL, '2023-12-11 23:02:09', '2023-12-11 23:02:09'),
(148, 'Salary Generate', 'created', 'App\\Models\\Backend\\Payroll\\SalaryGenerate', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Branch\",\"month\":\"2023-12\",\"amount\":\"9000.00\",\"due\":\"0.00\",\"advance\":\"0.00\",\"note\":\"Auto Generated\"}}', NULL, '2023-12-11 23:02:09', '2023-12-11 23:02:09'),
(149, 'Salary Generate', 'created', 'App\\Models\\Backend\\Payroll\\SalaryGenerate', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Delivery Man\",\"month\":\"2023-12\",\"amount\":\"7000.00\",\"due\":\"0.00\",\"advance\":\"0.00\",\"note\":\"Auto Generated\"}}', NULL, '2023-12-11 23:02:09', '2023-12-11 23:02:09'),
(150, 'ToDo', 'created', 'App\\Models\\Backend\\To_do', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"\",\"description\":\"Hello Testing!\",\"user.name\":\"Branch\",\"date\":\"2023-12-11\"}}', NULL, '2023-12-11 23:17:45', '2023-12-11 23:17:45'),
(151, 'ToDo', 'updated', 'App\\Models\\Backend\\To_do', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"\",\"description\":\"Hello Testing!\",\"user.name\":\"Branch\",\"date\":\"2023-12-11\"},\"old\":{\"title\":\"\",\"description\":\"Hello Testing!\",\"user.name\":\"Branch\",\"date\":\"2023-12-11\"}}', NULL, '2023-12-11 23:18:02', '2023-12-11 23:18:02'),
(152, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Colombo Centerl\",\"phone\":\"112556576088\",\"address\":\"#329, Galle Road, Colombo - 04\"}}', NULL, '2023-12-17 18:57:00', '2023-12-17 18:57:00'),
(153, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"\"}}', NULL, '2023-12-17 19:03:27', '2023-12-17 19:03:27'),
(154, 'News Offer', 'created', 'App\\Models\\Backend\\NewsOffer', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"TEST OFFER\",\"description\":null,\"date\":\"2023-12-17\"}}', NULL, '2023-12-17 19:03:27', '2023-12-17 19:03:27'),
(155, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-17 20:33:56', '2023-12-17 20:33:56'),
(156, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Jaffna\",\"phone\":\"0094777123456\",\"address\":\"Jaffna Road, KKS\"},\"old\":{\"name\":\"Old Dhaka\",\"phone\":\"01000000004\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-17 20:39:09', '2023-12-17 20:39:09'),
(157, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart - Puttalam\",\"phone\":\"0094777123456\",\"address\":\"Mannar Road, Puttalam\"},\"old\":{\"name\":\"Dhanmundi\",\"phone\":\"01000000003\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-17 20:40:41', '2023-12-17 20:40:41'),
(158, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart - Jaffna\",\"phone\":\"0094777123456\",\"address\":\"K. K. S. Road, Jaffna\"},\"old\":{\"name\":\"Jaffna\",\"phone\":\"0094777123456\",\"address\":\"Jaffna Road, KKS\"}}', NULL, '2023-12-17 20:41:11', '2023-12-17 20:41:11'),
(159, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart - Colombo\",\"phone\":\"0094777123456\",\"address\":\"R. A. De Mel Mawattha, Colombo - 06\"},\"old\":{\"name\":\"Colombo Centerl\",\"phone\":\"112556576088\",\"address\":\"#329, Galle Road, Colombo - 04\"}}', NULL, '2023-12-17 20:42:03', '2023-12-17 20:42:03'),
(160, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart - Ampara\",\"phone\":\"0094777123456\",\"address\":\"Batticola Road, Ampara\"},\"old\":{\"name\":\"Uttara\",\"phone\":\"01000000002\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-17 20:42:51', '2023-12-17 20:42:51');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(161, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart - Katharagama\",\"phone\":\"0094777123456\",\"address\":\"2nd Sillo Road, Katharagama\"},\"old\":{\"name\":\"Mirpur-10\",\"phone\":\"01000000001\",\"address\":\"Dhaka, Bangladesh\"}}', NULL, '2023-12-17 20:43:40', '2023-12-17 20:43:40'),
(162, 'User', 'updated', 'App\\Models\\User', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Alphonso Silo\",\"email\":\"alphonso@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"shop@gmail.com\"}}', NULL, '2023-12-17 20:51:18', '2023-12-17 20:51:18'),
(163, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Alphonso Silo\",\"business_name\":\"Alphonso Cafe\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Alphonso Silo\",\"business_name\":\"shop\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 20:51:18', '2023-12-17 20:51:18'),
(164, 'User', 'updated', 'App\\Models\\User', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"John Keels\",\"email\":\"keels@gmail.com\"},\"old\":{\"name\":\"Merchant\",\"email\":\"merchant@wemaxdevs.com\"}}', NULL, '2023-12-17 20:53:56', '2023-12-17 20:53:56'),
(165, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"John Keels\",\"business_name\":\"WemaxDevs\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 20:53:56', '2023-12-17 20:53:56'),
(166, 'User', 'updated', 'App\\Models\\User', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Alphonso Silo\",\"email\":\"alphonso@gmail.com\"},\"old\":{\"name\":\"Alphonso Silo\",\"email\":\"alphonso@gmail.com\"}}', NULL, '2023-12-17 20:54:43', '2023-12-17 20:54:43'),
(167, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Alphonso Silo\",\"business_name\":\"Alphonso Cafe\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Alphonso Silo\",\"business_name\":\"Alphonso Cafe\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 20:54:43', '2023-12-17 20:54:43'),
(168, 'User', 'created', 'App\\Models\\User', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Chindimal Perera\",\"email\":\"cargills@gmail.com\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(169, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Chindimal Perera\",\"business_name\":\"Cargills Food City\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(170, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"name\":\"Cargills Food City\",\"contact_no\":\"0094777123458\",\"address\":\"Colombo - 13, Kotahena.\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(171, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(172, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(173, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 23, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(174, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 24, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(175, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 25, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(176, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(177, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(178, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(179, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 29, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2023-12-17 20:57:50', '2023-12-17 20:57:50'),
(180, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 30, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2023-12-17 20:57:50', '2023-12-17 20:57:50'),
(181, 'User', 'created', 'App\\Models\\User', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Rupasinghe Ruwan\",\"email\":\"cargills.pettah@gmail.com\"}}', NULL, '2023-12-17 21:00:14', '2023-12-17 21:00:14'),
(182, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(183, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"name\":\"Cargills Food City - Pettah\",\"contact_no\":\"0094777123459\",\"address\":\"Main Street, Pettah.\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(184, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 31, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(185, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(186, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(187, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(188, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(189, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(190, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 37, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(191, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 38, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(192, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 39, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(193, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 40, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(194, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Delivery Man\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Delivery Man\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 21:07:22', '2023-12-17 21:07:22'),
(195, 'User', 'updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Angelo Mathews\",\"email\":\"pranavan@ezycode.lk\"},\"old\":{\"name\":\"Delivery Man\",\"email\":\"deliveryman@wemaxit.com\"}}', NULL, '2023-12-17 21:07:22', '2023-12-17 21:07:22'),
(196, 'User', 'updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Angelo Mathews\",\"email\":\"angelo@ezycode.lk\"},\"old\":{\"name\":\"Angelo Mathews\",\"email\":\"pranavan@ezycode.lk\"}}', NULL, '2023-12-17 21:10:37', '2023-12-17 21:10:37'),
(197, 'User', 'created', 'App\\Models\\User', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Sanath Jayasooriya\",\"email\":\"pranavan@ezycode.lk\"}}', NULL, '2023-12-17 21:15:51', '2023-12-17 21:15:51'),
(198, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Sanath Jayasooriya\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 21:15:51', '2023-12-17 21:15:51'),
(199, 'User', 'updated', 'App\\Models\\User', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Sanath Jayasooriya\",\"email\":\"sanath@ezycode.lk\"},\"old\":{\"name\":\"Sanath Jayasooriya\",\"email\":\"pranavan@ezycode.lk\"}}', NULL, '2023-12-17 21:18:33', '2023-12-17 21:18:33'),
(200, 'User', 'created', 'App\\Models\\User', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Arjuna Ranatunga\",\"email\":\"arjuna@ezycode.lk\"}}', NULL, '2023-12-17 21:20:29', '2023-12-17 21:20:29'),
(201, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Arjuna Ranatunga\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 21:20:29', '2023-12-17 21:20:29'),
(202, 'User', 'created', 'App\\Models\\User', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Muttaiah Murali\",\"email\":\"muralee@ezycode.lk\"}}', NULL, '2023-12-17 21:21:44', '2023-12-17 21:21:44'),
(203, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Muttaiah Murali\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 21:21:44', '2023-12-17 21:21:44'),
(204, 'User', 'created', 'App\\Models\\User', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Senthooran\",\"email\":\"senthooran@gmail.com\"}}', NULL, '2023-12-17 21:27:01', '2023-12-17 21:27:01'),
(205, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Senthooran\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 21:27:01', '2023-12-17 21:27:01'),
(206, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 7, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Kotahena (Keels)\",\"contact_no\":\"026515615165\",\"address\":\"Kotahena, Colombo - 13\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Shao41\",\"contact_no\":\"026515615165\",\"address\":\"Dhaha,Bangladeesh\"}}', NULL, '2023-12-17 21:41:53', '2023-12-17 21:41:53'),
(207, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 5, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Bambalapitiya (Keels)\",\"contact_no\":\"0094762909090\",\"address\":\"Bambalapitiya, Colombo - 05\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Shop 5\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-17 21:43:15', '2023-12-17 21:43:15'),
(208, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 7, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Kotahena (Keels)\",\"contact_no\":\"0094762909089\",\"address\":\"Kotahena, Colombo - 13\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Kotahena (Keels)\",\"contact_no\":\"026515615165\",\"address\":\"Kotahena, Colombo - 13\"}}', NULL, '2023-12-17 21:46:15', '2023-12-17 21:46:15'),
(209, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 4, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Galle (Keels)\",\"contact_no\":\"0094762909091\",\"address\":\"Galle Road, Galle\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Shop 4\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-17 21:50:28', '2023-12-17 21:50:28'),
(210, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 3, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Nugegoda (Keels)\",\"contact_no\":\"0094762909092\",\"address\":\"Main Road, Nugegoda\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Shop 3\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-17 21:51:32', '2023-12-17 21:51:32'),
(211, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 2, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Wellawattha\",\"contact_no\":\"0094762909093\",\"address\":\"Wellawattha, Colombo - 06\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Shop 2\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-17 21:52:08', '2023-12-17 21:52:08'),
(212, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 1, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Weligama\",\"contact_no\":\"0094762909095\",\"address\":\"Weligama, Sri Lanka.\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Shop 1\",\"contact_no\":\"+88013000000\",\"address\":\"Wemaxdevs,Dhaka\"}}', NULL, '2023-12-17 21:52:45', '2023-12-17 21:52:45'),
(213, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 2, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Wellawattha (Keels)\",\"contact_no\":\"0094762909093\",\"address\":\"Wellawattha, Colombo - 06\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Wellawattha\",\"contact_no\":\"0094762909093\",\"address\":\"Wellawattha, Colombo - 06\"}}', NULL, '2023-12-17 21:53:00', '2023-12-17 21:53:00'),
(214, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 1, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Weligama (Keels)\",\"contact_no\":\"0094762909095\",\"address\":\"Weligama, Sri Lanka.\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Weligama\",\"contact_no\":\"0094762909095\",\"address\":\"Weligama, Sri Lanka.\"}}', NULL, '2023-12-17 21:53:27', '2023-12-17 21:53:27'),
(215, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 2, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"}}', NULL, '2023-12-17 22:07:58', '2023-12-17 22:07:58'),
(216, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 1, 'App\\Models\\User', 4, '{\"attributes\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-17 22:07:59', '2023-12-17 22:07:59'),
(217, 'User', 'updated', 'App\\Models\\User', 'updated', 4, 'App\\Models\\User', 4, '{\"attributes\":{\"name\":\"John Keels\",\"email\":\"keels@gmail.com\"},\"old\":{\"name\":\"John Keels\",\"email\":\"keels@gmail.com\"}}', NULL, '2023-12-17 22:10:14', '2023-12-17 22:10:14'),
(218, 'User', 'updated', 'App\\Models\\User', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Alphonso Silo\",\"email\":\"alphonso@gmail.com\"},\"old\":{\"name\":\"Alphonso Silo\",\"email\":\"alphonso@gmail.com\"}}', NULL, '2023-12-17 23:58:35', '2023-12-17 23:58:35'),
(219, 'User', 'updated', 'App\\Models\\User', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"John Keels\",\"email\":\"keels@gmail.com\"},\"old\":{\"name\":\"John Keels\",\"email\":\"keels@gmail.com\"}}', NULL, '2023-12-17 23:58:53', '2023-12-17 23:58:53'),
(220, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-18 00:15:36', '2023-12-18 00:15:36'),
(221, 'Upload', 'updated', 'App\\Models\\Backend\\Upload', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/settings\\/202312171634537917.png\"},\"old\":{\"original\":\"uploads\\/users\\/user8.png\"}}', NULL, '2023-12-18 00:34:53', '2023-12-18 00:34:53'),
(222, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"},\"old\":{\"name\":\"Branch\",\"email\":\"branch@wemaxdevs.com\"}}', NULL, '2023-12-18 00:35:54', '2023-12-18 00:35:54'),
(223, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"}}', NULL, '2023-12-18 00:36:51', '2023-12-18 00:36:51'),
(224, 'Role', 'updated', 'App\\Models\\Backend\\Role', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Admin\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_incharge_read\",\"hub_view\",\"account_read\",\"income_read\",\"expense_read\",\"todo_read\",\"fund_transfer_read\",\"fund_transfer_update\",\"role_read\",\"designation_read\",\"department_read\",\"user_read\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_reject\",\"hub_payment_process\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]},\"old\":{\"name\":\"Admin\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_incharge_read\",\"account_read\",\"income_read\",\"expense_read\",\"todo_read\",\"sms_settings_read\",\"sms_send_settings_read\",\"general_settings_read\",\"notification_settings_read\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"account_heads_read\",\"salary_read\",\"support_read\",\"fund_transfer_read\",\"role_read\",\"designation_read\",\"department_read\",\"user_read\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_shop_read\",\"merchant_payment_read\",\"payment_read\",\"hub_payment_request_read\",\"hub_payment_read\",\"parcel_read\",\"delivery_man_read\",\"delivery_category_read\",\"delivery_charge_read\",\"delivery_type_read\",\"liquid_fragile_read\",\"packaging_read\",\"category_read\",\"asset_category_read\",\"news_offer_read\",\"sms_settings_status_change\",\"sms_send_settings_status_change\",\"bank_transaction_read\",\"database_backup_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"assets_read\",\"fraud_read\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"cash_received_from_delivery_man_delete\",\"invoice_read\",\"invoice_status_update\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"hub_view\",\"paid_invoice_read\",\"invoice_generate_menually\",\"currency_read\"]}}', NULL, '2023-12-18 00:42:19', '2023-12-18 00:42:19'),
(225, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"}}', NULL, '2023-12-18 00:48:31', '2023-12-18 00:48:31'),
(226, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"}}', NULL, '2023-12-18 00:59:40', '2023-12-18 00:59:40'),
(227, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"}}', NULL, '2023-12-18 01:02:40', '2023-12-18 01:02:40'),
(228, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"}}', NULL, '2023-12-18 01:06:07', '2023-12-18 01:06:07'),
(229, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"}}', NULL, '2023-12-18 21:53:55', '2023-12-18 21:53:55'),
(230, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"branch@ezycode.lk\"}}', NULL, '2023-12-18 22:56:38', '2023-12-18 22:56:38'),
(231, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2023-12-18 23:02:06', '2023-12-18 23:02:06'),
(232, 'User', 'created', 'App\\Models\\User', 'created', 13, 'App\\Models\\User', 2, '{\"attributes\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"}}', NULL, '2023-12-18 23:06:53', '2023-12-18 23:06:53'),
(233, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 6, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Thileepan\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-18 23:06:53', '2023-12-18 23:06:53'),
(234, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 9, 'App\\Models\\User', 2, '{\"attributes\":{\"name\":\"DeliPart - Wennapuwa\",\"phone\":\"009472324567\",\"address\":\"Side Road, Wennapuwa\"}}', NULL, '2023-12-18 23:08:21', '2023-12-18 23:08:21'),
(235, 'User', 'updated', 'App\\Models\\User', 'updated', 13, 'App\\Models\\User', 2, '{\"attributes\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"},\"old\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"}}', NULL, '2023-12-18 23:10:26', '2023-12-18 23:10:26'),
(236, 'User', 'created', 'App\\Models\\User', 'created', 14, 'App\\Models\\User', 2, '{\"attributes\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(237, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 5, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"2000.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(238, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 10, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"name\":\"Wharehouse\",\"contact_no\":\"0094776345465\",\"address\":\"Pamunugama Road, Gampaha\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(239, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 41, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(240, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 42, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(241, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 43, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(242, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 44, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(243, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 45, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(244, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 46, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(245, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 47, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(246, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 48, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(247, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 49, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(248, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 50, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(249, 'Support', 'created', 'App\\Models\\Backend\\Support', 'created', 1, 'App\\Models\\User', 14, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"department.title\":\"Human Resource\",\"service\":\"pickup\",\"priority\":\"medium\",\"subject\":\"System is working fine\",\"description\":\"<p>Hello Team<\\/p>\",\"date\":\"2023-12-18\"}}', NULL, '2023-12-18 23:22:21', '2023-12-18 23:22:21'),
(250, 'Support', 'updated', 'App\\Models\\Backend\\Support', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"department.title\":\"Human Resource\",\"service\":\"pickup\",\"priority\":\"medium\",\"subject\":\"System is working fine\",\"description\":\"<p>Hello Team<\\/p>\",\"date\":\"2023-12-18\"},\"old\":{\"user.name\":\"Weerasinge Bandara\",\"department.title\":\"Human Resource\",\"service\":\"pickup\",\"priority\":\"medium\",\"subject\":\"System is working fine\",\"description\":\"<p>Hello Team<\\/p>\",\"date\":\"2023-12-18\"}}', NULL, '2023-12-18 23:28:58', '2023-12-18 23:28:58'),
(251, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 11, 'App\\Models\\User', 14, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"name\":\"WhereHouse (Galkissa)\",\"contact_no\":\"0094789323232\",\"address\":\"#329, Galle Road, Colombo - 04\"}}', NULL, '2023-12-18 23:33:56', '2023-12-18 23:33:56'),
(252, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"},\"old\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"2000.00\"}}', NULL, '2023-12-19 00:20:53', '2023-12-19 00:20:53'),
(253, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"},\"old\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"}}', NULL, '2023-12-19 00:25:11', '2023-12-19 00:25:11'),
(254, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 3, 'App\\Models\\User', 14, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"}}', NULL, '2023-12-19 00:26:37', '2023-12-19 00:26:37'),
(255, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 5, 'App\\Models\\User', 14, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"},\"old\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"}}', NULL, '2023-12-19 00:26:37', '2023-12-19 00:26:37'),
(256, 'ToDo', 'updated', 'App\\Models\\Backend\\To_do', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"\",\"description\":\"Hello Testing!\",\"user.name\":\"DeliPartner (Jaffna)\",\"date\":\"2023-12-11\"},\"old\":{\"title\":\"\",\"description\":\"Hello Testing!\",\"user.name\":\"DeliPartner (Jaffna)\",\"date\":\"2023-12-11\"}}', NULL, '2023-12-21 23:28:24', '2023-12-21 23:28:24'),
(257, 'ToDo', 'created', 'App\\Models\\Backend\\To_do', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"Send PARCEL of The Code for XLT4532946\",\"description\":\"Kindly visit the hub and get the parcel ASAP.\",\"user.name\":\"Angelo Mathews\",\"date\":\"2023-12-21\"}}', NULL, '2023-12-21 23:32:56', '2023-12-21 23:32:56'),
(258, 'User', 'created', 'App\\Models\\User', 'created', 15, NULL, NULL, '{\"attributes\":{\"name\":\"Md Tanjid\",\"email\":null}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(259, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 6, NULL, NULL, '{\"attributes\":{\"user.name\":\"Md Tanjid\",\"business_name\":\"Tanjid\",\"current_balance\":\"0.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(260, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 12, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"name\":\"Tanjid\",\"contact_no\":\"01875011412\",\"address\":\"Dhaka\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(261, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 51, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(262, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 52, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(263, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 53, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(264, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 54, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(265, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 55, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(266, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 56, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(267, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 57, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(268, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 58, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(269, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 59, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(270, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 60, NULL, NULL, '{\"attributes\":{\"merchant.business_name\":\"Tanjid\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2023-12-24 23:48:03', '2023-12-24 23:48:03'),
(271, 'User', 'updated', 'App\\Models\\User', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"},\"old\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"}}', NULL, '2023-12-25 15:20:51', '2023-12-25 15:20:51'),
(272, 'User', 'updated', 'App\\Models\\User', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Senthooran\",\"email\":\"senthooran@gmail.com\"},\"old\":{\"name\":\"Senthooran\",\"email\":\"senthooran@gmail.com\"}}', NULL, '2023-12-25 16:42:10', '2023-12-25 16:42:10'),
(273, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 4, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2023-12-25 17:41:27', '2023-12-25 17:41:27'),
(274, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 5, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"388.00\",\"current_payable\":\"8012.00\"}}', NULL, '2023-12-25 17:42:05', '2023-12-25 17:42:05'),
(275, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 6, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"388.00\",\"current_payable\":\"8012.00\"}}', NULL, '2023-12-25 17:42:56', '2023-12-25 17:42:56'),
(276, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 7, 'App\\Models\\User', 4, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"388.00\",\"current_payable\":\"8012.00\"}}', NULL, '2023-12-25 17:43:15', '2023-12-25 17:43:15'),
(277, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner (Jaffna)\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2023-12-26 21:37:15', '2023-12-26 21:37:15');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(278, 'Role', 'updated', 'App\\Models\\Backend\\Role', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart (Head)\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_incharge_read\",\"hub_view\",\"account_read\",\"income_read\",\"expense_read\",\"todo_read\",\"fund_transfer_read\",\"fund_transfer_update\",\"role_read\",\"designation_read\",\"department_read\",\"user_read\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_reject\",\"hub_payment_process\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]},\"old\":{\"name\":\"Admin\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_incharge_read\",\"hub_view\",\"account_read\",\"income_read\",\"expense_read\",\"todo_read\",\"fund_transfer_read\",\"fund_transfer_update\",\"role_read\",\"designation_read\",\"department_read\",\"user_read\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_reject\",\"hub_payment_process\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]}}', NULL, '2023-12-26 21:42:38', '2023-12-26 21:42:38'),
(279, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"\"}}', NULL, '2023-12-26 21:47:26', '2023-12-26 21:47:26'),
(280, 'User', 'created', 'App\\Models\\User', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Pranavan\",\"email\":\"logan.pranavan@gmail.com\"}}', NULL, '2023-12-26 21:47:26', '2023-12-26 21:47:26'),
(281, 'User', 'updated', 'App\\Models\\User', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Pranavan\",\"email\":\"pranavan@ezycode.lk\"},\"old\":{\"name\":\"Pranavan\",\"email\":\"logan.pranavan@gmail.com\"}}', NULL, '2023-12-26 21:47:57', '2023-12-26 21:47:57'),
(282, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 16, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2023-12-26 21:49:16', '2023-12-26 21:49:16'),
(283, 'User', 'updated', 'App\\Models\\User', 'updated', 16, 'App\\Models\\User', 16, '{\"attributes\":{\"name\":\"Pranavan\",\"email\":\"pranavan@ezycode.lk\"},\"old\":{\"name\":\"Pranavan\",\"email\":\"pranavan@ezycode.lk\"}}', NULL, '2023-12-26 21:55:38', '2023-12-26 21:55:38'),
(284, 'parcel', 'deleted', 'App\\Models\\Backend\\Parcel', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"388.00\",\"current_payable\":\"8012.00\"}}', NULL, '2023-12-26 22:00:45', '2023-12-26 22:00:45'),
(285, 'parcel', 'deleted', 'App\\Models\\Backend\\Parcel', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"388.00\",\"current_payable\":\"8012.00\"}}', NULL, '2023-12-26 22:01:00', '2023-12-26 22:01:00'),
(286, 'User', 'updated', 'App\\Models\\User', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"John Keels\",\"email\":\"keels@gmail.com\"},\"old\":{\"name\":\"John Keels\",\"email\":\"keels@gmail.com\"}}', NULL, '2023-12-26 22:04:39', '2023-12-26 22:04:39'),
(287, 'parcel', 'deleted', 'App\\Models\\Backend\\Parcel', 'deleted', 5, 'App\\Models\\User', 16, '{\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"388.00\",\"current_payable\":\"8012.00\"}}', NULL, '2023-12-26 22:05:27', '2023-12-26 22:05:27'),
(288, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 16, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2023-12-26 22:11:53', '2023-12-26 22:11:53'),
(289, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 16, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2023-12-26 22:14:04', '2023-12-26 22:14:04'),
(290, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 16, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2023-12-26 22:20:06', '2023-12-26 22:20:06'),
(291, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2023-12-27 14:30:02', '2023-12-27 14:30:02'),
(292, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2023-12-27 14:31:34', '2023-12-27 14:31:34'),
(293, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"},\"old\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"}}', NULL, '2023-12-27 14:31:42', '2023-12-27 14:31:42'),
(294, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"},\"old\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"}}', NULL, '2023-12-27 14:32:01', '2023-12-27 14:32:01'),
(295, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/settings\\/202312271236251704.png\"}}', NULL, '2023-12-27 20:36:25', '2023-12-27 20:36:25'),
(296, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2023-12-27 20:36:25', '2023-12-27 20:36:25'),
(297, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Angelo Mathews\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Angelo Mathews\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-01 14:40:06', '2024-02-01 14:40:06'),
(298, 'User', 'updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Angelo Mathews\",\"email\":\"angelo@ezycode.lk\"},\"old\":{\"name\":\"Angelo Mathews\",\"email\":\"angelo@ezycode.lk\"}}', NULL, '2024-02-01 14:40:06', '2024-02-01 14:40:06'),
(299, 'User', 'updated', 'App\\Models\\User', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Angelo Mathews\",\"email\":\"angelo@ezycode.lk\"},\"old\":{\"name\":\"Angelo Mathews\",\"email\":\"angelo@ezycode.lk\"}}', NULL, '2024-02-01 14:40:58', '2024-02-01 14:40:58'),
(300, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Thileepan\",\"current_balance\":\"15.00\"},\"old\":{\"user.name\":\"Thileepan\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-01 14:41:56', '2024-02-01 14:41:56'),
(301, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-01 14:41:56', '2024-02-01 14:41:56'),
(302, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-01 14:42:40', '2024-02-01 14:42:40'),
(303, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-01 15:10:26', '2024-02-01 15:10:26'),
(304, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0\",\"selling_price\":\"100\",\"delivery_charge\":50,\"total_delivery_amount\":60,\"current_payable\":-60}}', NULL, '2024-02-01 15:10:26', '2024-02-01 15:10:26'),
(305, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-01 15:10:26', '2024-02-01 15:10:26'),
(306, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-01 15:11:49', '2024-02-01 15:11:49'),
(307, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-01 15:12:29', '2024-02-01 15:12:29'),
(308, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-01 15:12:57', '2024-02-01 15:12:57'),
(309, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Angelo Mathews\",\"current_balance\":\"20.00\"},\"old\":{\"user.name\":\"Angelo Mathews\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-01 15:19:35', '2024-02-01 15:19:35'),
(310, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-01 15:19:35', '2024-02-01 15:19:35'),
(311, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-01 15:20:07', '2024-02-01 15:20:07'),
(312, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-07 11:06:12', '2024-02-07 11:06:12'),
(313, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"}}', NULL, '2024-02-07 16:11:04', '2024-02-07 16:11:04'),
(314, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Thileepan\",\"current_balance\":\"30.00\"},\"old\":{\"user.name\":\"Thileepan\",\"current_balance\":\"15.00\"}}', NULL, '2024-02-07 16:11:14', '2024-02-07 16:11:14'),
(315, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"}}', NULL, '2024-02-07 16:11:14', '2024-02-07 16:11:14'),
(316, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"}}', NULL, '2024-02-07 16:11:35', '2024-02-07 16:11:35'),
(317, 'User', 'created', 'App\\Models\\User', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Malippi Gilma\",\"email\":\"malpi@gmail.com\"}}', NULL, '2024-02-07 17:26:14', '2024-02-07 17:26:14'),
(318, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Malippi Gilma\",\"current_balance\":\"100.00\"}}', NULL, '2024-02-07 17:26:14', '2024-02-07 17:26:14'),
(319, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-08 10:00:53', '2024-02-08 10:00:53'),
(320, 'Role', 'created', 'App\\Models\\Backend\\Role', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Hub -in charge\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"hub_read\",\"hub_create\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_assigned\",\"hub_view\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"user_read\",\"user_create\",\"merchant_read\",\"merchant_create\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_payment_read\",\"merchant_payment_create\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"general_settings_read\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_charge_read\",\"delivery_charge_create\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_approve\",\"wallet_request_reject\"]}}', NULL, '2024-02-08 11:33:28', '2024-02-08 11:33:28'),
(321, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 36, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"\"}}', NULL, '2024-02-08 11:34:39', '2024-02-08 11:34:39'),
(322, 'User', 'created', 'App\\Models\\User', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"}}', NULL, '2024-02-08 11:34:39', '2024-02-08 11:34:39'),
(323, 'User', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"}}', NULL, '2024-02-08 11:35:21', '2024-02-08 11:35:21'),
(324, 'InCharges', 'created', 'App\\Models\\Backend\\HubInCharge', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Islam\"}}', NULL, '2024-02-08 11:36:28', '2024-02-08 11:36:28'),
(325, 'User', 'updated', 'App\\Models\\User', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Rupasinghe Ruwan\",\"email\":\"cargills.pettah@gmail.com\"},\"old\":{\"name\":\"Rupasinghe Ruwan\",\"email\":\"cargills.pettah@gmail.com\"}}', NULL, '2024-02-08 11:40:00', '2024-02-08 11:40:00'),
(326, 'User', 'updated', 'App\\Models\\User', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Chindimal Perera\",\"email\":\"cargills@gmail.com\"},\"old\":{\"name\":\"Chindimal Perera\",\"email\":\"cargills@gmail.com\"}}', NULL, '2024-02-08 11:40:17', '2024-02-08 11:40:17'),
(327, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-09 23:59:03', '2024-02-09 23:59:03'),
(328, 'User', 'updated', 'App\\Models\\User', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"},\"old\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"}}', NULL, '2024-02-10 03:54:18', '2024-02-10 03:54:18'),
(329, 'User', 'updated', 'App\\Models\\User', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"},\"old\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"}}', NULL, '2024-02-10 03:54:49', '2024-02-10 03:54:49'),
(330, 'User', 'updated', 'App\\Models\\User', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"},\"old\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"}}', NULL, '2024-02-10 03:59:35', '2024-02-10 03:59:35'),
(331, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"},\"old\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"}}', NULL, '2024-02-10 03:59:35', '2024-02-10 03:59:35'),
(332, 'User', 'updated', 'App\\Models\\User', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"},\"old\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"}}', NULL, '2024-02-10 04:02:50', '2024-02-10 04:02:50'),
(333, 'User', 'updated', 'App\\Models\\User', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"},\"old\":{\"name\":\"Weerasinge Bandara\",\"email\":\"wh@gmail.com\"}}', NULL, '2024-02-10 04:03:01', '2024-02-10 04:03:01'),
(334, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2024-02-10 04:09:26', '2024-02-10 04:09:26'),
(335, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"},\"old\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"}}', NULL, '2024-02-10 04:14:59', '2024-02-10 04:14:59'),
(336, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"},\"old\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"}}', NULL, '2024-02-10 04:15:39', '2024-02-10 04:15:39'),
(337, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Senthooran\",\"current_balance\":\"15.00\"},\"old\":{\"user.name\":\"Senthooran\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-10 04:16:19', '2024-02-10 04:16:19'),
(338, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"},\"old\":{\"merchant.business_name\":\"Wharehouse\",\"pickup_address\":\"Pamunugama Road, Gampaha\",\"pickup_phone\":\"0094776345465\",\"customer_name\":\"Shapoorji\",\"customer_phone\":\"0094778989898\",\"customer_address\":\"Lakshman Place, Gampaha\",\"invoice_no\":\"DP20202043\",\"cash_collection\":\"8950.00\",\"selling_price\":\"5000.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"169.50\",\"current_payable\":\"8780.50\"}}', NULL, '2024-02-10 04:16:19', '2024-02-10 04:16:19'),
(339, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-10 04:35:06', '2024-02-10 04:35:06'),
(340, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-10 04:52:27', '2024-02-10 04:52:27'),
(341, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-10 04:52:27', '2024-02-10 04:52:27'),
(342, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 4, 'App\\Models\\User', 18, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 05:33:42', '2024-02-10 05:33:42'),
(343, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 10, 'App\\Models\\User', 18, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 05:33:59', '2024-02-10 05:33:59'),
(344, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 18, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 05:33:59', '2024-02-10 05:33:59'),
(345, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 11, 'App\\Models\\User', 18, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 05:40:55', '2024-02-10 05:40:55'),
(346, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 18, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 05:40:55', '2024-02-10 05:40:55'),
(347, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2024-02-10 05:47:01', '2024-02-10 05:47:01'),
(348, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2024-02-10 05:47:38', '2024-02-10 05:47:38'),
(349, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2024-02-10 05:48:23', '2024-02-10 05:48:23');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(350, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:11:14', '2024-02-10 06:11:14'),
(351, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:11:24', '2024-02-10 06:11:24'),
(352, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 7, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Malippi Gilma\",\"current_balance\":\"130.00\"},\"old\":{\"user.name\":\"Malippi Gilma\",\"current_balance\":\"100.00\"}}', NULL, '2024-02-10 06:11:37', '2024-02-10 06:11:37'),
(353, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:11:37', '2024-02-10 06:11:37'),
(354, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:11:58', '2024-02-10 06:11:58'),
(355, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:13:19', '2024-02-10 06:13:19'),
(356, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:13:25', '2024-02-10 06:13:25'),
(357, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 7, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Malippi Gilma\",\"current_balance\":\"180.00\"},\"old\":{\"user.name\":\"Malippi Gilma\",\"current_balance\":\"130.00\"}}', NULL, '2024-02-10 06:13:32', '2024-02-10 06:13:32'),
(358, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:13:32', '2024-02-10 06:13:32'),
(359, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 3, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Arjuna Ranatunga\",\"current_balance\":\"20.00\"},\"old\":{\"user.name\":\"Arjuna Ranatunga\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(360, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 1, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(361, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 11, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"asdf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(362, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:13:53', '2024-02-10 06:13:53'),
(363, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Sanath Jayasooriya\",\"current_balance\":\"15.00\"},\"old\":{\"user.name\":\"Sanath Jayasooriya\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-10 06:13:58', '2024-02-10 06:13:58'),
(364, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:13:58', '2024-02-10 06:13:58'),
(365, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Malippi Gilma\",\"current_balance\":\"100.00\"},\"old\":{\"user.name\":\"Malippi Gilma\",\"current_balance\":\"180.00\"}}', NULL, '2024-02-10 06:53:55', '2024-02-10 06:53:55'),
(366, 'User', 'updated', 'App\\Models\\User', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"Malippi Gilma\",\"email\":\"malpi@gmail.com\"}}', NULL, '2024-02-10 06:53:55', '2024-02-10 06:53:55'),
(367, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:54:12', '2024-02-10 06:54:12'),
(368, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:54:56', '2024-02-10 06:54:56'),
(369, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:55:09', '2024-02-10 06:55:09'),
(370, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:55:34', '2024-02-10 06:55:34'),
(371, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:56:23', '2024-02-10 06:56:23'),
(372, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:56:47', '2024-02-10 06:56:47'),
(373, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:58:13', '2024-02-10 06:58:13'),
(374, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:58:46', '2024-02-10 06:58:46'),
(375, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:59:31', '2024-02-10 06:59:31'),
(376, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 06:59:54', '2024-02-10 06:59:54'),
(377, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:00:45', '2024-02-10 07:00:45'),
(378, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:01:00', '2024-02-10 07:01:00'),
(379, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:01:27', '2024-02-10 07:01:27'),
(380, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:01:37', '2024-02-10 07:01:37'),
(381, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:03:08', '2024-02-10 07:03:08'),
(382, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:05:34', '2024-02-10 07:05:34'),
(383, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:07:17', '2024-02-10 07:07:17'),
(384, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:07:26', '2024-02-10 07:07:26'),
(385, 'User', 'created', 'App\\Models\\User', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(386, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(387, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"name\":\"riazshop\",\"contact_no\":\"01820064106\",\"address\":\"Mirpur-2\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(388, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(389, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 62, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(390, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(391, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(392, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(393, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 66, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(394, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 67, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(395, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 68, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(396, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 69, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(397, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 70, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(398, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:12:07', '2024-02-10 07:12:07'),
(399, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:12:15', '2024-02-10 07:12:15'),
(400, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:13:46', '2024-02-10 07:13:46'),
(401, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:13:58', '2024-02-10 07:13:58'),
(402, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:21:33', '2024-02-10 07:21:33'),
(403, 'smsSettings', 'updated', 'App\\Models\\Backend\\SmsSetting', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"key\":\"reve_status\",\"value\":\"1\"},\"old\":{\"key\":\"reve_status\",\"value\":\"0\"}}', NULL, '2024-02-10 07:22:18', '2024-02-10 07:22:18'),
(404, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:25:04', '2024-02-10 07:25:04'),
(405, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:26:18', '2024-02-10 07:26:18'),
(406, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:26:26', '2024-02-10 07:26:26'),
(407, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:26:49', '2024-02-10 07:26:49'),
(408, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:27:00', '2024-02-10 07:27:00'),
(409, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:28:31', '2024-02-10 07:28:31'),
(410, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:28:40', '2024-02-10 07:28:40'),
(411, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:28:47', '2024-02-10 07:28:47');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(412, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:29:09', '2024-02-10 07:29:09'),
(413, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:30:05', '2024-02-10 07:30:05'),
(414, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:30:22', '2024-02-10 07:30:22'),
(415, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:30:29', '2024-02-10 07:30:29'),
(416, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:32:24', '2024-02-10 07:32:24'),
(417, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:32:34', '2024-02-10 07:32:34'),
(418, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:33:00', '2024-02-10 07:33:00'),
(419, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:33:17', '2024-02-10 07:33:17'),
(420, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:33:47', '2024-02-10 07:33:47'),
(421, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:34:34', '2024-02-10 07:34:34'),
(422, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:35:12', '2024-02-10 07:35:12'),
(423, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:35:25', '2024-02-10 07:35:25'),
(424, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:35:43', '2024-02-10 07:35:43'),
(425, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:36:30', '2024-02-10 07:36:30'),
(426, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-10 07:36:41', '2024-02-10 07:36:41'),
(427, 'User', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 18, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"}}', NULL, '2024-02-11 05:17:23', '2024-02-11 05:17:23'),
(428, 'User', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 18, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"}}', NULL, '2024-02-11 05:17:46', '2024-02-11 05:17:46'),
(429, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"150.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"100.00\"}}', NULL, '2024-02-11 05:18:47', '2024-02-11 05:18:47'),
(430, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"-8250.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"150.00\"}}', NULL, '2024-02-11 05:18:47', '2024-02-11 05:18:47'),
(431, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"8400.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-11 05:18:47', '2024-02-11 05:18:47'),
(432, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"8022.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"8400.00\"}}', NULL, '2024-02-11 05:18:47', '2024-02-11 05:18:47'),
(433, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"adf\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-11 05:18:47', '2024-02-11 05:18:47'),
(434, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:20:35', '2024-02-11 05:20:35'),
(435, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"-8220.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"-8250.00\"}}', NULL, '2024-02-11 05:20:44', '2024-02-11 05:20:44'),
(436, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:20:44', '2024-02-11 05:20:44'),
(437, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:21:06', '2024-02-11 05:21:06'),
(438, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:21:26', '2024-02-11 05:21:26'),
(439, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:23:05', '2024-02-11 05:23:05'),
(440, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:23:41', '2024-02-11 05:23:41'),
(441, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:23:49', '2024-02-11 05:23:49'),
(442, 'User', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-11 05:24:56', '2024-02-11 05:24:56'),
(443, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"8022.00\"}}', NULL, '2024-02-11 05:24:56', '2024-02-11 05:24:56'),
(444, 'User', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 19, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-11 05:25:35', '2024-02-11 05:25:35'),
(445, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"adf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:26:23', '2024-02-11 05:26:23'),
(446, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:26:40', '2024-02-11 05:26:40'),
(447, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:27:08', '2024-02-11 05:27:08'),
(448, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:27:32', '2024-02-11 05:27:32'),
(449, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:27:51', '2024-02-11 05:27:51'),
(450, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:28:17', '2024-02-11 05:28:17'),
(451, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:28:31', '2024-02-11 05:28:31'),
(452, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:30:11', '2024-02-11 05:30:11'),
(453, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:35:58', '2024-02-11 05:35:58'),
(454, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:36:18', '2024-02-11 05:36:18'),
(455, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-11 05:37:19', '2024-02-11 05:37:19'),
(456, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-11 06:54:06', '2024-02-11 06:54:06'),
(457, 'User', 'created', 'App\\Models\\User', 'created', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"email\":\"test2@gmail.com\"}}', NULL, '2024-02-11 07:11:33', '2024-02-11 07:11:33'),
(458, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"test\",\"current_balance\":\"3.00\"}}', NULL, '2024-02-11 07:11:33', '2024-02-11 07:11:33'),
(459, 'User', 'updated', 'App\\Models\\User', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"email\":\"test2@gmail.com\"},\"old\":{\"name\":\"test\",\"email\":\"test2@gmail.com\"}}', NULL, '2024-02-11 07:15:23', '2024-02-11 07:15:23'),
(460, 'User', 'updated', 'App\\Models\\User', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"email\":\"test2@gmail.com\"},\"old\":{\"name\":\"test\",\"email\":\"test2@gmail.com\"}}', NULL, '2024-02-11 07:16:43', '2024-02-11 07:16:43'),
(461, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart - Wennapuwa\",\"phone\":\"+942323423\",\"address\":\"asdfadf\"},\"old\":{\"name\":\"DeliPart - Wennapuwa\",\"phone\":\"009472324567\",\"address\":\"Side Road, Wennapuwa\"}}', NULL, '2024-02-11 23:03:07', '2024-02-11 23:03:07'),
(462, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"phone\":\"+9426546556\",\"address\":\"asdfadf\"}}', NULL, '2024-02-12 00:21:21', '2024-02-12 00:21:21'),
(463, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"phone\":\"+94333333\",\"address\":\"asdad\"},\"old\":{\"name\":\"test\",\"phone\":\"+9426546556\",\"address\":\"asdfadf\"}}', NULL, '2024-02-12 00:22:19', '2024-02-12 00:22:19'),
(464, 'User', 'updated', 'App\\Models\\User', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"email\":\"test2@gmail.com\"},\"old\":{\"name\":\"test\",\"email\":\"test2@gmail.com\"}}', NULL, '2024-02-12 00:32:05', '2024-02-12 00:32:05'),
(465, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"phone\":\"+9423\",\"address\":\"adfasdf\"},\"old\":{\"name\":\"test\",\"phone\":\"+94333333\",\"address\":\"asdad\"}}', NULL, '2024-02-12 00:32:37', '2024-02-12 00:32:37'),
(466, 'User', 'created', 'App\\Models\\User', 'created', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"adf\",\"email\":\"test22@gmail.com\"}}', NULL, '2024-02-12 00:39:20', '2024-02-12 00:39:20'),
(467, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"adf\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-12 00:39:20', '2024-02-12 00:39:20'),
(468, 'User', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"adf\",\"email\":\"test22@gmail.com\"},\"old\":{\"name\":\"adf\",\"email\":\"test22@gmail.com\"}}', NULL, '2024-02-12 00:39:44', '2024-02-12 00:39:44'),
(469, 'User', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"adf\",\"email\":\"test22@gmail.com\"},\"old\":{\"name\":\"adf\",\"email\":\"test22@gmail.com\"}}', NULL, '2024-02-12 00:42:13', '2024-02-12 00:42:13'),
(470, 'Hub', 'created', 'App\\Models\\Backend\\Hub', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"asdfasdf\",\"phone\":\"3333\",\"address\":\"asdfadf\"}}', NULL, '2024-02-12 00:44:46', '2024-02-12 00:44:46'),
(471, 'Hub', 'updated', 'App\\Models\\Backend\\Hub', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"phone\":\"2333\",\"address\":\"asdf\"},\"old\":{\"name\":\"test\",\"phone\":\"+9423\",\"address\":\"adfasdf\"}}', NULL, '2024-02-12 00:45:25', '2024-02-12 00:45:25'),
(472, 'MerchantPayment', 'created', 'App\\Models\\MerchantPayment', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"payment_method\":\"mobile\",\"bank_name\":null,\"holder_name\":\"asdfadsf\",\"account_no\":null,\"branch_name\":null,\"routing_no\":null,\"mobile_company\":\"Bkash\",\"mobile_no\":\"123456789\",\"account_type\":\"Personal\"}}', NULL, '2024-02-12 03:14:42', '2024-02-12 03:14:42'),
(473, 'MerchantPayment', 'deleted', 'App\\Models\\MerchantPayment', 'deleted', 1, 'App\\Models\\User', 1, '{\"old\":{\"merchant.business_name\":\"riazshop\",\"payment_method\":\"mobile\",\"bank_name\":null,\"holder_name\":\"asdfadsf\",\"account_no\":null,\"branch_name\":null,\"routing_no\":null,\"mobile_company\":\"Bkash\",\"mobile_no\":\"123456789\",\"account_type\":\"Personal\"}}', NULL, '2024-02-12 03:16:03', '2024-02-12 03:16:03'),
(474, 'MerchantPayment', 'created', 'App\\Models\\MerchantPayment', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"payment_method\":\"mobile\",\"bank_name\":null,\"holder_name\":\"asdfadsf\",\"account_no\":null,\"branch_name\":null,\"routing_no\":null,\"mobile_company\":\"Bkash\",\"mobile_no\":\"123456789\",\"account_type\":\"Personal\"}}', NULL, '2024-02-12 03:16:03', '2024-02-12 03:16:03'),
(475, 'Account', 'created', 'App\\Models\\Backend\\Account', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"account_holder_name\":\"adsfasdf\",\"account_no\":null,\"gateway\":3}}', NULL, '2024-02-12 03:22:03', '2024-02-12 03:22:03'),
(476, 'Account', 'created', 'App\\Models\\Backend\\Account', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"account_holder_name\":\"asdfa\",\"account_no\":null,\"gateway\":3}}', NULL, '2024-02-12 03:22:22', '2024-02-12 03:22:22'),
(477, 'Account', 'created', 'App\\Models\\Backend\\Account', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"account_holder_name\":\"adfas\",\"account_no\":null,\"gateway\":4}}', NULL, '2024-02-12 03:29:01', '2024-02-12 03:29:01'),
(478, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 37, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"\"}}', NULL, '2024-02-12 03:44:55', '2024-02-12 03:44:55'),
(479, 'User', 'created', 'App\\Models\\User', 'created', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"asdf\",\"email\":\"asdfadf@gmail.com\"}}', NULL, '2024-02-12 03:44:55', '2024-02-12 03:44:55'),
(480, 'User', 'updated', 'App\\Models\\User', 'updated', 21, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"adf\",\"email\":\"test22@gmail.com\"},\"old\":{\"name\":\"adf\",\"email\":\"test22@gmail.com\"}}', NULL, '2024-02-12 05:12:02', '2024-02-12 05:12:02'),
(486, 'User', 'created', 'App\\Models\\User', 'created', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(487, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 40, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/merchant\\/nid\\/2024021211561683683.pdf\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(488, 'Merchant', 'created', 'App\\Models\\Backend\\Merchant', 'created', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(489, 'MerchantShops', 'created', 'App\\Models\\MerchantShops', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"name\":\"riaz\",\"contact_no\":\"01820064106\",\"address\":\"Mirpur-2\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(490, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 71, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":1,\"same_day\":\"50.00\",\"next_day\":\"60.00\",\"sub_city\":\"70.00\",\"outside_city\":\"80.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(491, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 72, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":2,\"same_day\":\"90.00\",\"next_day\":\"100.00\",\"sub_city\":\"110.00\",\"outside_city\":\"120.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(492, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 73, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":3,\"same_day\":\"130.00\",\"next_day\":\"140.00\",\"sub_city\":\"150.00\",\"outside_city\":\"160.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(493, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 74, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":4,\"same_day\":\"170.00\",\"next_day\":\"180.00\",\"sub_city\":\"190.00\",\"outside_city\":\"200.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(494, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 75, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":5,\"same_day\":\"210.00\",\"next_day\":\"220.00\",\"sub_city\":\"230.00\",\"outside_city\":\"240.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(495, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 76, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":6,\"same_day\":\"250.00\",\"next_day\":\"260.00\",\"sub_city\":\"270.00\",\"outside_city\":\"280.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(496, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 77, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":7,\"same_day\":\"290.00\",\"next_day\":\"300.00\",\"sub_city\":\"310.00\",\"outside_city\":\"320.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(497, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 78, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":8,\"same_day\":\"340.00\",\"next_day\":\"350.00\",\"sub_city\":\"360.00\",\"outside_city\":\"370.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(498, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 79, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":9,\"same_day\":\"380.00\",\"next_day\":\"390.00\",\"sub_city\":\"400.00\",\"outside_city\":\"410.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(499, 'MerchantDeliveryCharge', 'created', 'App\\Models\\Backend\\MerchantDeliveryCharge', 'created', 80, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"deliveryCharge.category.title\":\"KG\",\"weight\":10,\"same_day\":\"420.00\",\"next_day\":\"430.00\",\"sub_city\":\"440.00\",\"outside_city\":\"450.00\"}}', NULL, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(500, 'Upload', 'updated', 'App\\Models\\Backend\\Upload', 'updated', 40, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/merchant\\/nid\\/2024021212023191098.pdf\"},\"old\":{\"original\":\"uploads\\/merchant\\/nid\\/2024021211561683683.pdf\"}}', NULL, '2024-02-12 06:02:31', '2024-02-12 06:02:31'),
(501, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-12 06:02:31', '2024-02-12 06:02:31'),
(502, 'Upload', 'updated', 'App\\Models\\Backend\\Upload', 'updated', 40, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/merchant\\/nid\\/2024021212032463089.pdf\"},\"old\":{\"original\":\"uploads\\/merchant\\/nid\\/2024021212023191098.pdf\"}}', NULL, '2024-02-12 06:03:24', '2024-02-12 06:03:24'),
(503, 'User', 'created', 'App\\Models\\User', 'created', 27, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"email\":\"t1@gmail.com\"}}', NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(504, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 41, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305512992834.png\"}}', NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(505, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 42, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305512978772.png\"}}', NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(506, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 43, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305512989200.png\"}}', NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(507, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 44, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305512932596.png\"}}', NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(508, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"test\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(509, 'User', 'created', 'App\\Models\\User', 'created', 28, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"testss\",\"email\":\"testt@gmail.com\"}}', NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(510, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 45, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305534839987.png\"}}', NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(511, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 46, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305534833235.png\"}}', NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(512, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 47, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305534846650.png\"}}', NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(513, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 48, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305534869261.png\"}}', NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(514, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"testss\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(528, 'User', 'created', 'App\\Models\\User', 'created', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"testt\",\"email\":\"a22@gmail.com\"}}', NULL, '2024-02-12 23:57:41', '2024-02-12 23:57:41'),
(529, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 59, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305574165877.png\"}}', NULL, '2024-02-12 23:57:41', '2024-02-12 23:57:41'),
(530, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 60, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305574194003.png\"}}', NULL, '2024-02-12 23:57:41', '2024-02-12 23:57:41'),
(531, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 61, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305574121042.png\"}}', NULL, '2024-02-12 23:57:41', '2024-02-12 23:57:41'),
(532, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 62, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021305574164611.png\"}}', NULL, '2024-02-12 23:57:41', '2024-02-12 23:57:41'),
(533, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"testt\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-12 23:57:41', '2024-02-12 23:57:41'),
(534, 'User', 'updated', 'App\\Models\\User', 'updated', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"testt\",\"email\":\"a22@gmail.com\"},\"old\":{\"name\":\"testt\",\"email\":\"a22@gmail.com\"}}', NULL, '2024-02-13 00:18:40', '2024-02-13 00:18:40'),
(535, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 63, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021306192413570.png\"}}', NULL, '2024-02-13 00:19:24', '2024-02-13 00:19:24'),
(536, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 64, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021306192478792.png\"}}', NULL, '2024-02-13 00:19:24', '2024-02-13 00:19:24'),
(537, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"testt\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"testt\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-13 00:19:24', '2024-02-13 00:19:24'),
(538, 'User', 'updated', 'App\\Models\\User', 'updated', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"testt\",\"email\":\"a22@gmail.com\"},\"old\":{\"name\":\"testt\",\"email\":\"a22@gmail.com\"}}', NULL, '2024-02-13 00:19:24', '2024-02-13 00:19:24'),
(539, 'Upload', 'created', 'App\\Models\\Backend\\Upload', 'created', 65, 'App\\Models\\User', 1, '{\"attributes\":{\"original\":\"uploads\\/deliveryMan\\/image\\/2024021306430771816.apk\"}}', NULL, '2024-02-13 00:43:07', '2024-02-13 00:43:07'),
(540, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"testt\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"testt\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-13 00:43:07', '2024-02-13 00:43:07'),
(541, 'User', 'updated', 'App\\Models\\User', 'updated', 32, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"testt\",\"email\":\"a22@gmail.com\"},\"old\":{\"name\":\"testt\",\"email\":\"a22@gmail.com\"}}', NULL, '2024-02-13 00:43:07', '2024-02-13 00:43:07'),
(542, 'User', 'created', 'App\\Models\\User', 'created', 33, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"test\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-13 03:26:22', '2024-02-13 03:26:22'),
(543, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"test\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-13 03:26:22', '2024-02-13 03:26:22'),
(544, 'DeliveryMan', 'deleted', 'App\\Models\\Backend\\DeliveryMan', 'deleted', 13, 'App\\Models\\User', 1, '{\"old\":{\"user.name\":\"test\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-13 03:27:21', '2024-02-13 03:27:21'),
(545, 'User', 'created', 'App\\Models\\User', 'created', 34, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"asdfasdf\",\"email\":\"wemax.riaz@gmail.com\"}}', NULL, '2024-02-13 04:49:04', '2024-02-13 04:49:04'),
(546, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"asdfasdf\",\"current_balance\":\"3.00\"}}', NULL, '2024-02-13 04:49:04', '2024-02-13 04:49:04'),
(547, 'User', 'deleted', 'App\\Models\\User', 'deleted', 34, 'App\\Models\\User', 1, '{\"old\":{\"name\":\"asdfasdf\",\"email\":\"wemax.riaz@gmail.com\"}}', NULL, '2024-02-13 04:49:29', '2024-02-13 04:49:29'),
(548, 'User', 'created', 'App\\Models\\User', 'created', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"r\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-13 04:49:58', '2024-02-13 04:49:58'),
(549, 'DeliveryMan', 'created', 'App\\Models\\Backend\\DeliveryMan', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"r\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-13 04:49:58', '2024-02-13 04:49:58'),
(550, 'MerchantPayment', 'created', 'App\\Models\\MerchantPayment', 'created', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"payment_method\":\"mobile\",\"bank_name\":null,\"holder_name\":\"555\",\"account_no\":null,\"branch_name\":null,\"routing_no\":null,\"mobile_company\":\"Bkash\",\"mobile_no\":\"55553333333\",\"account_type\":\"Personal\"}}', NULL, '2024-02-13 05:03:42', '2024-02-13 05:03:42'),
(551, 'MerchantPayment', 'created', 'App\\Models\\MerchantPayment', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"payment_method\":\"cash\",\"bank_name\":null,\"holder_name\":null,\"account_no\":null,\"branch_name\":null,\"routing_no\":null,\"mobile_company\":null,\"mobile_no\":null,\"account_type\":null}}', NULL, '2024-02-13 06:04:59', '2024-02-13 06:04:59'),
(552, 'Google map Settings', 'created', 'App\\Models\\Backend\\GoogleMapSetting', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"map_key\":\"AIzaSyCDve4ghJMb9X_S7RpwzAtpxFNq94c-qrQ\"}}', NULL, '2024-02-13 06:30:19', '2024-02-13 06:30:19'),
(553, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Thileepan\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Thileepan\",\"current_balance\":\"30.00\"}}', NULL, '2024-02-13 06:31:01', '2024-02-13 06:31:01'),
(554, 'User', 'updated', 'App\\Models\\User', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"},\"old\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"}}', NULL, '2024-02-13 06:31:01', '2024-02-13 06:31:01'),
(555, 'MerchantShops', 'updated', 'App\\Models\\MerchantShops', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Weligama (Keels)\",\"contact_no\":\"0094762909095\",\"address\":\"Mirpur-1, Dhaka, Bangladesh\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"name\":\"Weligama (Keels)\",\"contact_no\":\"0094762909095\",\"address\":\"Weligama, Sri Lanka.\"}}', NULL, '2024-02-13 06:33:43', '2024-02-13 06:33:43'),
(556, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 06:35:25', '2024-02-13 06:35:25'),
(557, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 06:35:25', '2024-02-13 06:35:25'),
(558, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 06:35:54', '2024-02-13 06:35:54'),
(559, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Thileepan\",\"current_balance\":\"15.00\"},\"old\":{\"user.name\":\"Thileepan\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-13 06:36:00', '2024-02-13 06:36:00'),
(560, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 06:36:00', '2024-02-13 06:36:00'),
(561, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 06:36:15', '2024-02-13 06:36:15'),
(562, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"MIRPUR 11 BUS STOP, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 06:49:22', '2024-02-13 06:49:22'),
(563, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"MIRPUR 11 BUS STOP, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"MIRPUR 11 BUS STOP, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 06:49:22', '2024-02-13 06:49:22'),
(564, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"MIRPUR 11 BUS STOP, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"MIRPUR 11 BUS STOP, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 07:06:57', '2024-02-13 07:06:57'),
(565, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Farmgate, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"MIRPUR 11 BUS STOP, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 07:07:20', '2024-02-13 07:07:20'),
(566, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Thileepan\",\"current_balance\":\"30.00\"},\"old\":{\"user.name\":\"Thileepan\",\"current_balance\":\"15.00\"}}', NULL, '2024-02-13 07:07:28', '2024-02-13 07:07:28'),
(567, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Farmgate, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Farmgate, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 07:07:28', '2024-02-13 07:07:28'),
(568, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Farmgate, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Farmgate, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-13 07:07:39', '2024-02-13 07:07:39'),
(569, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-14 13:50:59', '2024-02-14 13:50:59'),
(570, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Arjuna Ranatunga\",\"current_balance\":\"35.00\"},\"old\":{\"user.name\":\"Arjuna Ranatunga\",\"current_balance\":\"20.00\"}}', NULL, '2024-02-14 13:51:13', '2024-02-14 13:51:13'),
(571, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Wemaxdevs,Dhaka\",\"pickup_phone\":\"+88013000000\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"Mirpur\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-14 13:51:13', '2024-02-14 13:51:13'),
(572, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254784578\",\"customer_address\":\"Mirpur -10\",\"invoice_no\":\"0\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-14 13:51:44', '2024-02-14 13:51:44'),
(582, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-14 14:11:04', '2024-02-14 14:11:04'),
(583, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 14, 'App\\Models\\User', 26, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-14 14:12:52', '2024-02-14 14:12:52'),
(584, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 26, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-14 14:12:52', '2024-02-14 14:12:52'),
(585, 'User', 'updated', 'App\\Models\\User', 'updated', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"}}', NULL, '2024-02-14 14:13:09', '2024-02-14 14:13:09'),
(586, 'Push Notification', 'created', 'App\\Models\\Backend\\PushNotification', 'created', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"Test\",\"description\":\"fffffffff\"}}', NULL, '2024-02-15 16:59:19', '2024-02-15 16:59:19'),
(587, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-15 17:01:40', '2024-02-15 17:01:40'),
(588, 'Push Notification', 'created', 'App\\Models\\Backend\\PushNotification', 'created', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"tello\",\"description\":\"ssssssssss\"}}', NULL, '2024-02-15 17:02:19', '2024-02-15 17:02:19'),
(589, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"r\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"r\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-15 17:27:05', '2024-02-15 17:27:05'),
(590, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"r\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-15 17:28:17', '2024-02-15 17:28:17'),
(591, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:28:41', '2024-02-15 17:28:41'),
(592, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:29:10', '2024-02-15 17:29:10'),
(593, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:29:19', '2024-02-15 17:29:19'),
(594, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-15 17:29:50', '2024-02-15 17:29:50'),
(595, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:29:50', '2024-02-15 17:29:50'),
(596, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:30:20', '2024-02-15 17:30:20'),
(597, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:31:47', '2024-02-15 17:31:47'),
(598, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"}}', NULL, '2024-02-15 17:31:55', '2024-02-15 17:31:55'),
(599, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:31:55', '2024-02-15 17:31:55'),
(600, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-15 17:32:59', '2024-02-15 17:32:59'),
(601, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:32:59', '2024-02-15 17:32:59'),
(602, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-15 17:35:25', '2024-02-15 17:35:25'),
(603, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"}}', NULL, '2024-02-16 09:39:01', '2024-02-16 09:39:01'),
(604, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-16 09:39:01', '2024-02-16 09:39:01'),
(605, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-16 09:41:01', '2024-02-16 09:41:01'),
(606, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-16 09:42:38', '2024-02-16 09:42:38'),
(607, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-16 09:43:33', '2024-02-16 09:43:33'),
(608, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-16 12:22:16', '2024-02-16 12:22:16'),
(609, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 13:45:10', '2024-02-17 13:45:10'),
(610, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 13:52:47', '2024-02-17 13:52:47'),
(611, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 13:57:29', '2024-02-17 13:57:29'),
(612, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"-3.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 13:57:35', '2024-02-17 13:57:35'),
(613, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 13:57:35', '2024-02-17 13:57:35'),
(614, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 13:57:41', '2024-02-17 13:57:41'),
(615, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 13:57:53', '2024-02-17 13:57:53'),
(616, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 13:58:51', '2024-02-17 13:58:51'),
(617, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 13:59:10', '2024-02-17 13:59:10'),
(618, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"-3.00\"}}', NULL, '2024-02-17 14:03:25', '2024-02-17 14:03:25'),
(619, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 14:03:25', '2024-02-17 14:03:25'),
(620, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 14:03:55', '2024-02-17 14:03:55'),
(621, 'User', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 19, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxiwt.wriaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxiwt.wriaz@gmail.com\"}}', NULL, '2024-02-17 14:09:55', '2024-02-17 14:09:55');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(622, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 14:14:02', '2024-02-17 14:14:02'),
(623, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0\",\"selling_price\":\"100\",\"delivery_charge\":210,\"total_delivery_amount\":220,\"current_payable\":-220}}', NULL, '2024-02-17 14:14:02', '2024-02-17 14:14:02'),
(624, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 14:14:02', '2024-02-17 14:14:02'),
(625, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 14:14:23', '2024-02-17 14:14:23'),
(626, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 14:14:41', '2024-02-17 14:14:41'),
(627, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 14:14:41', '2024-02-17 14:14:41'),
(628, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 14:14:59', '2024-02-17 14:14:59'),
(629, 'User', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"W riaz\",\"email\":\"wemaxiwt.wriaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxiwt.wriaz@gmail.com\"}}', NULL, '2024-02-17 14:17:22', '2024-02-17 14:17:22'),
(630, 'User', 'updated', 'App\\Models\\User', 'updated', 26, 'App\\Models\\User', 26, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"}}', NULL, '2024-02-17 14:17:56', '2024-02-17 14:17:56'),
(631, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 14:22:13', '2024-02-17 14:22:13'),
(632, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 14:56:46', '2024-02-17 14:56:46'),
(633, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 14:58:34', '2024-02-17 14:58:34'),
(634, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 14:59:03', '2024-02-17 14:59:03'),
(635, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 15:06:47', '2024-02-17 15:06:47'),
(636, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 15:19:19', '2024-02-17 15:19:19'),
(637, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:28:59', '2024-02-17 15:28:59'),
(638, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0\",\"selling_price\":\"100\",\"delivery_charge\":210,\"total_delivery_amount\":210,\"current_payable\":-247.8}}', NULL, '2024-02-17 15:28:59', '2024-02-17 15:28:59'),
(639, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 15:28:59', '2024-02-17 15:28:59'),
(640, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:29:57', '2024-02-17 15:29:57'),
(641, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"6.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"}}', NULL, '2024-02-17 15:30:27', '2024-02-17 15:30:27'),
(642, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:30:27', '2024-02-17 15:30:27'),
(643, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"6.00\"}}', NULL, '2024-02-17 15:30:38', '2024-02-17 15:30:38'),
(644, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:30:38', '2024-02-17 15:30:38'),
(645, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:30:44', '2024-02-17 15:30:44'),
(646, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:31:00', '2024-02-17 15:31:00'),
(647, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"6.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"3.00\"}}', NULL, '2024-02-17 15:31:21', '2024-02-17 15:31:21'),
(648, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:31:21', '2024-02-17 15:31:21'),
(649, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 15:31:34', '2024-02-17 15:31:34'),
(650, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:31:42', '2024-02-17 15:31:42'),
(651, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 15:45:41', '2024-02-17 15:45:41'),
(652, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"9.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"6.00\"}}', NULL, '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(653, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"9.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"9.00\"}}', NULL, '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(654, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(655, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-60.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(656, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 14, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"asdf\",\"customer_phone\":\"01524654654\",\"customer_address\":\"house 12 road 03, Dhaka 1216, Bangladesh\",\"invoice_no\":\"\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"60.00\",\"current_payable\":\"-60.00\"}}', NULL, '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(657, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"12.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"9.00\"}}', NULL, '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(658, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"12.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"12.00\"}}', NULL, '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(659, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(660, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"-247.80\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(661, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 16, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"ABC\",\"customer_phone\":\"215641654654\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"211\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"210.00\",\"current_payable\":\"-247.80\"}}', NULL, '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(662, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2024-02-17 15:59:09', '2024-02-17 15:59:09'),
(663, 'General Settings', 'updated', 'App\\Models\\Backend\\GeneralSettings', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null},\"old\":{\"phone\":\"20022002\",\"name\":\"Delivery Partner\",\"tracking_id\":null,\"details\":null,\"prefix\":null}}', NULL, '2024-02-17 16:03:04', '2024-02-17 16:03:04'),
(664, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 16:46:14', '2024-02-17 16:46:14'),
(665, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-17 16:47:36', '2024-02-17 16:47:36'),
(666, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"15.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"12.00\"}}', NULL, '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(667, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"15.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"15.00\"}}', NULL, '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(668, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-60.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-60.00\"}}', NULL, '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(669, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-280.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-60.00\"}}', NULL, '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(670, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01685487457\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"1212\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(671, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 16:57:24', '2024-02-17 16:57:24'),
(672, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0\",\"selling_price\":\"100\",\"delivery_charge\":210,\"total_delivery_amount\":220,\"current_payable\":-220}}', NULL, '2024-02-17 16:57:24', '2024-02-17 16:57:24'),
(673, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-280.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-280.00\"}}', NULL, '2024-02-17 16:57:24', '2024-02-17 16:57:24'),
(674, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 16:57:43', '2024-02-17 16:57:43'),
(675, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"18.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"15.00\"}}', NULL, '2024-02-17 16:58:27', '2024-02-17 16:58:27'),
(676, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 16:58:27', '2024-02-17 16:58:27'),
(677, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 17, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 16:58:59', '2024-02-17 16:58:59'),
(678, 'User', 'updated', 'App\\Models\\User', 'updated', 26, 'App\\Models\\User', 26, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"}}', NULL, '2024-02-17 17:00:01', '2024-02-17 17:00:01'),
(679, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 17:00:07', '2024-02-17 17:00:07'),
(680, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"21.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"18.00\"}}', NULL, '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(681, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"21.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"21.00\"}}', NULL, '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(682, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-280.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-280.00\"}}', NULL, '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(683, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-500.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-280.00\"}}', NULL, '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(684, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 17, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(685, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 17, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Barmis Market Area\\/Cox,s Bazar\",\"pickup_phone\":\"01627413327\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01627413327\",\"customer_address\":\"252 W Monipur, Dhaka 1216, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:00:55', '2024-02-17 17:00:55'),
(686, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-17 17:02:32', '2024-02-17 17:02:32'),
(687, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:03:25', '2024-02-17 17:03:25'),
(688, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0\",\"selling_price\":\"100\",\"delivery_charge\":210,\"total_delivery_amount\":220,\"current_payable\":-220}}', NULL, '2024-02-17 17:03:25', '2024-02-17 17:03:25'),
(689, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-500.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-500.00\"}}', NULL, '2024-02-17 17:03:25', '2024-02-17 17:03:25'),
(690, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:03:59', '2024-02-17 17:03:59'),
(691, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"24.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"21.00\"}}', NULL, '2024-02-17 17:04:13', '2024-02-17 17:04:13'),
(692, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:04:13', '2024-02-17 17:04:13'),
(693, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:04:36', '2024-02-17 17:04:36'),
(694, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"27.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"24.00\"}}', NULL, '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(695, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"27.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"27.00\"}}', NULL, '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(696, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-500.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-500.00\"}}', NULL, '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(697, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-720.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-500.00\"}}', NULL, '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(698, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 18, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01254874747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"2121\",\"cash_collection\":\"0.00\",\"selling_price\":\"100.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(699, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-17 17:12:59', '2024-02-17 17:12:59'),
(700, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 17:26:09', '2024-02-17 17:26:09'),
(701, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-17 17:36:14', '2024-02-17 17:36:14'),
(702, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 17:36:35', '2024-02-17 17:36:35'),
(703, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:38:09', '2024-02-17 17:38:09'),
(704, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0\",\"selling_price\":null,\"delivery_charge\":210,\"total_delivery_amount\":220,\"current_payable\":-220}}', NULL, '2024-02-17 17:38:09', '2024-02-17 17:38:09'),
(705, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-720.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-720.00\"}}', NULL, '2024-02-17 17:38:09', '2024-02-17 17:38:09'),
(706, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:38:32', '2024-02-17 17:38:32');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(707, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Bambalapitiya, Colombo - 05\",\"pickup_phone\":\"0094762909090\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"64, Nugegoda, Colombo\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-17 17:38:41', '2024-02-17 17:38:41'),
(708, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:39:08', '2024-02-17 17:39:08'),
(709, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:39:26', '2024-02-17 17:39:26'),
(710, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:39:45', '2024-02-17 17:39:45'),
(711, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:40:13', '2024-02-17 17:40:13'),
(712, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 17:41:34', '2024-02-17 17:41:34'),
(713, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-17 17:44:36', '2024-02-17 17:44:36'),
(714, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:45:06', '2024-02-17 17:45:06'),
(715, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"30.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"27.00\"}}', NULL, '2024-02-17 17:45:31', '2024-02-17 17:45:31'),
(716, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:45:31', '2024-02-17 17:45:31'),
(717, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:45:59', '2024-02-17 17:45:59'),
(718, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"33.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"30.00\"}}', NULL, '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(719, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"33.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"33.00\"}}', NULL, '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(720, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-720.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-720.00\"}}', NULL, '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(721, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-940.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-720.00\"}}', NULL, '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(722, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 19, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib Raj\",\"customer_phone\":\"017454154747\",\"customer_address\":\"435 South Monipur Rd, Dhaka, Bangladesh\",\"invoice_no\":\"12345\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(723, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-18 09:51:08', '2024-02-18 09:51:08'),
(724, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"-940.00\"}}', NULL, '2024-02-18 11:45:48', '2024-02-18 11:45:48'),
(725, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"W riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"W riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-18 11:45:58', '2024-02-18 11:45:58'),
(726, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"},\"old\":{\"user.name\":\"Weerasinge Bandara\",\"business_name\":\"Wharehouse\",\"current_balance\":\"20000.00\"}}', NULL, '2024-02-18 11:46:09', '2024-02-18 11:46:09'),
(727, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"-247.80\"}}', NULL, '2024-02-18 11:46:17', '2024-02-18 11:46:17'),
(728, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"John Keels\",\"business_name\":\"Keels Super\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-18 11:46:28', '2024-02-18 11:46:28'),
(729, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Alphonso Silo\",\"business_name\":\"Alphonso Cafe\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Alphonso Silo\",\"business_name\":\"Alphonso Cafe\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-18 11:46:39', '2024-02-18 11:46:39'),
(730, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-18 11:46:49', '2024-02-18 11:46:49'),
(731, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-18 11:48:09', '2024-02-18 11:48:09'),
(732, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0\",\"selling_price\":null,\"delivery_charge\":210,\"total_delivery_amount\":220,\"current_payable\":-220}}', NULL, '2024-02-18 11:48:09', '2024-02-18 11:48:09'),
(733, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 8, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"business_name\":\"riaz\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-18 11:48:09', '2024-02-18 11:48:09'),
(734, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-18 11:48:25', '2024-02-18 11:48:25'),
(735, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"36.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"33.00\"}}', NULL, '2024-02-18 11:48:36', '2024-02-18 11:48:36'),
(736, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-18 11:48:36', '2024-02-18 11:48:36'),
(737, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 20, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-18 11:49:01', '2024-02-18 11:49:01'),
(738, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 20, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"},\"old\":{\"merchant.business_name\":\"riaz\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Sajib\",\"customer_phone\":\"01745214547\",\"customer_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"invoice_no\":\"1234\",\"cash_collection\":\"0.00\",\"selling_price\":null,\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"220.00\",\"current_payable\":\"-220.00\"}}', NULL, '2024-02-18 11:49:57', '2024-02-18 11:49:57'),
(739, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 1, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-18 11:50:46', '2024-02-18 11:50:46'),
(740, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 9, 'App\\Models\\User', 35, '{\"attributes\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"300.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"63.00\",\"current_payable\":\"237.00\"},\"old\":{\"merchant.business_name\":\"riazshop\",\"pickup_address\":\"Mirpur-2\",\"pickup_phone\":\"01820064106\",\"customer_name\":\"Islam\",\"customer_phone\":\"0156465156\",\"customer_address\":\"asdfadsf\",\"invoice_no\":\"\",\"cash_collection\":\"1000.00\",\"selling_price\":null,\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"70.00\",\"current_payable\":\"930.00\"}}', NULL, '2024-02-18 11:51:22', '2024-02-18 11:51:22'),
(741, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"39.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"36.00\"}}', NULL, '2024-02-18 11:51:23', '2024-02-18 11:51:23'),
(742, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"-261.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"39.00\"}}', NULL, '2024-02-18 11:51:23', '2024-02-18 11:51:23'),
(743, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"W riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"300.00\"},\"old\":{\"user.name\":\"W riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-18 11:51:23', '2024-02-18 11:51:23'),
(744, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 35, '{\"attributes\":{\"user.name\":\"W riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"237.00\"},\"old\":{\"user.name\":\"W riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"300.00\"}}', NULL, '2024-02-18 11:51:23', '2024-02-18 11:51:23'),
(745, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-19 17:35:07', '2024-02-19 17:35:07'),
(746, 'Config', 'updated', 'App\\Models\\Config', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"key\":\"next_day\",\"value\":\"0\"},\"old\":{\"key\":\"next_day\",\"value\":\"1\"}}', NULL, '2024-02-19 18:19:52', '2024-02-19 18:19:52'),
(747, 'Config', 'updated', 'App\\Models\\Config', 'updated', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"key\":\"next_day\",\"value\":\"1\"},\"old\":{\"key\":\"next_day\",\"value\":\"0\"}}', NULL, '2024-02-19 18:20:02', '2024-02-19 18:20:02'),
(748, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@ezycloud.xyz\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@wemaxdevs.com\"}}', NULL, '2024-02-19 18:23:35', '2024-02-19 18:23:35'),
(749, 'User', 'updated', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Delivery Partner\",\"email\":\"admin@ezycloud.xyz\"},\"old\":{\"name\":\"Delivery Partner\",\"email\":\"admin@ezycloud.xyz\"}}', NULL, '2024-02-19 18:24:54', '2024-02-19 18:24:54'),
(750, 'User', 'updated', 'App\\Models\\User', 'updated', 26, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"riaz\",\"email\":\"riaz@ezycloud.xyz\"},\"old\":{\"name\":\"riaz\",\"email\":\"riaz@gmail.com\"}}', NULL, '2024-02-19 18:26:28', '2024-02-19 18:26:28'),
(751, 'User', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"M Riaz\",\"email\":\"mohammed@ezycloud.xyz\"},\"old\":{\"name\":\"W riaz\",\"email\":\"wemaxiwt.wriaz@gmail.com\"}}', NULL, '2024-02-19 18:27:13', '2024-02-19 18:27:13'),
(752, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"M Riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"M Riaz\",\"business_name\":\"riazshop\",\"current_balance\":\"237.00\"}}', NULL, '2024-02-19 18:27:13', '2024-02-19 18:27:13'),
(753, 'User', 'updated', 'App\\Models\\User', 'updated', 19, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"M Riaz\",\"email\":\"mohammed@ezycloud.xyz\"},\"old\":{\"name\":\"M Riaz\",\"email\":\"mohammed@ezycloud.xyz\"}}', NULL, '2024-02-19 18:28:10', '2024-02-19 18:28:10'),
(754, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 15, 'App\\Models\\User', 1, '{\"attributes\":{\"user.name\":\"riaz\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"riaz\",\"current_balance\":\"-261.00\"}}', NULL, '2024-02-19 18:30:51', '2024-02-19 18:30:51'),
(755, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Mansoor Mart\",\"email\":\"mansoor@gmail.com\"},\"old\":{\"name\":\"riaz\",\"email\":\"wemaxit.riaz@gmail.com\"}}', NULL, '2024-02-19 18:30:51', '2024-02-19 18:30:51'),
(756, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Mansoor DM\",\"email\":\"mansoor@gmail.com\"},\"old\":{\"name\":\"Mansoor Mart\",\"email\":\"mansoor@gmail.com\"}}', NULL, '2024-02-19 18:31:21', '2024-02-19 18:31:21'),
(757, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"kamala Kannan\",\"email\":\"kamalakannan@gmail.com\"},\"old\":{\"name\":\"Mansoor DM\",\"email\":\"mansoor@gmail.com\"}}', NULL, '2024-02-19 18:35:47', '2024-02-19 18:35:47'),
(758, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2024-02-19 18:37:54', '2024-02-19 18:37:54'),
(759, 'Role', 'updated', 'App\\Models\\Backend\\Role', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPart (Head)\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"hub_view\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"user_read\",\"user_create\",\"user_update\",\"user_delete\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"hub_payment_request_delete\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"cash_received_from_delivery_man_delete\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]},\"old\":{\"name\":\"DeliPart (Head)\",\"permissions\":[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_incharge_read\",\"hub_view\",\"account_read\",\"income_read\",\"expense_read\",\"todo_read\",\"fund_transfer_read\",\"fund_transfer_update\",\"role_read\",\"designation_read\",\"department_read\",\"user_read\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_reject\",\"hub_payment_process\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]}}', NULL, '2024-02-19 18:42:09', '2024-02-19 18:42:09'),
(760, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2024-02-19 18:50:23', '2024-02-19 18:50:23'),
(761, 'User', 'updated', 'App\\Models\\User', 'updated', 35, 'App\\Models\\User', 35, '{\"attributes\":{\"name\":\"kamala Kannan\",\"email\":\"kamalakannan@gmail.com\"},\"old\":{\"name\":\"kamala Kannan\",\"email\":\"kamalakannan@gmail.com\"}}', NULL, '2024-02-19 19:42:00', '2024-02-19 19:42:00'),
(762, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 2, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"},\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Weligama, Sri Lanka.\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Gulappi Raja\",\"customer_phone\":\"0094782343434\",\"customer_address\":\"23, Vijitha Road, Pamankada.\",\"invoice_no\":\"KEE342983\",\"cash_collection\":\"14286.65\",\"selling_price\":\"1200.00\",\"delivery_charge\":\"50.00\",\"total_delivery_amount\":\"222.87\",\"current_payable\":\"14063.78\"}}', NULL, '2024-02-19 19:56:02', '2024-02-19 19:56:02'),
(763, 'DeliveryMan', 'updated', 'App\\Models\\Backend\\DeliveryMan', 'updated', 6, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Thileepan\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Thileepan\",\"current_balance\":\"30.00\"}}', NULL, '2024-02-19 20:00:57', '2024-02-19 20:00:57'),
(764, 'User', 'updated', 'App\\Models\\User', 'updated', 13, 'App\\Models\\User', 2, '{\"attributes\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"},\"old\":{\"name\":\"Thileepan\",\"email\":\"thileepan@deliverypartners.com\"}}', NULL, '2024-02-19 20:00:57', '2024-02-19 20:00:57'),
(765, 'parcel', 'deleted', 'App\\Models\\Backend\\Parcel', 'deleted', 13, 'App\\Models\\User', 2, '{\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Farmgate, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-19 20:02:19', '2024-02-19 20:02:19'),
(766, 'parcel', 'deleted', 'App\\Models\\Backend\\Parcel', 'deleted', 12, 'App\\Models\\User', 2, '{\"old\":{\"merchant.business_name\":\"Keels Super\",\"pickup_address\":\"Mirpur-1, Dhaka, Bangladesh\",\"pickup_phone\":\"0094762909095\",\"customer_name\":\"Dhanapaal Govindan\",\"customer_phone\":\"0094780454545\",\"customer_address\":\"Mirpur-10, Dhaka, Bangladesh\",\"invoice_no\":\"DP342107\",\"cash_collection\":\"8400.00\",\"selling_price\":\"7300.00\",\"delivery_charge\":\"0.00\",\"total_delivery_amount\":\"378.00\",\"current_payable\":\"8022.00\"}}', NULL, '2024-02-19 20:02:31', '2024-02-19 20:02:31'),
(767, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 21, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"Danapal Ramu\",\"customer_phone\":\"+94777987654\",\"customer_address\":\"127 Veluwanarama Rd, Colombo, Sri Lanka\",\"invoice_no\":\"#4585265\",\"cash_collection\":\"6500.00\",\"selling_price\":\"4800.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"275.00\",\"current_payable\":\"6175.50\"}}', NULL, '2024-02-19 20:04:50', '2024-02-19 20:04:50'),
(768, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 21, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"Danapal Ramu\",\"customer_phone\":\"+94777987654\",\"customer_address\":\"127 Veluwanarama Rd, Colombo, Sri Lanka\",\"invoice_no\":\"#4585265\",\"cash_collection\":\"6500.00\",\"selling_price\":\"4800.00\",\"delivery_charge\":\"210.00\",\"total_delivery_amount\":\"275.00\",\"current_payable\":\"6175.50\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"Danapal Ramu\",\"customer_phone\":\"+94777987654\",\"customer_address\":\"127 Veluwanarama Rd, Colombo, Sri Lanka\",\"invoice_no\":\"#4585265\",\"cash_collection\":\"6500\",\"selling_price\":\"4800\",\"delivery_charge\":210,\"total_delivery_amount\":275,\"current_payable\":6175.5}}', NULL, '2024-02-19 20:04:50', '2024-02-19 20:04:50'),
(769, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-19 20:04:50', '2024-02-19 20:04:50'),
(770, 'parcel', 'created', 'App\\Models\\Backend\\Parcel', 'created', 22, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"Danapal Ramu\",\"customer_phone\":\"+94777987654\",\"customer_address\":\"41 Sri Saranankara Rd, Dehiwala-Mount Lavinia, Sri Lanka\",\"invoice_no\":\"#DF985452\",\"cash_collection\":\"6500.00\",\"selling_price\":\"4800.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"125.00\",\"current_payable\":\"6352.50\"}}', NULL, '2024-02-19 20:06:03', '2024-02-19 20:06:03'),
(771, 'parcel', 'updated', 'App\\Models\\Backend\\Parcel', 'updated', 22, 'App\\Models\\User', 2, '{\"attributes\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"Danapal Ramu\",\"customer_phone\":\"+94777987654\",\"customer_address\":\"41 Sri Saranankara Rd, Dehiwala-Mount Lavinia, Sri Lanka\",\"invoice_no\":\"#DF985452\",\"cash_collection\":\"6500.00\",\"selling_price\":\"4800.00\",\"delivery_charge\":\"60.00\",\"total_delivery_amount\":\"125.00\",\"current_payable\":\"6352.50\"},\"old\":{\"merchant.business_name\":\"Cargills Food City - Pettah\",\"pickup_address\":\"Main Street, Pettah.\",\"pickup_phone\":\"0094777123459\",\"customer_name\":\"Danapal Ramu\",\"customer_phone\":\"+94777987654\",\"customer_address\":\"41 Sri Saranankara Rd, Dehiwala-Mount Lavinia, Sri Lanka\",\"invoice_no\":\"#DF985452\",\"cash_collection\":\"6500\",\"selling_price\":\"4800\",\"delivery_charge\":60,\"total_delivery_amount\":125,\"current_payable\":6352.5}}', NULL, '2024-02-19 20:06:03', '2024-02-19 20:06:03'),
(772, 'Merchant', 'updated', 'App\\Models\\Backend\\Merchant', 'updated', 4, 'App\\Models\\User', 2, '{\"attributes\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"},\"old\":{\"user.name\":\"Rupasinghe Ruwan\",\"business_name\":\"Cargills Food City - Pettah\",\"current_balance\":\"0.00\"}}', NULL, '2024-02-19 20:06:03', '2024-02-19 20:06:03'),
(773, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@deliverypartners.com\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@ezycode.lk\"}}', NULL, '2024-02-19 20:31:10', '2024-02-19 20:31:10'),
(774, 'User', 'updated', 'App\\Models\\User', 'updated', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"DeliPartner\",\"email\":\"admin@deliverypartners.com\"},\"old\":{\"name\":\"DeliPartner\",\"email\":\"admin@deliverypartners.com\"}}', NULL, '2024-02-19 20:40:31', '2024-02-19 20:40:31'),
(775, 'User', 'updated', 'App\\Models\\User', 'updated', 22, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"asdf 123\",\"email\":\"asdfadf_123@gmail.com\"},\"old\":{\"name\":\"asdf\",\"email\":\"asdfadf@gmail.com\"}}', NULL, '2024-02-19 20:43:32', '2024-02-19 20:43:32'),
(776, 'User', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"}}', NULL, '2024-02-19 20:45:34', '2024-02-19 20:45:34'),
(777, 'User', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"islam_02@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"islam@gmail.com\"}}', NULL, '2024-02-19 20:45:49', '2024-02-19 20:45:49'),
(778, 'User', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"islam_02@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"islam_02@gmail.com\"}}', NULL, '2024-02-19 20:47:01', '2024-02-19 20:47:01'),
(779, 'User', 'updated', 'App\\Models\\User', 'updated', 18, 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"Islam\",\"email\":\"nurul_islam@gmail.com\"},\"old\":{\"name\":\"Islam\",\"email\":\"islam_02@gmail.com\"}}', NULL, '2024-02-19 20:50:26', '2024-02-19 20:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `unique_identifier` varchar(191) DEFAULT NULL,
  `version` varchar(191) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `purchase_code` longtext DEFAULT NULL,
  `activated` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetcategories`
--

CREATE TABLE `assetcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `assetcategory_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplyer_name` varchar(191) DEFAULT NULL,
  `quantity` varchar(191) DEFAULT NULL,
  `warranty` varchar(191) DEFAULT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `amount` decimal(13,2) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transactions`
--

CREATE TABLE `bank_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Admin,5=hub',
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_id` bigint(20) DEFAULT NULL,
  `fund_transfer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'income=1, expense=2',
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `cash_received_dvry` varchar(191) DEFAULT NULL,
  `income_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_transactions`
--

INSERT INTO `bank_transactions` (`id`, `user_type`, `hub_id`, `expense_id`, `fund_transfer_id`, `account_id`, `type`, `amount`, `date`, `note`, `cash_received_dvry`, `income_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 1, 1, 3.00, '2024-02-12', 'Account Openning balance', NULL, NULL, '2024-02-12 03:22:03', '2024-02-12 03:22:03'),
(2, 1, NULL, NULL, NULL, 2, 1, 3.00, '2024-02-12', 'Account Openning balance', NULL, NULL, '2024-02-12 03:22:22', '2024-02-12 03:22:22'),
(3, 1, NULL, NULL, NULL, 3, 1, 22.00, '2024-02-12', 'Account Openning balance', NULL, NULL, '2024-02-12 03:29:01', '2024-02-12 03:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `views` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `image_id`, `description`, `position`, `status`, `created_by`, `views`, `created_at`, `updated_at`) VALUES
(1, 'Aliquid ipsa ipsum rerum repellat saepe nihil facilis.', NULL, 'Quod sunt enim quia ut beatae sed deserunt aspernatur animi qui hic doloribus voluptatem ea blanditiis nulla tenetur quia consequatur non qui numquam beatae qui harum temporibus saepe et incidunt quae optio distinctio saepe rerum eum reiciendis quia doloribus et laborum dolor ut aut voluptatem et hic eum quo sit veniam harum dignissimos laborum molestiae fuga at voluptates architecto corporis omnis officia praesentium fugit rerum debitis et sapiente ipsam perferendis ut consequatur placeat sint repellendus ex dignissimos nesciunt quasi inventore reiciendis et necessitatibus eum deleniti dicta ut eaque est reiciendis ullam alias vel dolor minus delectus commodi quaerat ut maiores voluptatem necessitatibus iste.', '0', 1, 1, '14', '2023-12-08 18:13:22', '2024-02-06 21:15:55'),
(2, 'Quia magnam omnis et sit doloremque ipsa ipsa doloremque.', NULL, 'Minima nemo quia architecto ut necessitatibus ut commodi dolorem officiis corrupti autem sunt labore in qui magnam accusamus sint eum quis excepturi non exercitationem est est minus placeat perferendis ut quibusdam aut deserunt est sed voluptates expedita debitis est sed minus harum quibusdam voluptas rerum omnis aut eaque voluptas ut assumenda asperiores tempore debitis cumque harum maiores maxime reprehenderit ut placeat officiis animi quisquam consequatur exercitationem accusamus rerum atque nisi occaecati eligendi repellat facilis minus modi consequuntur sapiente quis eligendi praesentium dolor placeat accusantium sit magni reiciendis alias non laudantium qui ullam vel sit quibusdam et laborum vitae doloremque a corrupti laboriosam enim voluptatibus qui cum.', '1', 1, 1, '15', '2023-12-08 18:13:22', '2024-02-06 21:15:55'),
(3, 'Ut aut minus sit enim repellat aut aut.', NULL, 'Et quam magni qui debitis ratione enim aut voluptatibus est in consequatur ut est facere laboriosam nihil molestiae repellendus sapiente voluptatem a error rerum est magni non ea aliquid ad nisi voluptas officia quia enim fugit ullam facere qui placeat harum facere totam esse libero sit aspernatur sed unde nulla adipisci quo repellat aperiam doloremque est architecto est ut velit officiis repellat tenetur est ad qui doloribus saepe vel nesciunt fugiat odio sapiente et qui ipsum omnis asperiores et cupiditate dolor enim enim ut ratione quos quisquam recusandae iusto vero dolores quisquam consequatur reprehenderit.', '2', 1, 1, '16', '2023-12-08 18:13:22', '2024-02-06 21:15:55'),
(4, 'Necessitatibus quia aliquam quis veritatis dignissimos ut cum fuga.', NULL, 'Omnis soluta vero soluta nobis architecto non sint ut voluptatem voluptatem rem ut vitae voluptas inventore commodi sit similique temporibus qui aut laboriosam eius occaecati quo culpa architecto ducimus veniam sit sunt iusto aut magni voluptas sit at mollitia sunt quis occaecati quos quia tenetur architecto ut vitae consequatur dolores rerum natus omnis corrupti rerum voluptatem illo modi autem sed dolorem consectetur repellendus maxime corrupti nihil provident qui dignissimos ipsa et similique accusantium voluptas aut inventore voluptas dolorem optio sit nobis neque nesciunt amet minus velit ut voluptas omnis enim molestiae doloribus tempore cumque nulla eos aspernatur autem non quas architecto ipsum possimus dicta quaerat et molestias et eligendi aut enim ratione quia earum vel non est voluptatem dolorem itaque cumque omnis fuga tempore quos.', '3', 1, 1, '14', '2023-12-08 18:13:22', '2024-02-18 10:22:44'),
(5, 'Consequatur magni consequatur voluptas quo enim inventore occaecati totam.', NULL, 'Harum omnis pariatur voluptatem repellendus quia facilis quisquam nostrum sequi repellat aliquam praesentium consequuntur aut quia et voluptatem pariatur reiciendis fugiat ratione eaque eligendi provident voluptatum deleniti sit totam officia sed molestiae quo quis et labore quia possimus ipsam necessitatibus soluta veniam possimus quaerat rerum voluptatem laborum suscipit aperiam eos eius maxime qui ducimus amet incidunt ipsum rerum quas ipsum est occaecati nam excepturi vitae magnam commodi qui unde recusandae aut enim quam doloremque dolores ad ea rerum debitis debitis tenetur quia alias inventore placeat et et mollitia quo.', '4', 1, 1, '15', '2023-12-08 18:13:22', '2024-02-18 19:21:07'),
(6, 'Non omnis eaque sed mollitia ipsam sed laborum cupiditate ipsum perspiciatis.', NULL, 'Aut ab ullam assumenda sed perferendis exercitationem illum ipsum est omnis nobis dolorum tempore asperiores sunt voluptatem sit nobis non at libero dolor aliquam et perspiciatis assumenda veniam et quaerat cumque amet voluptatem explicabo maiores ex porro praesentium incidunt voluptatem laudantium enim qui enim inventore earum dignissimos quae molestiae cupiditate aliquid officiis quisquam libero ullam et adipisci incidunt eum rerum tempore ipsum quaerat velit autem qui ipsum laboriosam eum iure temporibus aut et alias sed excepturi ut omnis architecto a iusto et aut in culpa sit quos error aliquam deserunt at eum fugit exercitationem molestiae reiciendis vero aut voluptatibus autem nihil alias sit reiciendis enim ut id voluptatem ut et porro sunt sed qui veritatis sapiente aut qui id repudiandae esse impedit aliquid quo consequatur molestiae modi dolorum quis voluptatibus et cumque labore.', '5', 1, 1, '7', '2023-12-08 18:13:22', '2024-02-04 00:12:11'),
(7, 'Nulla repellat aut enim incidunt est qui distinctio temporibus voluptates.', NULL, 'Odio est totam ad fugiat aspernatur sit magni et mollitia accusantium commodi quis est quia eveniet soluta ut voluptatem quia corporis perferendis molestiae consectetur consectetur dolorum neque praesentium maxime dolores totam tenetur eos fugiat eius vel voluptatum similique nostrum est sapiente est eveniet nemo libero ipsa nam at ut nesciunt necessitatibus impedit excepturi eius et est provident ut rerum sapiente velit sed blanditiis a quia alias nobis accusamus doloribus natus sint recusandae autem quas atque nulla qui assumenda labore nihil.', '6', 1, 1, '8', '2023-12-08 18:13:22', '2024-02-08 19:28:49'),
(8, 'Sunt veritatis sint saepe culpa sed fugiat aut aut error odio.', NULL, 'Et eos officiis asperiores ea voluptatem aspernatur velit id id ut repellendus qui vel voluptatem aut error quasi repellendus similique atque repellendus optio consequatur voluptates sapiente et sed unde voluptatem aut distinctio non aut dignissimos saepe hic sed molestiae ad nihil est et quisquam iste perspiciatis fugiat natus nihil voluptatibus nobis qui enim quo voluptatem eos minima sed voluptas delectus minima deleniti incidunt totam nisi quam odio sint saepe ut magni architecto dolores deleniti dolorem est quo magni neque ut omnis eaque culpa nesciunt tenetur esse molestias accusantium ut ipsa quisquam et voluptatum et excepturi voluptatem placeat dolor quos aliquid porro delectus quasi ipsum ut architecto et qui sed incidunt ducimus beatae accusantium ut quia qui amet voluptatem necessitatibus unde deserunt ut rerum est est omnis soluta consequuntur hic culpa consectetur aut aliquam consequatur quas.', '7', 1, 1, '7', '2023-12-08 18:13:22', '2024-02-08 23:12:03'),
(9, 'Aut fugit dolore qui totam quaerat et.', NULL, 'Ut similique illo ducimus dolores recusandae consequatur ducimus recusandae ullam in aspernatur quidem quod aliquam architecto rerum quos perferendis et nam corporis sed fugiat perspiciatis harum soluta id qui odit vero animi in vel suscipit quis id est dolorum qui voluptatem reiciendis placeat quibusdam sed qui voluptate laboriosam enim vitae incidunt iure maxime molestias nemo quo et ut est aut provident tempore et sit et non qui.', '8', 1, 1, '10', '2023-12-08 18:13:22', '2024-02-09 05:05:39'),
(10, 'Dolorem tenetur eveniet omnis excepturi aliquid similique adipisci dolorem.', NULL, 'Molestiae voluptatem architecto autem voluptatem consequatur soluta fugiat officiis saepe dolores officia nihil ut sit atque sit ut accusamus consequatur iste facilis eos ratione minus repellendus eius possimus quod eius qui iusto est modi enim doloribus voluptas rem corrupti harum in rerum sed debitis suscipit dolorem nihil minima fugiat et ut quia hic iusto facere incidunt temporibus nam non praesentium sint consequatur recusandae non cumque et facilis modi eum quia et cum quisquam rem libero praesentium earum assumenda at aliquam qui error maiores eligendi illo incidunt est ut qui officia cupiditate dolor.', '9', 1, 1, '9', '2023-12-08 18:13:22', '2024-02-09 10:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `cash_received_from_deliverymen`
--

CREATE TABLE `cash_received_from_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `receipt` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'fragile_liquid_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 'fragile_liquid_charge', '20', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 'same_day', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 'next_day', '1', '2023-12-08 18:13:21', '2024-02-19 18:20:02'),
(5, 'sub_city', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 'outside_City', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `courier_statements`
--

CREATE TABLE `courier_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `income_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_id` bigint(20) DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'income=1,expense=2',
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courier_statements`
--

INSERT INTO `courier_statements` (`id`, `income_id`, `expense_id`, `parcel_id`, `delivery_man_id`, `type`, `amount`, `date`, `note`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 4, 6, 2, 15.00, '2024-02-01', 'Parcel Received Warehouse To Courier Expense', '2024-02-01 14:41:56', '2024-02-01 14:41:56'),
(2, NULL, NULL, 8, 1, 2, 20.00, '2024-02-01', 'Parcel Received Warehouse To Courier Expense', '2024-02-01 15:19:35', '2024-02-01 15:19:35'),
(3, NULL, NULL, 2, 6, 2, 15.00, '2024-02-07', 'Parcel Received Warehouse To Courier Expense', '2024-02-07 16:11:14', '2024-02-07 16:11:14'),
(4, NULL, NULL, 3, 5, 2, 15.00, '2024-02-10', 'Parcel Received Warehouse To Courier Expense', '2024-02-10 04:16:19', '2024-02-10 04:16:19'),
(7, NULL, NULL, 11, 3, 2, 20.00, '2024-02-10', 'statementNote.return_to_merchant__deliveryman_statement', '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(8, NULL, NULL, 11, 3, 1, 0.00, '2024-02-10', 'statementNote.return_received_by_statement', '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(9, NULL, NULL, 10, 2, 2, 15.00, '2024-02-10', 'Parcel Received Warehouse To Courier Expense', '2024-02-10 06:13:58', '2024-02-10 06:13:58'),
(15, NULL, NULL, 1, 3, 2, 15.00, '2024-02-14', 'Parcel Received Warehouse To Courier Expense', '2024-02-14 13:51:13', '2024-02-14 13:51:13'),
(16, NULL, NULL, 14, 15, 2, 3.00, '2024-02-15', 'Parcel Received Warehouse To Courier Expense', '2024-02-15 17:29:50', '2024-02-15 17:29:50'),
(17, NULL, NULL, 14, 15, 1, 3.00, '2024-02-15', 'Parcel Received Warehouse Cancel To Courier Income', '2024-02-15 17:31:55', '2024-02-15 17:31:55'),
(18, NULL, NULL, 14, 15, 2, 3.00, '2024-02-15', 'Parcel Received Warehouse To Courier Expense', '2024-02-15 17:32:59', '2024-02-15 17:32:59'),
(19, NULL, NULL, 14, 15, 1, 3.00, '2024-02-17', 'Parcel Received Warehouse Cancel To Courier Income', '2024-02-17 13:57:35', '2024-02-17 13:57:35'),
(20, NULL, NULL, 14, 15, 2, 3.00, '2024-02-17', 'Parcel Received Warehouse To Courier Expense', '2024-02-17 14:03:25', '2024-02-17 14:03:25'),
(21, NULL, NULL, 15, 15, 2, 3.00, '2024-02-17', 'Parcel Received Warehouse To Courier Expense', '2024-02-17 14:14:41', '2024-02-17 14:14:41'),
(22, NULL, NULL, 16, 15, 2, 3.00, '2024-02-17', 'Parcel Received Warehouse To Courier Expense', '2024-02-17 15:30:27', '2024-02-17 15:30:27'),
(23, NULL, NULL, 16, 15, 1, 3.00, '2024-02-17', 'Parcel Received Warehouse Cancel To Courier Income', '2024-02-17 15:30:38', '2024-02-17 15:30:38'),
(24, NULL, NULL, 16, 15, 2, 3.00, '2024-02-17', 'Parcel Received Warehouse To Courier Expense', '2024-02-17 15:31:21', '2024-02-17 15:31:21'),
(25, NULL, NULL, 14, 15, 2, 3.00, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(26, NULL, NULL, 14, 15, 1, 60.00, '2024-02-17', 'Parcel Delivered  To Merchant Courier Expense ', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(27, NULL, NULL, 16, 15, 2, 3.00, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(28, NULL, NULL, 16, 15, 1, 210.00, '2024-02-17', 'Parcel Delivered  To Merchant Courier Expense ', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(29, NULL, NULL, 15, 15, 2, 3.00, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(30, NULL, NULL, 15, 15, 1, 220.00, '2024-02-17', 'Parcel Delivered  To Merchant Courier Expense ', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(31, NULL, NULL, 17, 15, 2, 3.00, '2024-02-17', 'Parcel Received Warehouse To Courier Expense', '2024-02-17 16:58:27', '2024-02-17 16:58:27'),
(32, NULL, NULL, 17, 15, 2, 3.00, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(33, NULL, NULL, 17, 15, 1, 220.00, '2024-02-17', 'Parcel Delivered  To Merchant Courier Expense ', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(34, NULL, NULL, 18, 15, 2, 3.00, '2024-02-17', 'Parcel Received Warehouse To Courier Expense', '2024-02-17 17:04:13', '2024-02-17 17:04:13'),
(35, NULL, NULL, 18, 15, 2, 3.00, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(36, NULL, NULL, 18, 15, 1, 220.00, '2024-02-17', 'Parcel Delivered  To Merchant Courier Expense ', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(37, NULL, NULL, 19, 15, 2, 3.00, '2024-02-17', 'Parcel Received Warehouse To Courier Expense', '2024-02-17 17:45:31', '2024-02-17 17:45:31'),
(38, NULL, NULL, 19, 15, 2, 3.00, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(39, NULL, NULL, 19, 15, 1, 220.00, '2024-02-17', 'Parcel Delivered  To Merchant Courier Expense ', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(40, NULL, NULL, 20, 15, 2, 3.00, '2024-02-18', 'Parcel Received Warehouse To Courier Expense', '2024-02-18 11:48:36', '2024-02-18 11:48:36'),
(41, NULL, NULL, 9, 15, 2, 3.00, '2024-02-18', 'Parcel Delivered To Deliveryman Income', '2024-02-18 11:51:23', '2024-02-18 11:51:23'),
(42, NULL, NULL, 9, 15, 1, 63.00, '2024-02-18', 'Parcel Partial Delivered  To Merchant Courier Expense ', '2024-02-18 11:51:23', '2024-02-18 11:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `exchange_rate` decimal(16,2) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `name`, `symbol`, `code`, `exchange_rate`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'Lek', 'ALL', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(2, 'America', 'Dollars', '$', 'USD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(3, 'Afghanistan', 'Afghanis', '؋', 'AF', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(4, 'Argentina', 'Pesos', '$', 'ARS', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(5, 'Aruba', 'Guilders', 'ƒ', 'AWG', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(6, 'Australia', 'Dollars', '$', 'AUD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(7, 'Azerbaijan', 'New Manats', 'ман', 'AZ', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(8, 'Bahamas', 'Dollars', '$', 'BSD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(9, 'Barbados', 'Dollars', '$', 'BBD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(10, 'Belarus', 'Rubles', 'p.', 'BYR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(11, 'Belgium', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(12, 'Beliz', 'Dollars', 'BZ$', 'BZD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(13, 'Bermuda', 'Dollars', '$', 'BMD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(14, 'Bolivia', 'Bolivianos', '$b', 'BOB', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'KM', 'BAM', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(16, 'Botswana', 'Pula\'s', 'P', 'BWP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(17, 'Bulgaria', 'Leva', 'лв', 'BG', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(18, 'Brazil', 'Reais', 'R$', 'BRL', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(19, 'Britain [United Kingdom]', 'Pounds', '£', 'GBP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(20, 'Brunei Darussalam', 'Dollars', '$', 'BND', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(21, 'Cambodia', 'Riels', '៛', 'KHR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(22, 'Canada', 'Dollars', '$', 'CAD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(23, 'Cayman Islands', 'Dollars', '$', 'KYD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(24, 'Chile', 'Pesos', '$', 'CLP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(25, 'China', 'Yuan Renminbi', '¥', 'CNY', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(26, 'Colombia', 'Pesos', '$', 'COP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(27, 'Costa Rica', 'Colón', '₡', 'CRC', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(28, 'Croatia', 'Kuna', 'kn', 'HRK', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(29, 'Cuba', 'Pesos', '₱', 'CUP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(30, 'Cyprus', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(31, 'Czech Republic', 'Koruny', 'Kč', 'CZK', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(32, 'Denmark', 'Kroner', 'kr', 'DKK', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(33, 'Dominican Republic', 'Pesos', 'RD$', 'DOP ', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(34, 'East Caribbean', 'Dollars', '$', 'XCD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(35, 'Egypt', 'Pounds', '£', 'EGP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(36, 'El Salvador', 'Colones', '$', 'SVC', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(37, 'England [United Kingdom]', 'Pounds', '£', 'GBP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(38, 'Euro', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(39, 'Falkland Islands', 'Pounds', '£', 'FKP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(40, 'Fiji', 'Dollars', '$', 'FJD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(41, 'France', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(42, 'Ghana', 'Cedis', '¢', 'GHS', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(43, 'Gibraltar', 'Pounds', '£', 'GIP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(44, 'Greece', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(45, 'Guatemala', 'Quetzales', 'Q', 'GTQ', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(46, 'Guernsey', 'Pounds', '£', 'GGP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(47, 'Guyana', 'Dollars', '$', 'GYD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(48, 'Holland [Netherlands]', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(49, 'Honduras', 'Lempiras', 'L', 'HNL', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(50, 'Hong Kong', 'Dollars', '$', 'HKD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(51, 'Hungary', 'Forint', 'Ft', 'HUF', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(52, 'Iceland', 'Kronur', 'kr', 'ISK', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(53, 'India', 'Rupees', '₹', 'INR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(54, 'Indonesia', 'Rupiahs', 'Rp', 'IDR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(55, 'Iran', 'Rials', '﷼', 'IRR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(56, 'Ireland', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(57, 'Isle of Man', 'Pounds', '£', 'IMP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(58, 'Israel', 'New Shekels', '₪', 'ILS', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(59, 'Italy', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(60, 'Jamaica', 'Dollars', 'J$', 'JMD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(61, 'Japan', 'Yen', '¥', 'JPY', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(62, 'Jersey', 'Pounds', '£', 'JEP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(63, 'Kazakhstan', 'Tenge', 'лв', 'KZT', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(64, 'Korea [North]', 'Won', '₩', 'KPW', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(65, 'Korea [South]', 'Won', '₩', 'KRW', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(66, 'Kyrgyzstan', 'Soms', 'лв', 'KGS', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(67, 'Laos', 'Kips', '₭', 'LAK', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(68, 'Latvia', 'Lati', 'Ls', 'LVL', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(69, 'Lebanon', 'Pounds', '£', 'LBP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(70, 'Liberia', 'Dollars', '$', 'LRD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(72, 'Lithuania', 'Litai', 'Lt', 'LTL', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(73, 'Luxembourg', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(74, 'Macedonia', 'Denars', 'ден', 'MKD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(75, 'Malaysia', 'Ringgits', 'RM', 'MYR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(76, 'Malta', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(77, 'Mauritius', 'Rupees', '₨', 'MUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(78, 'Mexico', 'Pesos', '$', 'MXN', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(79, 'Mongolia', 'Tugriks', '₮', 'MNT', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(80, 'Mozambique', 'Meticais', 'MT', 'MZ', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(81, 'Namibia', 'Dollars', '$', 'NAD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(82, 'Nepal', 'Rupees', '₨', 'NPR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(83, 'Netherlands Antilles', 'Guilders', 'ƒ', 'ANG', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(84, 'Netherlands', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(85, 'New Zealand', 'Dollars', '$', 'NZD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(86, 'Nicaragua', 'Cordobas', 'C$', 'NIO', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(87, 'Nigeria', 'Nairas', '₦', 'NGN', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(88, 'North Korea', 'Won', '₩', 'KPW', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(89, 'Norway', 'Krone', 'kr', 'NOK', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(90, 'Oman', 'Rials', '﷼', 'OMR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(91, 'Pakistan', 'Rupees', '₨', 'PKR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(92, 'Panama', 'Balboa', 'B/.', 'PAB', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(93, 'Paraguay', 'Guarani', 'Gs', 'PYG', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(94, 'Peru', 'Nuevos Soles', 'S/.', 'PE', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(95, 'Philippines', 'Pesos', 'Php', 'PHP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(96, 'Poland', 'Zlotych', 'zł', 'PL', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(97, 'Qatar', 'Rials', '﷼', 'QAR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(98, 'Romania', 'New Lei', 'lei', 'RO', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(99, 'Russia', 'Rubles', 'руб', 'RUB', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(100, 'Saint Helena', 'Pounds', '£', 'SHP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(101, 'Saudi Arabia', 'Riyals', '﷼', 'SAR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(102, 'Serbia', 'Dinars', 'Дин.', 'RSD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(103, 'Seychelles', 'Rupees', '₨', 'SCR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(104, 'Singapore', 'Dollars', '$', 'SGD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(105, 'Slovenia', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(106, 'Solomon Islands', 'Dollars', '$', 'SBD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(107, 'Somalia', 'Shillings', 'S', 'SOS', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(108, 'South Africa', 'Rand', 'R', 'ZAR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(109, 'South Korea', 'Won', '₩', 'KRW', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(110, 'Spain', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(111, 'Sri Lanka', 'Rupees', '₨', 'LKR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(112, 'Sweden', 'Kronor', 'kr', 'SEK', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(114, 'Suriname', 'Dollars', '$', 'SRD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(115, 'Syria', 'Pounds', '£', 'SYP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(116, 'Taiwan', 'New Dollars', 'NT$', 'TWD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(117, 'Thailand', 'Baht', '฿', 'THB', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(118, 'Trinidad and Tobago', 'Dollars', 'TT$', 'TTD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(119, 'Turkey', 'Lira', 'TL', 'TRY', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(120, 'Turkey', 'Liras', '£', 'TRL', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(121, 'Tuvalu', 'Dollars', '$', 'TVD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(122, 'Ukraine', 'Hryvnia', '₴', 'UAH', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(123, 'United Kingdom', 'Pounds', '£', 'GBP', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(124, 'United States of America', 'Dollars', '$', 'USD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(125, 'Uruguay', 'Pesos', '$U', 'UYU', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(126, 'Uzbekistan', 'Sums', 'лв', 'UZS', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(127, 'Vatican City', 'Euro', '€', 'EUR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(128, 'Venezuela', 'Bolivares Fuertes', 'Bs', 'VEF', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(129, 'Vietnam', 'Dong', '₫', 'VND', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(130, 'Yemen', 'Rials', '﷼', 'YER', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'Z$', 'ZWD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(132, 'Iraq', 'Iraqi dinar', 'د.ع', 'IQD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(133, 'Kenya', 'Kenyan shilling', 'KSh', 'KES', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(134, 'Bangladesh', 'Taka', '৳', 'BDT', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(135, 'Algerie', 'Algerian dinar', 'د.ج', 'DZD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'د.إ', 'AED', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(137, 'Uganda', 'Uganda shillings', 'USh', 'UGX', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(138, 'Tanzania', 'Tanzanian shilling', 'TSh', 'TZS', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(139, 'Angola', 'Kwanza', 'Kz', 'AOA', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(140, 'Kuwait', 'Kuwaiti dinar', 'KD', 'KWD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(141, 'Bahrain', 'Bahraini dinar', 'BD', 'BHD', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09'),
(142, 'Sri Lankan', 'Sri Lankan Rupee', 'LKR', 'LKR', NULL, NULL, 1, '2022-12-14 16:30:09', '2022-12-14 16:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `deliverycategories`
--

CREATE TABLE `deliverycategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliverycategories`
--

INSERT INTO `deliverycategories` (`id`, `title`, `status`, `position`, `created_at`, `updated_at`) VALUES
(1, 'KG', 1, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 'Mobile', 1, 2, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 'Laptop', 1, 3, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 'Tabs', 1, 4, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 'Gaming Kybord', 1, 5, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 'Cosmetices', 1, 6, '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_statements`
--

CREATE TABLE `deliveryman_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_id` bigint(20) DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'income=1,expense=2',
  `amount` decimal(16,2) DEFAULT NULL,
  `cash_collection` tinyint(3) UNSIGNED DEFAULT 0 COMMENT 'true=1,false=0',
  `date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveryman_statements`
--

INSERT INTO `deliveryman_statements` (`id`, `expense_id`, `parcel_id`, `delivery_man_id`, `hub_id`, `type`, `amount`, `cash_collection`, `date`, `note`, `created_at`, `updated_at`) VALUES
(1, NULL, 4, 6, NULL, 1, 15.00, 0, '2024-02-01', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-01 14:41:56', '2024-02-01 14:41:56'),
(2, NULL, 8, 1, NULL, 1, 20.00, 0, '2024-02-01', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-01 15:19:35', '2024-02-01 15:19:35'),
(3, NULL, 2, 6, NULL, 1, 15.00, 0, '2024-02-07', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-07 16:11:14', '2024-02-07 16:11:14'),
(4, NULL, 3, 5, NULL, 1, 15.00, 0, '2024-02-10', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-10 04:16:19', '2024-02-10 04:16:19'),
(7, NULL, 11, 3, NULL, 1, 20.00, 0, '2024-02-10', 'statementNote.return_to_merchant_deliveryman_statement', '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(8, NULL, 10, 2, NULL, 1, 15.00, 0, '2024-02-10', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-10 06:13:58', '2024-02-10 06:13:58'),
(14, NULL, 1, 3, NULL, 1, 15.00, 0, '2024-02-14', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-14 13:51:13', '2024-02-14 13:51:13'),
(15, NULL, 14, 15, NULL, 1, 3.00, 0, '2024-02-15', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-15 17:29:50', '2024-02-15 17:29:50'),
(16, NULL, 14, 15, NULL, 2, 3.00, 0, '2024-02-15', 'Parcel Received Warehouse Cancel To Deliveryman Expense', '2024-02-15 17:31:55', '2024-02-15 17:31:55'),
(17, NULL, 14, 15, NULL, 1, 3.00, 0, '2024-02-15', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-15 17:32:59', '2024-02-15 17:32:59'),
(18, NULL, 14, 15, NULL, 2, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse Cancel To Deliveryman Expense', '2024-02-17 13:57:35', '2024-02-17 13:57:35'),
(19, NULL, 14, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-17 14:03:25', '2024-02-17 14:03:25'),
(20, NULL, 15, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-17 14:14:41', '2024-02-17 14:14:41'),
(21, NULL, 16, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-17 15:30:27', '2024-02-17 15:30:27'),
(22, NULL, 16, 15, NULL, 2, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse Cancel To Deliveryman Expense', '2024-02-17 15:30:38', '2024-02-17 15:30:38'),
(23, NULL, 16, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-17 15:31:21', '2024-02-17 15:31:21'),
(24, NULL, 14, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(25, NULL, 14, 15, NULL, 2, 0.00, 1, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(26, NULL, 16, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(27, NULL, 16, 15, NULL, 2, 0.00, 1, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(28, NULL, 15, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(29, NULL, 15, 15, NULL, 2, 0.00, 1, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(30, NULL, 17, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-17 16:58:27', '2024-02-17 16:58:27'),
(31, NULL, 17, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(32, NULL, 17, 15, NULL, 2, 0.00, 1, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(33, NULL, 18, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-17 17:04:13', '2024-02-17 17:04:13'),
(34, NULL, 18, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(35, NULL, 18, 15, NULL, 2, 0.00, 1, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(36, NULL, 19, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-17 17:45:31', '2024-02-17 17:45:31'),
(37, NULL, 19, 15, NULL, 1, 3.00, 0, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(38, NULL, 19, 15, NULL, 2, 0.00, 1, '2024-02-17', 'Parcel Delivered To Deliveryman Income', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(39, NULL, 20, 15, NULL, 1, 3.00, 0, '2024-02-18', 'Parcel Received Warehouse To Deliveryman Income', '2024-02-18 11:48:36', '2024-02-18 11:48:36'),
(40, NULL, 9, 15, NULL, 1, 3.00, 1, '2024-02-18', 'Parcel Partial Delivered To Deliveryman Income', '2024-02-18 11:51:22', '2024-02-18 11:51:22'),
(41, NULL, 9, 15, NULL, 2, 300.00, 1, '2024-02-18', 'Parcel Delivered To Deliveryman Income', '2024-02-18 11:51:23', '2024-02-18 11:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT 0,
  `same_day` decimal(16,2) NOT NULL DEFAULT 0.00,
  `next_day` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sub_city` decimal(16,2) NOT NULL DEFAULT 0.00,
  `outside_city` decimal(16,2) NOT NULL DEFAULT 0.00,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_charges`
--

INSERT INTO `delivery_charges` (`id`, `category_id`, `weight`, `same_day`, `next_day`, `sub_city`, `outside_city`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 1, 2, 90.00, 100.00, 110.00, 120.00, 2, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 1, 3, 130.00, 140.00, 150.00, 160.00, 3, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 1, 4, 170.00, 180.00, 190.00, 200.00, 4, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 1, 5, 210.00, 220.00, 230.00, 240.00, 5, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 1, 6, 250.00, 260.00, 270.00, 280.00, 6, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(7, 1, 7, 290.00, 300.00, 310.00, 320.00, 7, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(8, 1, 8, 340.00, 350.00, 360.00, 370.00, 8, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(9, 1, 9, 380.00, 390.00, 400.00, 410.00, 9, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(10, 1, 10, 420.00, 430.00, 440.00, 450.00, 10, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man`
--

CREATE TABLE `delivery_man` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `delivery_lat` varchar(191) DEFAULT NULL,
  `delivery_long` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(13,2) NOT NULL DEFAULT 0.00,
  `pickup_charge` decimal(13,2) NOT NULL DEFAULT 0.00,
  `return_charge` decimal(13,2) NOT NULL DEFAULT 0.00,
  `current_balance` decimal(13,2) NOT NULL DEFAULT 0.00,
  `opening_balance` decimal(13,2) NOT NULL DEFAULT 0.00,
  `driving_license_image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `documents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_man`
--

INSERT INTO `delivery_man` (`id`, `user_id`, `status`, `delivery_lat`, `delivery_long`, `delivery_charge`, `pickup_charge`, `return_charge`, `current_balance`, `opening_balance`, `driving_license_image_id`, `created_at`, `updated_at`, `documents`) VALUES
(1, 3, 1, '23.7862912', '90.3708672', 30.00, 20.00, 10.00, 20.00, 0.00, 1, '2023-12-08 18:13:21', '2024-02-01 15:19:35', NULL),
(2, 9, 1, '', '', 50.00, 15.00, 20.00, 15.00, 0.00, NULL, '2023-12-17 21:15:51', '2024-02-10 06:13:58', NULL),
(3, 10, 1, '', '', 50.00, 15.00, 20.00, 35.00, 0.00, NULL, '2023-12-17 21:20:29', '2024-02-14 13:51:13', NULL),
(4, 11, 1, '', '', 50.00, 15.00, 20.00, 0.00, 0.00, NULL, '2023-12-17 21:21:44', '2023-12-17 21:21:44', NULL),
(5, 12, 1, '', '', 50.00, 15.00, 20.00, 15.00, 0.00, NULL, '2023-12-17 21:27:01', '2024-02-10 04:16:19', NULL),
(6, 13, 1, '23.8028556', '90.3748344', 50.00, 15.00, 0.00, 0.00, 0.00, NULL, '2023-12-18 23:06:53', '2024-02-19 20:00:57', NULL),
(8, 20, 1, '23.7985396', '90.3654296', 3.00, 3.00, 3.00, 3.00, 3.00, NULL, '2024-02-11 07:11:33', '2024-02-11 07:11:33', NULL),
(9, 21, 1, '23.7985396', '90.3654296', 3.00, 3.00, 3.00, 0.00, 0.00, NULL, '2024-02-12 00:39:20', '2024-02-12 00:39:20', NULL),
(10, 27, 1, '23.7985396', '90.3654296', 3.00, 3.00, 3.00, 0.00, 0.00, NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29', NULL),
(11, 28, 1, '23.7985396', '90.3654296', 3.00, 3.00, 3.00, 0.00, 0.00, NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48', NULL),
(12, 32, 1, '23.7985396', '90.3654296', 4.00, 3.00, 3.00, 0.00, 0.00, NULL, '2024-02-12 23:57:41', '2024-02-13 00:43:07', '[65]'),
(15, 35, 1, '23.7985396', '90.3654296', 3.00, 3.00, 3.00, 0.00, 0.00, NULL, '2024-02-13 04:49:58', '2024-02-19 18:30:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General Management', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(2, 'Marketing', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(3, 'Operations', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(4, 'Finance', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(5, 'Sales', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(6, 'Human Resource', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(7, 'Purchase', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chief Executive Officer (CEO)', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(2, 'Chief Operating Officer (COO)', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(3, 'Chief Financial Officer (CFO)', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(4, 'Chief Technology Officer (CTO)', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(5, 'Chief Legal Officer (CLO)', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(6, 'Chief Marketing Officer (CMO)', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_head_id` bigint(20) UNSIGNED DEFAULT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `receipt` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What is wecourier Delivery?', 'Est omnis dolor et voluptates qui ea delectus quo esse illo nisi omnis ut qui et illum unde non sit.', '1', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(2, 'How do I contact you?', 'Et quia est totam quis sed enim deserunt vel ut eos mollitia ratione ducimus ut doloribus architecto qui ut placeat molestiae vel eveniet voluptatem ea amet est labore aut aut molestiae aperiam et libero consequuntur repellat.', '2', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(3, 'How can a merchant track their parcel delivery?', 'Qui quam corrupti temporibus earum id doloribus modi voluptatem nulla quas voluptatibus doloribus facilis odio dolore velit et et similique maxime nobis.', '3', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(4, 'How do I send a product/ courier via wecourier Delivery?', 'Explicabo aut quibusdam non voluptatem beatae numquam recusandae ut rerum animi error et quasi ducimus voluptatibus voluptate aspernatur quis possimus vel ipsam ut qui quas est saepe illo voluptas quos consequuntur.', '4', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(5, 'I want to hold a parcel for more than 3 days before home delivery. Is it possible?', 'Vero alias animi quibusdam laudantium a iusto placeat ea quaerat nesciunt ut deserunt rerum sit blanditiis quia quaerat asperiores aut quod fugit vero qui sunt aut ad minima voluptates maiores mollitia nisi ut quia qui laborum excepturi et ut.', '5', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(6, 'Can you do product exchange from customers?', 'Dolorum consequuntur dolore a ea aut impedit doloremque excepturi repellat in iure soluta dolores illo laborum in impedit beatae quam at assumenda ut consequatur cumque ducimus magni fugiat magnam.', '6', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(7, 'Can you deliver to addresses inside Cantonment or other restricted areas?', 'Et autem consequatur fugit sint aut sunt nihil beatae assumenda est animi et nihil unde nobis velit et et est aut ut excepturi expedita labore natus molestiae.', '7', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(8, 'I do not have a Facebook page, can I register as a merchant?', 'Et neque sapiente quo qui amet esse ducimus reprehenderit distinctio possimus veritatis vel voluptas doloremque occaecati corporis asperiores consequatur est aut non veritatis nisi ut nam doloremque inventore voluptas ut voluptas nesciunt fuga illum ipsam omnis.', '8', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(9, 'What kind of products does wecourier deliver?', 'Quis ex rerum maxime sed non perspiciatis deleniti similique exercitationem sit et ut enim ratione totam nihil temporibus et nemo explicabo aut recusandae vero harum delectus perferendis repellendus dolore nihil est excepturi eveniet sapiente adipisci et qui accusamus.', '9', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `frauds`
--

CREATE TABLE `frauds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `tracking_id` varchar(191) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_account` bigint(20) UNSIGNED DEFAULT NULL,
  `to_account` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `copyright` varchar(191) DEFAULT NULL,
  `logo` int(11) DEFAULT NULL,
  `light_logo` int(11) DEFAULT NULL,
  `favicon` int(11) DEFAULT NULL,
  `current_version` varchar(191) DEFAULT NULL,
  `par_track_prefix` varchar(191) DEFAULT NULL,
  `invoice_prefix` varchar(191) DEFAULT NULL,
  `primary_color` varchar(191) DEFAULT '#7e0095',
  `text_color` varchar(191) DEFAULT '#ffffff',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `name`, `phone`, `email`, `address`, `currency`, `copyright`, `logo`, `light_logo`, `favicon`, `current_version`, `par_track_prefix`, `invoice_prefix`, `primary_color`, `text_color`, `created_at`, `updated_at`) VALUES
(1, 'Delivery Partner', '20022002', 'info@ezycode.lk', 'Colombo, Sri Lanka', 'LKR', 'Copyright © All rights reserved. Development by EzyCode', 8, 35, 9, '1', 'DP', 'DP', '#011e59', '#ffffff', '2023-12-08 18:13:21', '2024-02-17 16:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `google_map_settings`
--

CREATE TABLE `google_map_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `map_key` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `google_map_settings`
--

INSERT INTO `google_map_settings` (`id`, `map_key`, `created_at`, `updated_at`) VALUES
(1, 'AIzaSyCDve4ghJMb9X_S7RpwzAtpxFNq94c-qrQ', '2024-02-13 06:30:19', '2024-02-13 06:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `hubs`
--

CREATE TABLE `hubs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `hub_lat` varchar(191) DEFAULT NULL,
  `hub_long` varchar(191) DEFAULT NULL,
  `current_balance` decimal(16,2) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hubs`
--

INSERT INTO `hubs` (`id`, `name`, `phone`, `address`, `hub_lat`, `hub_long`, `current_balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DeliPart - Katharagama', '0094777123456', '2nd Sillo Road, Katharagama', '', '', 0.00, 1, '2023-12-08 18:13:20', '2023-12-17 20:43:40'),
(2, 'DeliPart - Ampara', '0094777123456', 'Batticola Road, Ampara', '', '', 0.00, 1, '2023-12-08 18:13:20', '2023-12-17 20:42:51'),
(3, 'DeliPart - Puttalam', '0094777123456', 'Mannar Road, Puttalam', '', '', 0.00, 1, '2023-12-08 18:13:20', '2023-12-17 20:40:41'),
(4, 'DeliPart - Jaffna', '0094777123456', 'K. K. S. Road, Jaffna', '', '', 0.00, 1, '2023-12-08 18:13:20', '2023-12-17 20:41:11'),
(8, 'DeliPart - Colombo', '0094777123456', 'R. A. De Mel Mawattha, Colombo - 06', '', '', NULL, 1, '2023-12-17 18:57:00', '2023-12-17 20:42:03'),
(9, 'DeliPart - Wennapuwa', '+942323423', 'asdfadf', '23.7985396', '90.3654296', NULL, 1, '2023-12-18 23:08:21', '2024-02-11 23:03:07'),
(10, 'test', '2333', 'asdf', '23.7985396', '90.3654296', NULL, 1, '2024-02-12 00:21:21', '2024-02-12 00:45:25'),
(11, 'asdfasdf', '3333', 'asdfadf', '23.7985396', '90.3654296', NULL, 1, '2024-02-12 00:44:46', '2024-02-12 00:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `hub_incharges`
--

CREATE TABLE `hub_incharges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `hub_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hub_incharges`
--

INSERT INTO `hub_incharges` (`id`, `user_id`, `hub_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 18, 2, 1, '2024-02-08 11:36:28', '2024-02-08 11:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `hub_payments`
--

CREATE TABLE `hub_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `from_account` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_file` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT '1=admin,4=incharge',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 3 COMMENT '1= Reject,2=Approved , 3= Pending,4=Process, ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hub_statements`
--

CREATE TABLE `hub_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'income=1,expense=2',
  `amount` decimal(16,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_head_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from` tinyint(3) UNSIGNED DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_user_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `receipt` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` varchar(191) DEFAULT NULL,
  `invoice_date` varchar(191) DEFAULT NULL,
  `total_charge` decimal(16,2) DEFAULT NULL,
  `cash_collection` decimal(16,2) DEFAULT NULL,
  `current_payable` decimal(16,2) DEFAULT NULL,
  `parcels_id` longtext DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT ' Unpaid      = 0, Processing  = 2, Paid        = 3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `merchant_id`, `invoice_id`, `invoice_date`, `total_charge`, `cash_collection`, `current_payable`, `parcels_id`, `status`, `created_at`, `updated_at`, `discount_amount`) VALUES
(17, 7, 'DP-71', '12-02-2024', 378.00, 8400.00, 8022.00, '[10]', 2, '2024-02-12 06:48:29', '2024-02-12 06:48:29', 37.80);

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `business_name` varchar(191) NOT NULL,
  `merchant_unique_id` varchar(191) DEFAULT NULL,
  `current_balance` decimal(16,2) NOT NULL DEFAULT 0.00,
  `opening_balance` decimal(16,2) NOT NULL DEFAULT 0.00,
  `wallet_balance` decimal(16,2) NOT NULL DEFAULT 0.00,
  `vat` decimal(16,2) NOT NULL DEFAULT 0.00,
  `cod_charges` longtext DEFAULT NULL,
  `nid_id` bigint(20) UNSIGNED DEFAULT NULL,
  `trade_license` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_period` varchar(191) NOT NULL DEFAULT '2' COMMENT '2 = 2days , after every 2days will auto payment invoice generate',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `address` longtext DEFAULT NULL,
  `wallet_use_activation` tinyint(3) UNSIGNED DEFAULT 0,
  `return_charges` decimal(16,2) NOT NULL DEFAULT 100.00 COMMENT '100 = 100%  means full charge will received courier',
  `reference_name` varchar(191) DEFAULT NULL,
  `reference_phone` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `target` decimal(10,0) DEFAULT NULL,
  `discount` decimal(10,0) NOT NULL,
  `agreement_file` decimal(10,0) DEFAULT NULL,
  `is_agreement` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `user_id`, `business_name`, `merchant_unique_id`, `current_balance`, `opening_balance`, `wallet_balance`, `vat`, `cod_charges`, `nid_id`, `trade_license`, `payment_period`, `status`, `address`, `wallet_use_activation`, `return_charges`, `reference_name`, `reference_phone`, `created_at`, `updated_at`, `target`, `discount`, `agreement_file`, `is_agreement`) VALUES
(1, 4, 'Keels Super', '251111', 0.00, 0.00, -352.87, 0.00, '{\"inside_city\":\"1\",\"sub_city\":\"2\",\"outside_city\":\"3\"}', 4, 5, '2', 1, 'A04 Road, Nugegoda.', 0, 100.00, NULL, NULL, '2023-12-08 18:13:21', '2024-02-18 11:46:28', 0, 0, NULL, 0),
(2, 5, 'Alphonso Cafe', '210533', 0.00, 0.00, 0.00, 0.00, '{\"inside_city\":\"1\",\"sub_city\":\"2\",\"outside_city\":\"3\"}', NULL, NULL, '2', 1, 'Jaffna Road, Jaffna.', 0, 100.00, '', '', '2023-12-10 01:29:18', '2024-02-18 11:46:39', 0, 0, NULL, 0),
(3, 7, 'Cargills Food City', '384231', 0.00, 0.00, 0.00, 18.00, '{\"inside_city\":\"1\",\"sub_city\":\"2\",\"outside_city\":\"3\"}', NULL, NULL, '2', 1, 'Colombo - 13, Kotahena.', 1, 100.00, '', '', '2023-12-17 20:57:49', '2023-12-17 20:57:49', NULL, 0, NULL, 0),
(4, 8, 'Cargills Food City - Pettah', '367121', 0.00, 0.00, -610.00, 18.00, '{\"inside_city\":\"1\",\"sub_city\":\"2\",\"outside_city\":\"3\"}', NULL, NULL, '2', 1, 'Main Street, Pettah.', 0, 100.00, '', '', '2023-12-17 21:00:15', '2024-02-19 20:06:03', 0, 0, NULL, 0),
(5, 14, 'Wharehouse', '479428', 20000.00, 20000.00, 19830.50, 0.00, '{\"inside_city\":\"1\",\"sub_city\":\"2\",\"outside_city\":\"3\"}', NULL, NULL, '2', 1, 'Pamunugama Road, Gampaha', 0, 100.00, '', '', '2023-12-18 23:17:06', '2024-02-18 11:46:09', 0, 0, NULL, 0),
(7, 19, 'riazshop', '914311', 0.00, 0.00, 0.00, 0.00, '{\"inside_city\":\"1\",\"sub_city\":\"2\",\"outside_city\":\"3\"}', NULL, NULL, '30', 1, 'Mirpur-2', 0, 100.00, '', '', '2024-02-10 07:10:46', '2024-02-19 18:27:13', 1, 10, NULL, 1),
(8, 26, 'riaz', '166500', 0.00, 0.00, -1160.00, 0.00, '{\"inside_city\":\"1\",\"sub_city\":\"2\",\"outside_city\":\"3\"}', NULL, NULL, '30', 1, 'Mirpur-2', 0, 100.00, '', '', '2024-02-12 05:56:16', '2024-02-18 11:48:09', 1, 100, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `merchant_delivery_charges`
--

CREATE TABLE `merchant_delivery_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_charge_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weight` bigint(20) DEFAULT NULL,
  `category_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `same_day` decimal(16,2) DEFAULT NULL,
  `next_day` decimal(16,2) DEFAULT NULL,
  `sub_city` decimal(16,2) DEFAULT NULL,
  `outside_city` decimal(16,2) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_delivery_charges`
--

INSERT INTO `merchant_delivery_charges` (`id`, `merchant_id`, `delivery_charge_id`, `weight`, `category_id`, `same_day`, `next_day`, `sub_city`, `outside_city`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 1, 2, 2, 1, 90.00, 100.00, 110.00, 120.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 1, 3, 3, 1, 130.00, 140.00, 150.00, 160.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 1, 4, 4, 1, 170.00, 180.00, 190.00, 200.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 1, 5, 5, 1, 210.00, 220.00, 230.00, 240.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 1, 6, 6, 1, 250.00, 260.00, 270.00, 280.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(7, 1, 7, 7, 1, 290.00, 300.00, 310.00, 320.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(8, 1, 8, 8, 1, 340.00, 350.00, 360.00, 370.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(9, 1, 9, 9, 1, 380.00, 390.00, 400.00, 410.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(10, 1, 10, 10, 1, 420.00, 430.00, 440.00, 450.00, 1, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(11, 2, 1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(12, 2, 2, 2, 1, 90.00, 100.00, 110.00, 120.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(13, 2, 3, 3, 1, 130.00, 140.00, 150.00, 160.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(14, 2, 4, 4, 1, 170.00, 180.00, 190.00, 200.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(15, 2, 5, 5, 1, 210.00, 220.00, 230.00, 240.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(16, 2, 6, 6, 1, 250.00, 260.00, 270.00, 280.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(17, 2, 7, 7, 1, 290.00, 300.00, 310.00, 320.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(18, 2, 8, 8, 1, 340.00, 350.00, 360.00, 370.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(19, 2, 9, 9, 1, 380.00, 390.00, 400.00, 410.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(20, 2, 10, 10, 1, 420.00, 430.00, 440.00, 450.00, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(21, 3, 1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(22, 3, 2, 2, 1, 90.00, 100.00, 110.00, 120.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(23, 3, 3, 3, 1, 130.00, 140.00, 150.00, 160.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(24, 3, 4, 4, 1, 170.00, 180.00, 190.00, 200.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(25, 3, 5, 5, 1, 210.00, 220.00, 230.00, 240.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(26, 3, 6, 6, 1, 250.00, 260.00, 270.00, 280.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(27, 3, 7, 7, 1, 290.00, 300.00, 310.00, 320.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(28, 3, 8, 8, 1, 340.00, 350.00, 360.00, 370.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(29, 3, 9, 9, 1, 380.00, 390.00, 400.00, 410.00, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(30, 3, 10, 10, 1, 420.00, 430.00, 440.00, 450.00, 1, '2023-12-17 20:57:50', '2023-12-17 20:57:50'),
(31, 4, 1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(32, 4, 2, 2, 1, 90.00, 100.00, 110.00, 120.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(33, 4, 3, 3, 1, 130.00, 140.00, 150.00, 160.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(34, 4, 4, 4, 1, 170.00, 180.00, 190.00, 200.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(35, 4, 5, 5, 1, 210.00, 220.00, 230.00, 240.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(36, 4, 6, 6, 1, 250.00, 260.00, 270.00, 280.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(37, 4, 7, 7, 1, 290.00, 300.00, 310.00, 320.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(38, 4, 8, 8, 1, 340.00, 350.00, 360.00, 370.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(39, 4, 9, 9, 1, 380.00, 390.00, 400.00, 410.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(40, 4, 10, 10, 1, 420.00, 430.00, 440.00, 450.00, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(41, 5, 1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(42, 5, 2, 2, 1, 90.00, 100.00, 110.00, 120.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(43, 5, 3, 3, 1, 130.00, 140.00, 150.00, 160.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(44, 5, 4, 4, 1, 170.00, 180.00, 190.00, 200.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(45, 5, 5, 5, 1, 210.00, 220.00, 230.00, 240.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(46, 5, 6, 6, 1, 250.00, 260.00, 270.00, 280.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(47, 5, 7, 7, 1, 290.00, 300.00, 310.00, 320.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(48, 5, 8, 8, 1, 340.00, 350.00, 360.00, 370.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(49, 5, 9, 9, 1, 380.00, 390.00, 400.00, 410.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(50, 5, 10, 10, 1, 420.00, 430.00, 440.00, 450.00, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(61, 7, 1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(62, 7, 2, 2, 1, 90.00, 100.00, 110.00, 120.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(63, 7, 3, 3, 1, 130.00, 140.00, 150.00, 160.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(64, 7, 4, 4, 1, 170.00, 180.00, 190.00, 200.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(65, 7, 5, 5, 1, 210.00, 220.00, 230.00, 240.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(66, 7, 6, 6, 1, 250.00, 260.00, 270.00, 280.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(67, 7, 7, 7, 1, 290.00, 300.00, 310.00, 320.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(68, 7, 8, 8, 1, 340.00, 350.00, 360.00, 370.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(69, 7, 9, 9, 1, 380.00, 390.00, 400.00, 410.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(70, 7, 10, 10, 1, 420.00, 430.00, 440.00, 450.00, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(71, 8, 1, 1, 1, 50.00, 60.00, 70.00, 80.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(72, 8, 2, 2, 1, 90.00, 100.00, 110.00, 120.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(73, 8, 3, 3, 1, 130.00, 140.00, 150.00, 160.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(74, 8, 4, 4, 1, 170.00, 180.00, 190.00, 200.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(75, 8, 5, 5, 1, 210.00, 220.00, 230.00, 240.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(76, 8, 6, 6, 1, 250.00, 260.00, 270.00, 280.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(77, 8, 7, 7, 1, 290.00, 300.00, 310.00, 320.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(78, 8, 8, 8, 1, 340.00, 350.00, 360.00, 370.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(79, 8, 9, 9, 1, 380.00, 390.00, 400.00, 410.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16'),
(80, 8, 10, 10, 1, 420.00, 430.00, 440.00, 450.00, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_online_payments`
--

CREATE TABLE `merchant_online_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` tinyint(4) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchant_online_payment_receiveds`
--

CREATE TABLE `merchant_online_payment_receiveds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` tinyint(4) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchant_payments`
--

CREATE TABLE `merchant_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `branch_name` varchar(191) DEFAULT NULL,
  `routing_no` varchar(191) DEFAULT NULL,
  `mobile_company` varchar(191) DEFAULT NULL,
  `mobile_no` varchar(191) DEFAULT NULL,
  `account_type` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_payments`
--

INSERT INTO `merchant_payments` (`id`, `merchant_id`, `payment_method`, `bank_name`, `holder_name`, `account_no`, `branch_name`, `routing_no`, `mobile_company`, `mobile_no`, `account_type`, `status`, `created_at`, `updated_at`) VALUES
(2, 7, 'mobile', NULL, 'asdfadsf', NULL, NULL, NULL, 'Bkash', '123456789', 'Personal', 1, '2024-02-12 03:16:03', '2024-02-12 03:16:03'),
(3, 8, 'mobile', NULL, '555', NULL, NULL, NULL, 'Bkash', '55553333333', 'Personal', 1, '2024-02-13 05:03:42', '2024-02-13 05:03:42'),
(4, 8, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-13 06:04:59', '2024-02-13 06:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_settings`
--

CREATE TABLE `merchant_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_settings`
--

INSERT INTO `merchant_settings` (`id`, `merchant_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'stripe_publishable_key', 'pk_test_csMkzUcsbjbcEuuW6K0QImTT00M403UGkp', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 1, 'stripe_secret_key', 'sk_test_aqfYWud5ZhFx0EGIvY6Scdxh00dlfZKnFT', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 1, 'stripe_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 1, 'sslcommerz_store_id', 'wemax635e0bd65804e', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 1, 'sslcommerz_store_password', 'wemax635e0bd65804e@ssl', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 1, 'sslcommerz_testmode', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(7, 1, 'sslcommerz_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(8, 1, 'paypal_client_id', 'ASNysE4ENGfyplv-cNRife5zi8137rEh21yoK4cBZvuy1JWEm-v_DdmfBKVedtmadG1VPgXxUjRg6Q_3', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(9, 1, 'paypal_client_secret', 'EJwTIUMb8mjg0EH2gim8jpi8tQaVeomcVm0Rs-c3mjXxcvGR3y6imw1kohYuGs5NCPzJuXe-ggvyixaF', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(10, 1, 'paypal_mode', 'sendbox', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(11, 1, 'paypal_status', '1', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(12, 1, 'razorpay_key', '', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(13, 1, 'razorpay_secret', '', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(14, 1, 'razorpay_status', '1', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(15, 1, 'skrill_merchant_email', 'demoqco@sun-fish.com', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(16, 1, 'skrill_status', '1', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(17, 1, 'bkash_app_id', 'application id', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(18, 1, 'bkash_app_secret', 'application secret key', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(19, 1, 'bkash_username', 'username', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(20, 1, 'bkash_password', 'password', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(21, 1, 'bkash_test_mode', '1', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(22, 1, 'bkash_status', '1', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(23, 1, 'aamarpay_store_id', 'aamarypay', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(24, 1, 'aamarpay_signature_key', '28c78bb1f45112f5d40b956fe104645a', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(25, 1, 'aamarpay_sendbox_mode', '1', '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(26, 1, 'aamarpay_status', '1', '2023-12-08 18:13:22', '2023-12-08 18:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_shops`
--

CREATE TABLE `merchant_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `contact_no` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `merchant_lat` varchar(191) DEFAULT NULL,
  `merchant_long` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `default_shop` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_shops`
--

INSERT INTO `merchant_shops` (`id`, `merchant_id`, `name`, `contact_no`, `address`, `merchant_lat`, `merchant_long`, `status`, `default_shop`, `created_at`, `updated_at`) VALUES
(1, 1, 'Weligama (Keels)', '0094762909095', 'Mirpur-1, Dhaka, Bangladesh', '23.7956037', '90.3536548', 1, 1, '2023-12-08 18:13:21', '2024-02-13 06:33:43'),
(2, 1, 'Wellawattha (Keels)', '0094762909093', 'Wellawattha, Colombo - 06', '', '', 1, 0, '2023-12-08 18:13:21', '2023-12-17 21:53:00'),
(3, 1, 'Nugegoda (Keels)', '0094762909092', 'Main Road, Nugegoda', '', '', 1, 0, '2023-12-08 18:13:21', '2023-12-17 21:51:32'),
(4, 1, 'Galle (Keels)', '0094762909091', 'Galle Road, Galle', '', '', 1, 0, '2023-12-08 18:13:21', '2023-12-17 21:50:28'),
(5, 1, 'Bambalapitiya (Keels)', '0094762909090', 'Bambalapitiya, Colombo - 05', '', '', 1, 0, '2023-12-08 18:13:21', '2023-12-17 21:43:15'),
(6, 2, 'shop', '01516546454156', 'Colombo,Srilanka', NULL, NULL, 1, 1, '2023-12-10 01:29:18', '2023-12-10 01:29:18'),
(7, 1, 'Kotahena (Keels)', '0094762909089', 'Kotahena, Colombo - 13', '', '', 1, 0, '2023-12-10 01:31:08', '2023-12-17 21:46:15'),
(8, 3, 'Cargills Food City', '0094777123458', 'Colombo - 13, Kotahena.', NULL, NULL, 1, 1, '2023-12-17 20:57:49', '2023-12-17 20:57:49'),
(9, 4, 'Cargills Food City - Pettah', '0094777123459', 'Main Street, Pettah.', NULL, NULL, 1, 1, '2023-12-17 21:00:15', '2023-12-17 21:00:15'),
(10, 5, 'Wharehouse', '0094776345465', 'Pamunugama Road, Gampaha', NULL, NULL, 1, 1, '2023-12-18 23:17:06', '2023-12-18 23:17:06'),
(11, 5, 'WhereHouse (Galkissa)', '0094789323232', '#329, Galle Road, Colombo - 04', '', '', 1, 0, '2023-12-18 23:33:56', '2023-12-18 23:33:56'),
(13, 7, 'riazshop', '01820064106', 'Mirpur-2', NULL, NULL, 1, 1, '2024-02-10 07:10:46', '2024-02-10 07:10:46'),
(14, 8, 'riaz', '01820064106', 'Mirpur-2', NULL, NULL, 1, 1, '2024-02-12 05:56:16', '2024-02-12 05:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_statements`
--

CREATE TABLE `merchant_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_id` bigint(20) DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'income=1,expense=2',
  `amount` decimal(16,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_statements`
--

INSERT INTO `merchant_statements` (`id`, `expense_id`, `parcel_id`, `merchant_id`, `delivery_man_id`, `type`, `amount`, `date`, `note`, `created_at`, `updated_at`) VALUES
(1, NULL, 11, NULL, 3, 2, 0.00, '2024-02-10', 'statementNote.return_received_by_merchant_statment', '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(5, NULL, 14, NULL, 15, 1, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(6, NULL, 14, NULL, 15, 2, 60.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(7, NULL, 14, NULL, 15, 2, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(8, NULL, 16, NULL, 15, 1, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(9, NULL, 16, NULL, 15, 2, 210.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(10, NULL, 16, NULL, 15, 2, 37.80, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(11, NULL, 15, NULL, 15, 1, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(12, NULL, 15, NULL, 15, 2, 220.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(13, NULL, 15, NULL, 15, 2, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(14, NULL, 17, NULL, 15, 1, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(15, NULL, 17, NULL, 15, 2, 220.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(16, NULL, 17, NULL, 15, 2, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(17, NULL, 18, NULL, 15, 1, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(18, NULL, 18, NULL, 15, 2, 220.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(19, NULL, 18, NULL, 15, 2, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(20, NULL, 19, NULL, 15, 1, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(21, NULL, 19, NULL, 15, 2, 220.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(22, NULL, 19, NULL, 15, 2, 0.00, '2024-02-17', 'Parcel Delivered To Merchant Income', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(23, NULL, 9, NULL, 15, 1, 300.00, '2024-02-18', 'Parcel Partial Delivered To Merchant Income', '2024-02-18 11:51:23', '2024-02-18 11:51:23'),
(24, NULL, 9, NULL, 15, 2, 63.00, '2024-02-18', 'Parcel Delivered To Merchant Income', '2024-02-18 11:51:23', '2024-02-18 11:51:23'),
(25, NULL, 9, NULL, 15, 2, 0.00, '2024-02-18', 'Parcel Delivered To Merchant Income', '2024-02-18 11:51:23', '2024-02-18 11:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_09_12_000000_create_hubs_table', 1),
(2, '2014_09_12_000000_create_uploads_table', 1),
(3, '2014_10_10_040240_create_roles_table', 1),
(4, '2014_10_11_000000_create_deliverycategories_table', 1),
(5, '2014_10_11_000000_create_departments_table', 1),
(6, '2014_10_11_000000_create_designations_table', 1),
(7, '2014_10_11_000000_create_packagings_table', 1),
(8, '2014_10_11_000000_create_users_table', 1),
(9, '2014_10_11_000001_create_merchants_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_02_15_122629_create_push_notifications_table', 1),
(14, '2022_03_20_060621_create_categories_table', 1),
(15, '2022_03_24_042455_create_activity_log_table', 1),
(16, '2022_03_24_042456_add_event_column_to_activity_log_table', 1),
(17, '2022_03_24_042457_add_batch_uuid_column_to_activity_log_table', 1),
(18, '2022_04_04_142330_create_delivery_man_table', 1),
(19, '2022_04_04_142330_create_hub_incharges_table', 1),
(20, '2022_04_04_142330_create_parcels_table', 1),
(21, '2022_04_09_101126_create_delivery_charges_table', 1),
(22, '2022_04_09_101126_create_merchant_delivery_charges_table', 1),
(23, '2022_04_10_050353_create_merchant_shops_table', 1),
(24, '2022_04_13_034848_create_merchant_payments_table', 1),
(25, '2022_04_13_054047_create_accounts_table', 1),
(26, '2022_04_14_045839_create_fund_transfers_table', 1),
(27, '2022_04_14_063624_create_payments_table', 1),
(28, '2022_04_17_061311_create_payment_accounts_table', 1),
(29, '2022_04_19_035758_create_configs_table', 1),
(30, '2022_04_20_053011_create_sessions_table', 1),
(31, '2022_04_23_032024_create_permissions_table', 1),
(32, '2022_04_24_045606_create_parcel_logs_table', 1),
(33, '2022_04_27_123343_create_parcel_events_table', 1),
(34, '2022_05_14_112714_create_account_heads_table', 1),
(35, '2022_05_14_112715_create_expenses_table', 1),
(36, '2022_05_14_112717_create_deliveryman_statements_table', 1),
(37, '2022_05_15_102801_create_merchant_statements_table', 1),
(38, '2022_05_17_124213_create_incomes_table', 1),
(39, '2022_05_17_132716_create_courier_statements_table', 1),
(40, '2022_05_18_113259_create_to_dos_table', 1),
(41, '2022_05_23_111055_create_supports_table', 1),
(42, '2022_05_23_122723_create_sms_send_settings_table', 1),
(43, '2022_05_23_122723_create_sms_settings_table', 1),
(44, '2022_05_24_141546_create_vat_statements_table', 1),
(45, '2022_05_26_093710_create_bank_transactions_table', 1),
(46, '2022_05_31_094551_create_general_settings_table', 1),
(47, '2022_05_31_094551_create_notification_settings_table', 1),
(48, '2022_05_31_122026_create_assets_table', 1),
(49, '2022_05_31_122655_create_assetcategories_table', 1),
(50, '2022_05_31_150039_create_salaries_table', 1),
(51, '2022_05_6_063624_create_hub_payments_table', 1),
(52, '2022_06_01_144229_create_news_offers_table', 1),
(53, '2022_06_02_125218_create_support_chats_table', 1),
(54, '2022_06_04_104751_create_hub_statements_table', 1),
(55, '2022_06_05_093107_create_frauds_table', 1),
(56, '2022_06_05_140650_create_cash_received_from_deliverymen_table', 1),
(57, '2022_06_12_111844_create_salary_generates_table', 1),
(58, '2022_08_17_145916_create_subscribes_table', 1),
(59, '2022_09_08_102027_create_pickup_requests_table', 1),
(60, '2022_10_11_121745_create_invoices_table', 1),
(61, '2022_10_17_102458_create_settings_table', 1),
(62, '2022_10_30_135339_create_merchant_online_payments_table', 1),
(63, '2022_11_02_105821_create_merchant_online_payment_receiveds_table', 1),
(64, '2022_11_02_113430_create_merchant_settings_table', 1),
(65, '2022_12_08_104319_create_addons_table', 1),
(66, '2022_12_08_104319_create_currencies_table', 1),
(67, '2023_06_11_172412_create_social_links_table', 1),
(68, '2023_06_12_144849_create_services_table', 1),
(69, '2023_06_13_111335_create_why_couriers_table', 1),
(70, '2023_06_13_122133_create_faqs_table', 1),
(71, '2023_06_13_133544_create_partners_table', 1),
(72, '2023_06_13_154945_create_blogs_table', 1),
(73, '2023_06_13_164933_create_pages_table', 1),
(74, '2023_06_13_180141_create_sections_table', 1),
(75, '2023_10_17_122352_create_wallets_table', 1),
(76, '2023_10_8_094551_create_google_map_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_offers`
--

CREATE TABLE `news_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `file` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'active       = 1,\r\n                inactive      = 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_offers`
--

INSERT INTO `news_offers` (`id`, `author`, `title`, `description`, `file`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'TEST OFFER', NULL, 33, '2023-12-17', 1, '2023-12-17 19:03:27', '2023-12-17 19:03:27');

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fcm_secret_key` longtext DEFAULT NULL,
  `fcm_topic` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `fcm_secret_key`, `fcm_topic`, `created_at`, `updated_at`) VALUES
(1, '', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `packagings`
--

CREATE TABLE `packagings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `position` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packagings`
--

INSERT INTO `packagings` (`id`, `name`, `price`, `status`, `position`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Poly', 10.00, 1, '1', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 'Bubble Poly', 20.00, 1, '2', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 'Box', 30.00, 1, '3', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 'Box Poly', 40.00, 1, '4', NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'privacy_policy', 'Privacy & Policy', 'Deleniti magnam dignissimos similique a dolorem magni culpa vero voluptatem quia nostrum officia itaque velit reiciendis corporis quia officia labore odit maiores dolor aspernatur eum beatae alias sed et tempore dignissimos nesciunt iusto iste facere tenetur quod adipisci natus sint cumque quia cupiditate vitae rerum velit rerum quibusdam consequatur sed sequi aut qui incidunt qui repudiandae mollitia tenetur fuga inventore assumenda qui vitae molestiae consequatur aut et libero similique quidem eligendi vero mollitia dolores quos aut dolores molestias repellat quod tenetur voluptas impedit illo tempora voluptatem enim nulla voluptate qui est quo temporibus aperiam blanditiis commodi et et ut id quisquam ut suscipit cumque atque voluptas veritatis aut eligendi atque ut sunt tempora consequatur et soluta maxime nesciunt molestias est quam atque doloremque in quia aut est quasi qui minima modi explicabo sunt sit ipsa sit ipsum ipsum et quos beatae molestiae voluptas aliquid distinctio aut earum laborum libero omnis dolor voluptatem nobis aut ut ullam voluptatem labore magnam veniam voluptatum blanditiis eum unde laudantium atque aperiam a perspiciatis excepturi aperiam in quo ea ut sequi iste cumque illo iste natus rerum velit labore eum odit non eum voluptate voluptas expedita cupiditate a dolorem nulla rerum facilis illum officiis repellendus sed quis officiis rerum inventore molestias voluptatem expedita quia enim quo neque labore architecto quos vel in omnis saepe optio et et et nobis odio id suscipit vero nisi maxime ab magni est quos voluptatem adipisci illum quaerat delectus explicabo est laboriosam pariatur qui deleniti error aut aliquid et molestias animi facilis et perspiciatis ut ab incidunt incidunt maxime vel deleniti impedit voluptas labore et delectus id ipsam deleniti maiores excepturi esse aut iure ipsam vero officia fuga repellat molestias dolorem molestiae laboriosam repellendus nemo qui pariatur libero nisi recusandae aspernatur neque dolorum voluptatem magni quo quia sequi distinctio itaque cupiditate reiciendis ea quisquam nam ut vero ut non velit eveniet fuga voluptatibus molestias velit tenetur eos ex quam voluptatibus officiis dolorem non sit dolorem temporibus accusamus magni corrupti quia a saepe qui nam rerum culpa dicta quia et veniam cupiditate ut maiores aliquid eaque odio sint quia tempore ut nemo doloremque omnis expedita qui molestias deserunt repudiandae esse beatae et est eum praesentium dolor omnis cum laboriosam ipsa sit eos id sint minima alias molestiae sint voluptate exercitationem excepturi molestiae accusamus quia minima enim sunt nulla accusantium dolor voluptas nostrum et velit veritatis sunt cupiditate possimus quibusdam itaque repellendus eos officiis ipsum iusto qui cupiditate repellendus quod unde accusamus voluptatem sunt soluta eius molestiae neque ipsa molestiae dicta dolor placeat non sunt quidem molestiae aperiam sunt suscipit placeat ut sapiente molestiae suscipit velit aliquam dolores dolorem ex beatae ut aliquid quae repudiandae consequatur laudantium minima ut voluptatem dolorum iusto ea explicabo suscipit et at voluptatem autem mollitia fugiat modi sequi eum reiciendis aut quam suscipit ut aut cupiditate non non dolores dolorem tempore ut dolorem ex fugit est fugiat nesciunt fugit corrupti consequatur ut sit aliquid expedita illum quis quos necessitatibus voluptatem hic dolorum autem aut laborum quam fugiat veritatis mollitia voluptatem culpa ut consequuntur perferendis rerum sit nihil rerum voluptatem voluptatem sit autem hic omnis totam inventore incidunt laborum doloribus cumque esse consequuntur sed tempora vel dolor quisquam qui quaerat voluptas architecto sunt saepe at assumenda quisquam facere et dolorem accusamus quia aliquid dignissimos quis adipisci veniam nemo aut aperiam eum qui molestias voluptates ipsam illum quis accusamus qui illum illum illum possimus odit eius officiis perspiciatis quis soluta ad voluptatem odio sint nulla eum consectetur ut voluptatem veritatis fuga aut iusto repudiandae tempore qui qui sed molestias in aliquam dignissimos sint recusandae ab architecto voluptatem qui mollitia quae sed velit et corporis odit numquam nesciunt quis et et laudantium laboriosam quasi iure animi sit fugit temporibus dolorem alias reiciendis quibusdam nobis quaerat et quam aspernatur ullam laboriosam nesciunt nemo aut tempora consequatur rerum architecto quam maiores itaque necessitatibus molestias quisquam voluptas ut deleniti dolor reprehenderit aut voluptate aut voluptatem porro qui enim beatae minus aperiam qui accusamus cumque aspernatur est dignissimos illum alias quaerat ut earum qui expedita aut placeat hic ut repudiandae earum deleniti ut debitis autem tempora molestiae ea nostrum recusandae aliquid dignissimos qui est ut error laboriosam accusantium enim qui exercitationem illum commodi est quia sunt sit quia dolorem magni repudiandae ratione doloremque blanditiis reiciendis rerum qui fugit repudiandae debitis corrupti omnis maiores vel perspiciatis aliquid vero praesentium et qui ipsam non aliquam dolor incidunt quae eaque nostrum sit doloremque corrupti et nemo eius atque eos enim laborum ea et qui quia quia magni aut odit alias ullam quasi libero quisquam et aut architecto magni sit necessitatibus sint iusto omnis nisi atque voluptas animi natus laborum quia veritatis qui maxime itaque consequatur sapiente quas architecto rerum minus totam est non id quam repellat qui est animi ut omnis consectetur perferendis modi et vel et accusamus similique corporis ea sed est eveniet totam et sunt hic est consequatur repudiandae natus doloribus voluptas recusandae est nisi veniam esse itaque vitae molestiae perferendis fuga dicta nemo cum velit eos at maiores architecto et ducimus consequatur ut aliquid voluptatem nostrum quas exercitationem sed sed atque dolorem vel qui at est in esse et voluptate nemo necessitatibus sunt quia ut accusantium qui odit ex est et autem ex rerum quae sit quasi sit ducimus ipsa est dolores esse pariatur doloribus voluptates quam quaerat et quo accusantium rerum laudantium doloribus voluptatem nulla architecto quibusdam optio non earum a in ipsam adipisci ab aut laboriosam natus alias recusandae quia iure enim expedita in dolorem sint ab rem quia perferendis id soluta voluptatum est modi repudiandae incidunt exercitationem autem fugit itaque voluptatem doloribus aut reprehenderit unde repudiandae quasi aliquam ut impedit dolores in inventore odit deleniti voluptate perferendis quasi cum cumque eligendi corrupti ex quibusdam nulla ut modi modi omnis perferendis numquam qui sit dolorum ipsa sed vel fugiat molestiae architecto ut et voluptatem provident explicabo non autem blanditiis officiis qui occaecati qui in dolor illo voluptas dolore voluptatibus hic sapiente quis quaerat corrupti sequi dolorem illo odio dolore et iusto in sit in aliquam dicta esse sunt a eaque magnam quasi minus quasi a quidem est et excepturi et id nisi dolore ut et laboriosam quasi perspiciatis vitae expedita id quos reiciendis quod est qui numquam hic veniam incidunt qui dolorem aut iure nisi necessitatibus vel quia laudantium et cumque quas tempore totam ex suscipit sunt nulla eos at iusto saepe amet ad unde autem facere ullam nulla sed quidem tempora similique pariatur error ad est ullam voluptatum repudiandae quis aut aut dolorem odit commodi sequi culpa inventore doloribus voluptas molestiae sed aliquam molestias atque nulla animi modi eum ipsam magnam eligendi animi ducimus maxime eius totam et ex eius quis unde corrupti neque sequi eum quia impedit consequatur magni consequatur dolor officia quis praesentium quia veniam earum porro dolores quis quae fuga amet sit enim tenetur vero aut pariatur repellat voluptas consequatur perferendis eum odit vel adipisci explicabo dicta sit enim perferendis minus velit necessitatibus magni deserunt perspiciatis aut quae amet cumque voluptatibus earum doloremque neque esse maiores sed voluptates id magnam ipsa incidunt repellat officiis dolorem nulla mollitia et placeat perspiciatis sed enim harum quis ut nisi facilis architecto nobis et natus fuga dignissimos dignissimos adipisci quisquam molestias ex placeat sint magnam non autem laborum autem nihil quia est architecto tempora earum odit quos hic repellat beatae repudiandae suscipit numquam sapiente maxime laboriosam quia numquam et ea fugit numquam voluptatum sit dicta eum omnis recusandae nobis esse maiores architecto magnam rerum alias et et excepturi cupiditate autem et aut aspernatur reiciendis excepturi iusto sit natus dolores voluptatibus id numquam dolorum provident minima eligendi eum fuga nulla non enim iusto ullam id eum ratione dolores saepe beatae atque voluptatum quis earum perferendis aut accusantium omnis est quibusdam ipsum est voluptas provident.', 1, '2023-06-13 17:57:18', '2023-06-13 17:57:18'),
(2, 'terms_conditions', 'Terms & Conditions', 'Deleniti magnam dignissimos similique a dolorem magni culpa vero voluptatem quia nostrum officia itaque velit reiciendis corporis quia officia labore odit maiores dolor aspernatur eum beatae alias sed et tempore dignissimos nesciunt iusto iste facere tenetur quod adipisci natus sint cumque quia cupiditate vitae rerum velit rerum quibusdam consequatur sed sequi aut qui incidunt qui repudiandae mollitia tenetur fuga inventore assumenda qui vitae molestiae consequatur aut et libero similique quidem eligendi vero mollitia dolores quos aut dolores molestias repellat quod tenetur voluptas impedit illo tempora voluptatem enim nulla voluptate qui est quo temporibus aperiam blanditiis commodi et et ut id quisquam ut suscipit cumque atque voluptas veritatis aut eligendi atque ut sunt tempora consequatur et soluta maxime nesciunt molestias est quam atque doloremque in quia aut est quasi qui minima modi explicabo sunt sit ipsa sit ipsum ipsum et quos beatae molestiae voluptas aliquid distinctio aut earum laborum libero omnis dolor voluptatem nobis aut ut ullam voluptatem labore magnam veniam voluptatum blanditiis eum unde laudantium atque aperiam a perspiciatis excepturi aperiam in quo ea ut sequi iste cumque illo iste natus rerum velit labore eum odit non eum voluptate voluptas expedita cupiditate a dolorem nulla rerum facilis illum officiis repellendus sed quis officiis rerum inventore molestias voluptatem expedita quia enim quo neque labore architecto quos vel in omnis saepe optio et et et nobis odio id suscipit vero nisi maxime ab magni est quos voluptatem adipisci illum quaerat delectus explicabo est laboriosam pariatur qui deleniti error aut aliquid et molestias animi facilis et perspiciatis ut ab incidunt incidunt maxime vel deleniti impedit voluptas labore et delectus id ipsam deleniti maiores excepturi esse aut iure ipsam vero officia fuga repellat molestias dolorem molestiae laboriosam repellendus nemo qui pariatur libero nisi recusandae aspernatur neque dolorum voluptatem magni quo quia sequi distinctio itaque cupiditate reiciendis ea quisquam nam ut vero ut non velit eveniet fuga voluptatibus molestias velit tenetur eos ex quam voluptatibus officiis dolorem non sit dolorem temporibus accusamus magni corrupti quia a saepe qui nam rerum culpa dicta quia et veniam cupiditate ut maiores aliquid eaque odio sint quia tempore ut nemo doloremque omnis expedita qui molestias deserunt repudiandae esse beatae et est eum praesentium dolor omnis cum laboriosam ipsa sit eos id sint minima alias molestiae sint voluptate exercitationem excepturi molestiae accusamus quia minima enim sunt nulla accusantium dolor voluptas nostrum et velit veritatis sunt cupiditate possimus quibusdam itaque repellendus eos officiis ipsum iusto qui cupiditate repellendus quod unde accusamus voluptatem sunt soluta eius molestiae neque ipsa molestiae dicta dolor placeat non sunt quidem molestiae aperiam sunt suscipit placeat ut sapiente molestiae suscipit velit aliquam dolores dolorem ex beatae ut aliquid quae repudiandae consequatur laudantium minima ut voluptatem dolorum iusto ea explicabo suscipit et at voluptatem autem mollitia fugiat modi sequi eum reiciendis aut quam suscipit ut aut cupiditate non non dolores dolorem tempore ut dolorem ex fugit est fugiat nesciunt fugit corrupti consequatur ut sit aliquid expedita illum quis quos necessitatibus voluptatem hic dolorum autem aut laborum quam fugiat veritatis mollitia voluptatem culpa ut consequuntur perferendis rerum sit nihil rerum voluptatem voluptatem sit autem hic omnis totam inventore incidunt laborum doloribus cumque esse consequuntur sed tempora vel dolor quisquam qui quaerat voluptas architecto sunt saepe at assumenda quisquam facere et dolorem accusamus quia aliquid dignissimos quis adipisci veniam nemo aut aperiam eum qui molestias voluptates ipsam illum quis accusamus qui illum illum illum possimus odit eius officiis perspiciatis quis soluta ad voluptatem odio sint nulla eum consectetur ut voluptatem veritatis fuga aut iusto repudiandae tempore qui qui sed molestias in aliquam dignissimos sint recusandae ab architecto voluptatem qui mollitia quae sed velit et corporis odit numquam nesciunt quis et et laudantium laboriosam quasi iure animi sit fugit temporibus dolorem alias reiciendis quibusdam nobis quaerat et quam aspernatur ullam laboriosam nesciunt nemo aut tempora consequatur rerum architecto quam maiores itaque necessitatibus molestias quisquam voluptas ut deleniti dolor reprehenderit aut voluptate aut voluptatem porro qui enim beatae minus aperiam qui accusamus cumque aspernatur est dignissimos illum alias quaerat ut earum qui expedita aut placeat hic ut repudiandae earum deleniti ut debitis autem tempora molestiae ea nostrum recusandae aliquid dignissimos qui est ut error laboriosam accusantium enim qui exercitationem illum commodi est quia sunt sit quia dolorem magni repudiandae ratione doloremque blanditiis reiciendis rerum qui fugit repudiandae debitis corrupti omnis maiores vel perspiciatis aliquid vero praesentium et qui ipsam non aliquam dolor incidunt quae eaque nostrum sit doloremque corrupti et nemo eius atque eos enim laborum ea et qui quia quia magni aut odit alias ullam quasi libero quisquam et aut architecto magni sit necessitatibus sint iusto omnis nisi atque voluptas animi natus laborum quia veritatis qui maxime itaque consequatur sapiente quas architecto rerum minus totam est non id quam repellat qui est animi ut omnis consectetur perferendis modi et vel et accusamus similique corporis ea sed est eveniet totam et sunt hic est consequatur repudiandae natus doloribus voluptas recusandae est nisi veniam esse itaque vitae molestiae perferendis fuga dicta nemo cum velit eos at maiores architecto et ducimus consequatur ut aliquid voluptatem nostrum quas exercitationem sed sed atque dolorem vel qui at est in esse et voluptate nemo necessitatibus sunt quia ut accusantium qui odit ex est et autem ex rerum quae sit quasi sit ducimus ipsa est dolores esse pariatur doloribus voluptates quam quaerat et quo accusantium rerum laudantium doloribus voluptatem nulla architecto quibusdam optio non earum a in ipsam adipisci ab aut laboriosam natus alias recusandae quia iure enim expedita in dolorem sint ab rem quia perferendis id soluta voluptatum est modi repudiandae incidunt exercitationem autem fugit itaque voluptatem doloribus aut reprehenderit unde repudiandae quasi aliquam ut impedit dolores in inventore odit deleniti voluptate perferendis quasi cum cumque eligendi corrupti ex quibusdam nulla ut modi modi omnis perferendis numquam qui sit dolorum ipsa sed vel fugiat molestiae architecto ut et voluptatem provident explicabo non autem blanditiis officiis qui occaecati qui in dolor illo voluptas dolore voluptatibus hic sapiente quis quaerat corrupti sequi dolorem illo odio dolore et iusto in sit in aliquam dicta esse sunt a eaque magnam quasi minus quasi a quidem est et excepturi et id nisi dolore ut et laboriosam quasi perspiciatis vitae expedita id quos reiciendis quod est qui numquam hic veniam incidunt qui dolorem aut iure nisi necessitatibus vel quia laudantium et cumque quas tempore totam ex suscipit sunt nulla eos at iusto saepe amet ad unde autem facere ullam nulla sed quidem tempora similique pariatur error ad est ullam voluptatum repudiandae quis aut aut dolorem odit commodi sequi culpa inventore doloribus voluptas molestiae sed aliquam molestias atque nulla animi modi eum ipsam magnam eligendi animi ducimus maxime eius totam et ex eius quis unde corrupti neque sequi eum quia impedit consequatur magni consequatur dolor officia quis praesentium quia veniam earum porro dolores quis quae fuga amet sit enim tenetur vero aut pariatur repellat voluptas consequatur perferendis eum odit vel adipisci explicabo dicta sit enim perferendis minus velit necessitatibus magni deserunt perspiciatis aut quae amet cumque voluptatibus earum doloremque neque esse maiores sed voluptates id magnam ipsa incidunt repellat officiis dolorem nulla mollitia et placeat perspiciatis sed enim harum quis ut nisi facilis architecto nobis et natus fuga dignissimos dignissimos adipisci quisquam molestias ex placeat sint magnam non autem laborum autem nihil quia est architecto tempora earum odit quos hic repellat beatae repudiandae suscipit numquam sapiente maxime laboriosam quia numquam et ea fugit numquam voluptatum sit dicta eum omnis recusandae nobis esse maiores architecto magnam rerum alias et et excepturi cupiditate autem et aut aspernatur reiciendis excepturi iusto sit natus dolores voluptatibus id numquam dolorum provident minima eligendi eum fuga nulla non enim iusto ullam id eum ratione dolores saepe beatae atque voluptatum quis earum perferendis aut accusantium omnis est quibusdam ipsum est voluptas provident.', 1, '2023-06-13 17:57:18', '2023-06-13 17:57:18'),
(3, 'about_us', 'About Us', 'Deleniti magnam dignissimos similique a dolorem magni culpa vero voluptatem quia nostrum officia itaque velit reiciendis corporis quia officia labore odit maiores dolor aspernatur eum beatae alias sed et tempore dignissimos nesciunt iusto iste facere tenetur quod adipisci natus sint cumque quia cupiditate vitae rerum velit rerum quibusdam consequatur sed sequi aut qui incidunt qui repudiandae mollitia tenetur fuga inventore assumenda qui vitae molestiae consequatur aut et libero similique quidem eligendi vero mollitia dolores quos aut dolores molestias repellat quod tenetur voluptas impedit illo tempora voluptatem enim nulla voluptate qui est quo temporibus aperiam blanditiis commodi et et ut id quisquam ut suscipit cumque atque voluptas veritatis aut eligendi atque ut sunt tempora consequatur et soluta maxime nesciunt molestias est quam atque doloremque in quia aut est quasi qui minima modi explicabo sunt sit ipsa sit ipsum ipsum et quos beatae molestiae voluptas aliquid distinctio aut earum laborum libero omnis dolor voluptatem nobis aut ut ullam voluptatem labore magnam veniam voluptatum blanditiis eum unde laudantium atque aperiam a perspiciatis excepturi aperiam in quo ea ut sequi iste cumque illo iste natus rerum velit labore eum odit non eum voluptate voluptas expedita cupiditate a dolorem nulla rerum facilis illum officiis repellendus sed quis officiis rerum inventore molestias voluptatem expedita quia enim quo neque labore architecto quos vel in omnis saepe optio et et et nobis odio id suscipit vero nisi maxime ab magni est quos voluptatem adipisci illum quaerat delectus explicabo est laboriosam pariatur qui deleniti error aut aliquid et molestias animi facilis et perspiciatis ut ab incidunt incidunt maxime vel deleniti impedit voluptas labore et delectus id ipsam deleniti maiores excepturi esse aut iure ipsam vero officia fuga repellat molestias dolorem molestiae laboriosam repellendus nemo qui pariatur libero nisi recusandae aspernatur neque dolorum voluptatem magni quo quia sequi distinctio itaque cupiditate reiciendis ea quisquam nam ut vero ut non velit eveniet fuga voluptatibus molestias velit tenetur eos ex quam voluptatibus officiis dolorem non sit dolorem temporibus accusamus magni corrupti quia a saepe qui nam rerum culpa dicta quia et veniam cupiditate ut maiores aliquid eaque odio sint quia tempore ut nemo doloremque omnis expedita qui molestias deserunt repudiandae esse beatae et est eum praesentium dolor omnis cum laboriosam ipsa sit eos id sint minima alias molestiae sint voluptate exercitationem excepturi molestiae accusamus quia minima enim sunt nulla accusantium dolor voluptas nostrum et velit veritatis sunt cupiditate possimus quibusdam itaque repellendus eos officiis ipsum iusto qui cupiditate repellendus quod unde accusamus voluptatem sunt soluta eius molestiae neque ipsa molestiae dicta dolor placeat non sunt quidem molestiae aperiam sunt suscipit placeat ut sapiente molestiae suscipit velit aliquam dolores dolorem ex beatae ut aliquid quae repudiandae consequatur laudantium minima ut voluptatem dolorum iusto ea explicabo suscipit et at voluptatem autem mollitia fugiat modi sequi eum reiciendis aut quam suscipit ut aut cupiditate non non dolores dolorem tempore ut dolorem ex fugit est fugiat nesciunt fugit corrupti consequatur ut sit aliquid expedita illum quis quos necessitatibus voluptatem hic dolorum autem aut laborum quam fugiat veritatis mollitia voluptatem culpa ut consequuntur perferendis rerum sit nihil rerum voluptatem voluptatem sit autem hic omnis totam inventore incidunt laborum doloribus cumque esse consequuntur sed tempora vel dolor quisquam qui quaerat voluptas architecto sunt saepe at assumenda quisquam facere et dolorem accusamus quia aliquid dignissimos quis adipisci veniam nemo aut aperiam eum qui molestias voluptates ipsam illum quis accusamus qui illum illum illum possimus odit eius officiis perspiciatis quis soluta ad voluptatem odio sint nulla eum consectetur ut voluptatem veritatis fuga aut iusto repudiandae tempore qui qui sed molestias in aliquam dignissimos sint recusandae ab architecto voluptatem qui mollitia quae sed velit et corporis odit numquam nesciunt quis et et laudantium laboriosam quasi iure animi sit fugit temporibus dolorem alias reiciendis quibusdam nobis quaerat et quam aspernatur ullam laboriosam nesciunt nemo aut tempora consequatur rerum architecto quam maiores itaque necessitatibus molestias quisquam voluptas ut deleniti dolor reprehenderit aut voluptate aut voluptatem porro qui enim beatae minus aperiam qui accusamus cumque aspernatur est dignissimos illum alias quaerat ut earum qui expedita aut placeat hic ut repudiandae earum deleniti ut debitis autem tempora molestiae ea nostrum recusandae aliquid dignissimos qui est ut error laboriosam accusantium enim qui exercitationem illum commodi est quia sunt sit quia dolorem magni repudiandae ratione doloremque blanditiis reiciendis rerum qui fugit repudiandae debitis corrupti omnis maiores vel perspiciatis aliquid vero praesentium et qui ipsam non aliquam dolor incidunt quae eaque nostrum sit doloremque corrupti et nemo eius atque eos enim laborum ea et qui quia quia magni aut odit alias ullam quasi libero quisquam et aut architecto magni sit necessitatibus sint iusto omnis nisi atque voluptas animi natus laborum quia veritatis qui maxime itaque consequatur sapiente quas architecto rerum minus totam est non id quam repellat qui est animi ut omnis consectetur perferendis modi et vel et accusamus similique corporis ea sed est eveniet totam et sunt hic est consequatur repudiandae natus doloribus voluptas recusandae est nisi veniam esse itaque vitae molestiae perferendis fuga dicta nemo cum velit eos at maiores architecto et ducimus consequatur ut aliquid voluptatem nostrum quas exercitationem sed sed atque dolorem vel qui at est in esse et voluptate nemo necessitatibus sunt quia ut accusantium qui odit ex est et autem ex rerum quae sit quasi sit ducimus ipsa est dolores esse pariatur doloribus voluptates quam quaerat et quo accusantium rerum laudantium doloribus voluptatem nulla architecto quibusdam optio non earum a in ipsam adipisci ab aut laboriosam natus alias recusandae quia iure enim expedita in dolorem sint ab rem quia perferendis id soluta voluptatum est modi repudiandae incidunt exercitationem autem fugit itaque voluptatem doloribus aut reprehenderit unde repudiandae quasi aliquam ut impedit dolores in inventore odit deleniti voluptate perferendis quasi cum cumque eligendi corrupti ex quibusdam nulla ut modi modi omnis perferendis numquam qui sit dolorum ipsa sed vel fugiat molestiae architecto ut et voluptatem provident explicabo non autem blanditiis officiis qui occaecati qui in dolor illo voluptas dolore voluptatibus hic sapiente quis quaerat corrupti sequi dolorem illo odio dolore et iusto in sit in aliquam dicta esse sunt a eaque magnam quasi minus quasi a quidem est et excepturi et id nisi dolore ut et laboriosam quasi perspiciatis vitae expedita id quos reiciendis quod est qui numquam hic veniam incidunt qui dolorem aut iure nisi necessitatibus vel quia laudantium et cumque quas tempore totam ex suscipit sunt nulla eos at iusto saepe amet ad unde autem facere ullam nulla sed quidem tempora similique pariatur error ad est ullam voluptatum repudiandae quis aut aut dolorem odit commodi sequi culpa inventore doloribus voluptas molestiae sed aliquam molestias atque nulla animi modi eum ipsam magnam eligendi animi ducimus maxime eius totam et ex eius quis unde corrupti neque sequi eum quia impedit consequatur magni consequatur dolor officia quis praesentium quia veniam earum porro dolores quis quae fuga amet sit enim tenetur vero aut pariatur repellat voluptas consequatur perferendis eum odit vel adipisci explicabo dicta sit enim perferendis minus velit necessitatibus magni deserunt perspiciatis aut quae amet cumque voluptatibus earum doloremque neque esse maiores sed voluptates id magnam ipsa incidunt repellat officiis dolorem nulla mollitia et placeat perspiciatis sed enim harum quis ut nisi facilis architecto nobis et natus fuga dignissimos dignissimos adipisci quisquam molestias ex placeat sint magnam non autem laborum autem nihil quia est architecto tempora earum odit quos hic repellat beatae repudiandae suscipit numquam sapiente maxime laboriosam quia numquam et ea fugit numquam voluptatum sit dicta eum omnis recusandae nobis esse maiores architecto magnam rerum alias et et excepturi cupiditate autem et aut aspernatur reiciendis excepturi iusto sit natus dolores voluptatibus id numquam dolorum provident minima eligendi eum fuga nulla non enim iusto ullam id eum ratione dolores saepe beatae atque voluptatum quis earum perferendis aut accusantium omnis est quibusdam ipsum est voluptas provident.', 1, '2023-06-13 17:57:18', '2023-06-13 17:57:18'),
(4, 'faq', 'Have Question', 'Take a look at the most commonly asked questions.', 1, '2023-06-13 17:57:18', '2023-06-13 17:57:18'),
(5, 'contact', 'Contact Us', 'Take a look at the most commonly asked questions.', 1, '2023-06-13 17:57:18', '2023-06-13 17:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `merchant_shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pickup_address` longtext DEFAULT NULL,
  `pickup_phone` varchar(191) DEFAULT NULL,
  `pickup_lat` varchar(191) DEFAULT NULL,
  `pickup_long` varchar(191) DEFAULT NULL,
  `customer_lat` varchar(191) DEFAULT NULL,
  `customer_long` varchar(191) DEFAULT NULL,
  `priority_type_id` varchar(191) DEFAULT NULL,
  `customer_name` varchar(191) DEFAULT NULL,
  `customer_phone` varchar(191) DEFAULT NULL,
  `customer_address` longtext DEFAULT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `category_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `weight` bigint(20) DEFAULT 0,
  `delivery_type_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `packaging_id` bigint(20) DEFAULT NULL,
  `first_hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transfer_hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cash_collection` decimal(13,2) DEFAULT NULL,
  `old_cash_collection` decimal(13,2) DEFAULT NULL,
  `selling_price` decimal(13,2) DEFAULT NULL,
  `liquid_fragile_amount` decimal(13,2) DEFAULT NULL,
  `packaging_amount` decimal(13,2) DEFAULT NULL,
  `delivery_charge` decimal(13,2) DEFAULT NULL,
  `cod_charge` bigint(20) DEFAULT NULL,
  `cod_amount` decimal(13,2) DEFAULT NULL,
  `vat` bigint(20) DEFAULT NULL,
  `vat_amount` decimal(13,2) DEFAULT NULL,
  `total_delivery_amount` decimal(13,2) DEFAULT NULL,
  `current_payable` decimal(13,2) DEFAULT NULL,
  `tracking_id` varchar(191) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `partial_delivered` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'no=0,yes=1',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'pending             = 1,\n                 picup_assign        = 2,\n                 received_warehouse  = 3,\n                 delivery_man_assign = 4,\n                 deliver             = 5,\n                 delivered           = 6,\n                 return_warehouse    = 7,\n                 assign_merchant     = 8,\n                 returned_merchant   = 9',
  `parcel_bank` varchar(191) DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `return_charges` decimal(13,2) DEFAULT NULL COMMENT 'received by merchant return charges',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `merchant_id`, `merchant_shop_id`, `pickup_address`, `pickup_phone`, `pickup_lat`, `pickup_long`, `customer_lat`, `customer_long`, `priority_type_id`, `customer_name`, `customer_phone`, `customer_address`, `invoice_no`, `category_id`, `weight`, `delivery_type_id`, `packaging_id`, `first_hub_id`, `hub_id`, `transfer_hub_id`, `cash_collection`, `old_cash_collection`, `selling_price`, `liquid_fragile_amount`, `packaging_amount`, `delivery_charge`, `cod_charge`, `cod_amount`, `vat`, `vat_amount`, `total_delivery_amount`, `current_payable`, `tracking_id`, `note`, `partial_delivered`, `status`, `parcel_bank`, `pickup_date`, `delivery_date`, `delivery_time`, `return_charges`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Wemaxdevs,Dhaka', '+88013000000', '', '', '', '', NULL, 'Islam', '0156465156', 'Mirpur', '', 1, 1, 2, NULL, 4, 2, NULL, 1000.00, NULL, NULL, NULL, NULL, 60.00, 1, 10.00, 0, 0.00, 70.00, 930.00, 'DP702143633C1', '', 0, 5, NULL, '2023-12-10', '2023-12-11', NULL, NULL, '2023-12-10 01:40:33', '2024-02-14 13:51:13'),
(2, 1, 1, 'Weligama, Sri Lanka.', '0094762909095', '', '', '', '', NULL, 'Gulappi Raja', '0094782343434', '23, Vijitha Road, Pamankada.', 'KEE342983', 1, 1, 1, 1, 8, 8, NULL, 14286.65, NULL, 1200.00, 20.00, 10.00, 50.00, 1, 142.87, 0, 0.00, 222.87, 14063.78, 'DP702822078C1', '', 0, 5, 'on', '2023-12-17', '2023-12-17', '2024-02-07 17:11:00', NULL, '2023-12-17 22:07:58', '2024-02-19 19:56:02'),
(3, 5, 10, 'Pamunugama Road, Gampaha', '0094776345465', '', '', '', '', '2', 'Shapoorji', '0094778989898', 'Lakshman Place, Gampaha', 'DP20202043', 1, 1, 2, NULL, 2, 4, NULL, 8950.00, NULL, 5000.00, 20.00, NULL, 60.00, 1, 89.50, 0, 0.00, 169.50, 8780.50, 'DP702916797C5', '', 0, 5, NULL, '2024-02-07', '2024-02-08', NULL, NULL, '2023-12-19 00:26:37', '2024-02-10 04:16:19'),
(4, 1, 5, 'Bambalapitiya, Colombo - 05', '0094762909090', NULL, NULL, NULL, NULL, '2', 'Dhanapaal Govindan', '0094780454545', '64, Nugegoda, Colombo', 'DP342107', 1, 4, 3, NULL, 8, 2, NULL, 8400.00, NULL, 7300.00, 20.00, NULL, 0.00, 2, 168.00, 0, 0.00, 378.00, 8022.00, 'DP703497287C1', NULL, 0, 5, NULL, '2023-12-25', '2023-12-27', '2024-02-01 18:30:00', NULL, '2023-12-25 17:41:27', '2024-02-17 17:38:41'),
(8, 1, 1, 'Weligama, Sri Lanka.', '0094762909095', '', '', '23.7862912', '90.3708672', '2', 'Sajib', '01254784578', 'Mirpur -10', '0', 1, 1, 1, 1, 8, 3, 2, 0.00, NULL, 100.00, NULL, 10.00, 50.00, 1, 0.00, 0, 0.00, 60.00, -60.00, 'DP706782226C18', 'hello', 0, 6, NULL, '2024-02-01', '2024-02-01', '2024-02-01 18:40:00', NULL, '2024-02-01 15:10:26', '2024-02-14 13:51:44'),
(9, 7, 13, 'Mirpur-2', '01820064106', '', '', '23.7985396', '90.3654296', '2', 'Islam', '0156465156', 'asdfadsf', '', 1, 1, 2, NULL, 2, 2, NULL, 300.00, 1000.00, NULL, NULL, NULL, 60.00, 1, 3.00, 0, 0.00, 63.00, 237.00, 'DP707562347C19', '', 1, 32, NULL, '2024-02-11', '2024-02-12', '2024-02-18 16:50:00', NULL, '2024-02-10 04:52:27', '2024-02-18 11:51:22'),
(10, 7, 13, 'Bambalapitiya, Colombo - 05', '0094762909090', '', '', '23.7985396', '90.3654296', '2', 'Dhanapaal Govindan', '0094780454545', 'adf', 'DP342107', 1, 4, 3, NULL, 8, 8, NULL, 8400.00, NULL, 7300.00, 20.00, NULL, 0.00, 2, 168.00, 0, 0.00, 378.00, 8022.00, 'DP707564839C110', '', 0, 9, NULL, '2024-02-10', '2024-02-12', '2024-02-21 19:36:00', NULL, '2024-02-10 05:33:59', '2024-02-11 05:18:47'),
(11, 1, 13, 'Bambalapitiya, Colombo - 05', '0094762909090', '', '', '23.7985396', '90.3654296', NULL, 'Dhanapaal Govindan', '0094780454545', 'asdf', 'DP342107', 1, 4, 3, NULL, 8, 8, NULL, 8400.00, NULL, 7300.00, 20.00, NULL, 0.00, 2, 168.00, 0, 0.00, 378.00, 8022.00, 'DP707565255C111', '', 0, 30, NULL, '2024-02-28', '2024-02-14', '2024-02-29 18:11:00', 0.00, '2024-02-10 05:40:55', '2024-02-10 06:13:36'),
(14, 8, 14, 'Mirpur-2', '01820064106', '', '', '23.7985396', '90.3654296', '2', 'asdf', '01524654654', 'house 12 road 03, Dhaka 1216, Bangladesh', '', 1, 1, 2, NULL, 2, 1, NULL, 0.00, NULL, NULL, NULL, NULL, 60.00, 1, 0.00, 0, 0.00, 60.00, -60.00, 'DP707901972C8', 'asdf', 0, 9, NULL, '2024-02-14', '2024-02-15', '2024-02-17 20:00:00', NULL, '2024-02-14 14:12:52', '2024-02-17 15:50:31'),
(15, 8, 14, 'Mirpur-2', '01820064106', '', '', '23.7961216', '90.3675904', '2', 'Sajib', '01685487457', '435 South Monipur Rd, Dhaka, Bangladesh', '1212', 1, 5, 1, 1, 2, 2, NULL, 0.00, NULL, 100.00, NULL, 10.00, 210.00, 1, 0.00, 0, 0.00, 220.00, -220.00, 'DP708161242C815', 'hello', 0, 9, NULL, '2024-02-17', '2024-02-17', '2024-02-17 15:14:00', NULL, '2024-02-17 14:14:02', '2024-02-17 16:53:15'),
(16, 4, 9, 'Main Street, Pettah.', '0094777123459', '', '', '23.7961216', '90.3675904', '2', 'ABC', '215641654654', '435 South Monipur Rd, Dhaka, Bangladesh', '211', 1, 5, 1, NULL, 2, 2, NULL, 0.00, NULL, 100.00, NULL, NULL, 210.00, 1, 0.00, 18, 37.80, 210.00, -247.80, 'DP708165739C416', 'hello', 0, 9, NULL, '2024-02-17', '2024-02-17', '2024-02-17 21:31:00', NULL, '2024-02-17 15:28:59', '2024-02-17 15:52:59'),
(17, 8, 14, 'Barmis Market Area/Cox,s Bazar', '01627413327', '', '', '23.7953948', '90.3649984', '2', 'Sajib', '01627413327', '252 W Monipur, Dhaka 1216, Bangladesh', '1234', 1, 5, 1, 1, 2, 3, NULL, 0.00, NULL, 100.00, NULL, 10.00, 210.00, 1, 0.00, 0, 0.00, 220.00, -220.00, 'DP708171044C817', 'hello', 0, 24, NULL, '2024-02-17', '2024-02-17', '2024-02-17 21:00:00', NULL, '2024-02-17 16:57:24', '2024-02-17 17:00:55'),
(18, 8, 14, 'Mirpur-2', '01820064106', '', '', '23.7961216', '90.3675904', '2', 'Sajib', '01254874747', '435 South Monipur Rd, Dhaka, Bangladesh', '2121', 1, 5, 1, 1, 2, 3, NULL, 0.00, NULL, 100.00, NULL, 10.00, 210.00, 1, 0.00, 0, 0.00, 220.00, -220.00, 'DP708171405C818', 'hello', 0, 9, NULL, '2024-02-17', '2024-02-17', '2024-02-17 21:04:00', NULL, '2024-02-17 17:03:25', '2024-02-17 17:05:22'),
(19, 8, 14, 'Mirpur-2', '01820064106', '', '', '23.7961216', '90.3675904', '2', 'Sajib Raj', '017454154747', '435 South Monipur Rd, Dhaka, Bangladesh', '12345', 1, 5, 1, 1, 2, 2, NULL, 0.00, NULL, NULL, NULL, 10.00, 210.00, 1, 0.00, 0, 0.00, 220.00, -220.00, 'DP708173489C819', 'he', 0, 9, NULL, '2024-02-17', '2024-02-17', '2024-02-17 21:40:00', NULL, '2024-02-17 17:38:09', '2024-02-17 17:50:48'),
(20, 8, 14, 'Mirpur-2', '01820064106', '', '', '23.7956037', '90.3536548', '2', 'Sajib', '01745214547', 'Mirpur-1, Dhaka, Bangladesh', '1234', 1, 5, 1, 1, 2, 2, NULL, 0.00, NULL, NULL, NULL, 10.00, 210.00, 1, 0.00, 0, 0.00, 220.00, -220.00, 'DP708238889C820', 'hello', 0, 24, NULL, '2024-02-18', '2024-02-18', '2024-02-18 17:48:00', NULL, '2024-02-18 11:48:09', '2024-02-18 11:49:57'),
(21, 4, 9, 'Main Street, Pettah.', '0094777123459', '', '', '6.873446179923122', '79.87010386073331', '2', 'Danapal Ramu', '+94777987654', '127 Veluwanarama Rd, Colombo, Sri Lanka', '#4585265', 1, 5, 1, NULL, 2, 2, NULL, 6500.00, NULL, 4800.00, NULL, NULL, 210.00, 1, 65.00, 18, 49.50, 275.00, 6175.50, 'DP708355090C421', '', 0, 1, NULL, '2024-02-19', '2024-02-19', NULL, NULL, '2024-02-19 20:04:50', '2024-02-19 20:04:50'),
(22, 4, 9, 'Main Street, Pettah.', '0094777123459', '', '', '6.872583040818795', '79.87007211681446', '2', 'Danapal Ramu', '+94777987654', '41 Sri Saranankara Rd, Dehiwala-Mount Lavinia, Sri Lanka', '#DF985452', 1, 1, 2, NULL, 2, 2, NULL, 6500.00, NULL, 4800.00, NULL, NULL, 60.00, 1, 65.00, 18, 22.50, 125.00, 6352.50, 'DP708355163C422', '', 0, 1, NULL, '2024-02-19', '2024-02-20', NULL, NULL, '2024-02-19 20:06:03', '2024-02-19 20:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_events`
--

CREATE TABLE `parcel_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parcel_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pickup_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transfer_delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `parcel_status` tinyint(4) DEFAULT NULL,
  `delivery_lat` varchar(191) DEFAULT NULL,
  `delivery_long` varchar(191) DEFAULT NULL,
  `signature_image` longtext DEFAULT NULL,
  `delivered_image` longtext DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parcel_events`
--

INSERT INTO `parcel_events` (`id`, `parcel_id`, `delivery_man_id`, `pickup_man_id`, `hub_id`, `transfer_delivery_man_id`, `note`, `parcel_status`, `delivery_lat`, `delivery_long`, `signature_image`, `delivered_image`, `created_by`, `created_at`, `updated_at`) VALUES
(13, 4, NULL, 6, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, 1, '2023-12-27 14:30:02', '2023-12-27 14:30:02'),
(14, 4, NULL, NULL, 2, NULL, 'sss', 5, NULL, NULL, NULL, NULL, 1, '2024-02-01 14:41:56', '2024-02-01 14:41:56'),
(17, 8, NULL, 1, NULL, NULL, 'ddddd', 2, NULL, NULL, NULL, NULL, 1, '2024-02-01 15:12:57', '2024-02-01 15:12:57'),
(18, 8, NULL, NULL, 3, NULL, 'sss', 5, NULL, NULL, NULL, NULL, 1, '2024-02-01 15:19:35', '2024-02-01 15:19:35'),
(20, 2, NULL, 6, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, 1, '2024-02-07 16:11:04', '2024-02-07 16:11:04'),
(21, 2, NULL, NULL, 8, NULL, '', 5, NULL, NULL, NULL, NULL, 1, '2024-02-07 16:11:14', '2024-02-07 16:11:14'),
(24, 3, NULL, 5, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, 1, '2024-02-10 04:14:59', '2024-02-10 04:14:59'),
(25, 3, NULL, 5, NULL, NULL, '', 3, NULL, NULL, NULL, NULL, 1, '2024-02-10 04:15:39', '2024-02-10 04:15:39'),
(26, 3, NULL, NULL, 4, NULL, '', 5, NULL, NULL, NULL, NULL, 1, '2024-02-10 04:16:19', '2024-02-10 04:16:19'),
(27, 11, NULL, 1, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, 2, '2024-02-10 06:11:14', '2024-02-10 06:11:14'),
(29, 11, NULL, NULL, 8, NULL, '', 5, NULL, NULL, NULL, NULL, 2, '2024-02-10 06:11:37', '2024-02-10 06:11:37'),
(31, 11, 3, NULL, NULL, NULL, 'asdf', 8, NULL, NULL, NULL, NULL, 2, '2024-02-10 06:13:19', '2024-02-10 06:13:19'),
(32, 11, NULL, NULL, NULL, NULL, '', 24, NULL, NULL, NULL, NULL, 2, '2024-02-10 06:13:25', '2024-02-10 06:13:25'),
(34, 11, NULL, NULL, NULL, NULL, '', 30, NULL, NULL, NULL, NULL, 2, '2024-02-10 06:13:36', '2024-02-10 06:13:36'),
(35, 10, NULL, 2, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, 1, '2024-02-10 06:13:53', '2024-02-10 06:13:53'),
(36, 10, NULL, NULL, 8, NULL, '', 5, NULL, NULL, NULL, NULL, 1, '2024-02-10 06:13:58', '2024-02-10 06:13:58'),
(68, 10, NULL, NULL, NULL, NULL, '', 9, NULL, NULL, NULL, NULL, 1, '2024-02-11 05:18:47', '2024-02-11 05:18:47'),
(70, 9, NULL, NULL, 8, NULL, '', 5, NULL, NULL, NULL, NULL, 1, '2024-02-11 05:20:44', '2024-02-11 05:20:44'),
(75, 9, 4, NULL, NULL, NULL, 'asdf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:26:40', '2024-02-11 05:26:40'),
(76, 9, 4, NULL, NULL, NULL, 'asdf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:27:08', '2024-02-11 05:27:08'),
(77, 9, 4, NULL, NULL, NULL, 'asdf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:27:32', '2024-02-11 05:27:32'),
(78, 9, 3, NULL, NULL, NULL, 'adf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:27:51', '2024-02-11 05:27:51'),
(79, 9, 3, NULL, NULL, NULL, 'adf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:28:17', '2024-02-11 05:28:17'),
(80, 9, 3, NULL, NULL, NULL, 'adf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:28:31', '2024-02-11 05:28:31'),
(81, 9, 3, NULL, NULL, NULL, 'adsf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:35:58', '2024-02-11 05:35:58'),
(82, 9, 3, NULL, NULL, NULL, 'adsf', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:36:18', '2024-02-11 05:36:18'),
(83, 9, 4, NULL, NULL, NULL, '', NULL, '', '', NULL, NULL, 1, '2024-02-11 05:37:19', '2024-02-11 05:37:19'),
(90, 1, NULL, 3, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, 1, '2024-02-14 13:50:59', '2024-02-14 13:50:59'),
(91, 1, NULL, NULL, 2, NULL, '', 5, NULL, NULL, NULL, NULL, 1, '2024-02-14 13:51:13', '2024-02-14 13:51:13'),
(92, 8, NULL, NULL, 2, 3, '', 6, NULL, NULL, NULL, NULL, 1, '2024-02-14 13:51:44', '2024-02-14 13:51:44'),
(101, 14, NULL, 15, NULL, NULL, 'ssss', 2, NULL, NULL, NULL, NULL, 1, '2024-02-17 13:59:10', '2024-02-17 13:59:10'),
(102, 14, NULL, NULL, 1, NULL, 'dddd', 5, NULL, NULL, NULL, NULL, 1, '2024-02-17 14:03:25', '2024-02-17 14:03:25'),
(104, 15, NULL, 15, NULL, NULL, 'ddd', 2, NULL, NULL, NULL, NULL, 1, '2024-02-17 14:14:23', '2024-02-17 14:14:23'),
(105, 15, NULL, NULL, 2, NULL, 'ddd', 5, NULL, NULL, NULL, NULL, 1, '2024-02-17 14:14:41', '2024-02-17 14:14:41'),
(106, 15, 15, NULL, NULL, NULL, 'ddddd', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-17 14:14:59', '2024-02-17 14:14:59'),
(107, 14, 15, NULL, NULL, NULL, 'hello', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-17 14:59:03', '2024-02-17 14:59:03'),
(110, 16, NULL, 15, NULL, NULL, 'hello', 2, NULL, NULL, NULL, NULL, 1, '2024-02-17 15:31:00', '2024-02-17 15:31:00'),
(111, 16, NULL, NULL, 2, NULL, 'ddd', 5, NULL, NULL, NULL, NULL, 1, '2024-02-17 15:31:21', '2024-02-17 15:31:21'),
(112, 16, 15, NULL, NULL, NULL, 'dddd', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-17 15:31:42', '2024-02-17 15:31:42'),
(113, 14, NULL, NULL, NULL, NULL, 'sdfsdf', 9, NULL, NULL, NULL, NULL, 35, '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(114, 16, NULL, NULL, NULL, NULL, 'sdfsdf', 9, NULL, NULL, NULL, NULL, 35, '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(115, 15, NULL, NULL, NULL, NULL, 'not working', 9, NULL, NULL, NULL, NULL, 35, '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(116, 17, NULL, 15, NULL, NULL, 'dddd', 2, NULL, NULL, NULL, NULL, 1, '2024-02-17 16:57:43', '2024-02-17 16:57:43'),
(117, 17, NULL, NULL, 3, NULL, 'ghfgf', 5, NULL, NULL, NULL, NULL, 1, '2024-02-17 16:58:27', '2024-02-17 16:58:27'),
(118, 17, 15, NULL, NULL, NULL, 'fgfgff', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-17 16:58:59', '2024-02-17 16:58:59'),
(119, 17, NULL, NULL, NULL, NULL, 'yeabworking', 9, NULL, NULL, NULL, NULL, 35, '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(120, 17, NULL, NULL, NULL, NULL, 'return', 24, NULL, NULL, NULL, NULL, 35, '2024-02-17 17:00:55', '2024-02-17 17:00:55'),
(121, 18, NULL, 15, NULL, NULL, 'hello', 2, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:03:59', '2024-02-17 17:03:59'),
(122, 18, NULL, NULL, 3, NULL, 'dddd', 5, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:04:13', '2024-02-17 17:04:13'),
(123, 18, 15, NULL, NULL, NULL, 'dddd', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-17 17:04:36', '2024-02-17 17:04:36'),
(124, 18, NULL, NULL, NULL, NULL, 'delivered', 9, NULL, NULL, NULL, NULL, 35, '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(127, 19, NULL, 15, NULL, NULL, 'hello', 2, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:45:06', '2024-02-17 17:45:06'),
(128, 19, NULL, NULL, 2, NULL, 'hello', 5, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:45:31', '2024-02-17 17:45:31'),
(129, 19, 15, NULL, NULL, NULL, 'hello', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-17 17:45:59', '2024-02-17 17:45:59'),
(130, 19, NULL, NULL, NULL, NULL, 'hello', 9, NULL, NULL, NULL, NULL, 35, '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(131, 20, NULL, 15, NULL, NULL, 'ddddd', 2, NULL, NULL, NULL, NULL, 1, '2024-02-18 11:48:25', '2024-02-18 11:48:25'),
(132, 20, NULL, NULL, 2, NULL, 'sss', 5, NULL, NULL, NULL, NULL, 1, '2024-02-18 11:48:36', '2024-02-18 11:48:36'),
(133, 20, 15, NULL, NULL, NULL, 'ddddd', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-18 11:49:01', '2024-02-18 11:49:01'),
(134, 20, NULL, NULL, NULL, NULL, 'hello', 24, NULL, NULL, NULL, NULL, 35, '2024-02-18 11:49:57', '2024-02-18 11:49:57'),
(135, 9, 15, NULL, NULL, NULL, 'jhhh', 7, '23.7985396', '90.3654296', NULL, NULL, 1, '2024-02-18 11:50:46', '2024-02-18 11:50:46'),
(136, 9, NULL, NULL, NULL, NULL, 'hello', 32, NULL, NULL, NULL, NULL, 35, '2024-02-18 11:51:22', '2024-02-18 11:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_logs`
--

CREATE TABLE `parcel_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parcel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pickup_address` longtext DEFAULT NULL,
  `pickup_phone` varchar(191) DEFAULT NULL,
  `customer_name` varchar(191) DEFAULT NULL,
  `customer_phone` varchar(191) DEFAULT NULL,
  `customer_address` longtext DEFAULT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `cash_collection` decimal(13,2) DEFAULT NULL,
  `selling_price` decimal(13,2) DEFAULT NULL,
  `total_delivery_amount` decimal(13,2) DEFAULT NULL,
  `current_payable` decimal(13,2) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parcel_logs`
--

INSERT INTO `parcel_logs` (`id`, `merchant_id`, `hub_id`, `delivery_man_id`, `parcel_id`, `pickup_address`, `pickup_phone`, `customer_name`, `customer_phone`, `customer_address`, `invoice_no`, `cash_collection`, `selling_price`, `total_delivery_amount`, `current_payable`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 8, NULL, 8, 'Weligama, Sri Lanka.', '0094762909095', 'Sajib', '01254784578', 'Mirpur -10', '0', 0.00, 100.00, 60.00, -60.00, 'hello', '2024-02-01 15:10:26', '2024-02-01 15:10:26'),
(2, 1, 8, NULL, 9, 'Wemaxdevs,Dhaka', '+88013000000', 'Islam', '0156465156', 'adf', '', 1000.00, NULL, 70.00, 930.00, '', '2024-02-10 04:52:27', '2024-02-10 04:52:27'),
(3, 1, 8, NULL, 10, 'Bambalapitiya, Colombo - 05', '0094762909090', 'Dhanapaal Govindan', '0094780454545', 'adf', 'DP342107', 8400.00, 7300.00, 378.00, 8022.00, '', '2024-02-10 05:33:59', '2024-02-10 05:33:59'),
(4, 1, 8, NULL, 11, 'Bambalapitiya, Colombo - 05', '0094762909090', 'Dhanapaal Govindan', '0094780454545', 'asdf', 'DP342107', 8400.00, 7300.00, 378.00, 8022.00, '', '2024-02-10 05:40:55', '2024-02-10 05:40:55'),
(7, 8, 2, NULL, 15, 'Mirpur-2', '01820064106', 'Sajib', '01685487457', '435 South Monipur Rd, Dhaka, Bangladesh', '1212', 0.00, 100.00, 220.00, -220.00, 'hello', '2024-02-17 14:14:02', '2024-02-17 14:14:02'),
(8, 4, 2, NULL, 16, 'Main Street, Pettah.', '0094777123459', 'ABC', '215641654654', '435 South Monipur Rd, Dhaka, Bangladesh', '211', 0.00, 100.00, 210.00, -247.80, 'hello', '2024-02-17 15:28:59', '2024-02-17 15:28:59'),
(9, 8, 2, NULL, 17, 'Barmis Market Area/Cox,s Bazar', '01627413327', 'Sajib', '01627413327', '252 W Monipur, Dhaka 1216, Bangladesh', '1234', 0.00, 100.00, 220.00, -220.00, 'hello', '2024-02-17 16:57:24', '2024-02-17 16:57:24'),
(10, 8, 2, NULL, 18, 'Mirpur-2', '01820064106', 'Sajib', '01254874747', '435 South Monipur Rd, Dhaka, Bangladesh', '2121', 0.00, 100.00, 220.00, -220.00, 'hello', '2024-02-17 17:03:25', '2024-02-17 17:03:25'),
(11, 8, 2, NULL, 19, 'Mirpur-2', '01820064106', 'Sajib Raj', '017454154747', '435 South Monipur Rd, Dhaka, Bangladesh', '12345', 0.00, NULL, 220.00, -220.00, 'he', '2024-02-17 17:38:09', '2024-02-17 17:38:09'),
(12, 8, 2, NULL, 20, 'Mirpur-2', '01820064106', 'Sajib', '01745214547', 'Mirpur-1, Dhaka, Bangladesh', '1234', 0.00, NULL, 220.00, -220.00, 'hello', '2024-02-18 11:48:09', '2024-02-18 11:48:09'),
(13, 4, 2, NULL, 21, 'Main Street, Pettah.', '0094777123459', 'Danapal Ramu', '+94777987654', '127 Veluwanarama Rd, Colombo, Sri Lanka', '#4585265', 6500.00, 4800.00, 275.00, 6175.50, '', '2024-02-19 20:04:50', '2024-02-19 20:04:50'),
(14, 4, 2, NULL, 22, 'Main Street, Pettah.', '0094777123459', 'Danapal Ramu', '+94777987654', '41 Sri Saranankara Rd, Dehiwala-Mount Lavinia, Sri Lanka', '#DF985452', 6500.00, 4800.00, 125.00, 6352.50, '', '2024-02-19 20:06:03', '2024-02-19 20:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `image_id`, `link`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Trantow-Ebert', 20, '#', '1', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(2, 'Lang Ltd', 21, '#', '2', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(3, 'Daniel, Hettinger and Daniel', 22, '#', '3', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(4, 'Kovacek, Conn and Mayer', 23, '#', '4', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(5, 'Altenwerth-Larkin', 24, '#', '5', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(6, 'Renner-Pouros', 25, '#', '6', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(7, 'Lesch-Ward', 26, '#', '7', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(8, 'Rohan Ltd', 27, '#', '8', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(9, 'Erdman, Windler and Pfannerstill', 28, '#', '9', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(10, 'Harvey PLC', 29, '#', '10', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(11, 'Ondricka-Waters', 30, '#', '11', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(12, 'Shields LLC', 31, '#', '12', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `merchant_account` tinyint(4) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `from_account` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_file` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT '1=admin,2=merchant',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 3 COMMENT '1= Reject,2=Approved , 3= Pending,4=Process, ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_accounts`
--

CREATE TABLE `payment_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `branch_name` varchar(191) DEFAULT NULL,
  `routing_no` varchar(191) DEFAULT NULL,
  `mobile_company` varchar(191) DEFAULT NULL,
  `mobile_no` varchar(191) DEFAULT NULL,
  `account_type` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute` varchar(191) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `attribute`, `keywords`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', '{\"read\":\"dashboard_read\",\"calendar\":\"calendar_read\",\"total_Parcel\":\"total_parcel\",\"total_user\":\"total_user\",\"total_merchant\":\"total_merchant\",\"total_delivery_man\":\"total_delivery_man\",\"total_hubs\":\"total_hubs\",\"total_accounts\":\"total_accounts\",\"total_parcels_pending\":\"total_parcels_pending\",\"total_pickup_assigned\":\"total_pickup_assigned\",\"total_received_warehouse\":\"total_received_warehouse\",\"total_deliveryman_assigned\":\"total_deliveryman_assigned\",\"total_partial_deliverd\":\"total_partial_deliverd\",\"total_parcels_deliverd\":\"total_parcels_deliverd\",\"recent_accounts\":\"recent_accounts\",\"recent_salary\":\"recent_salary\",\"recent_hub\":\"recent_hub\",\"all_statements\":\"all_statements\",\"income_expense_charts\":\"income_expense_charts\",\"merchant_revenue_charts\":\"merchant_revenue_charts\",\"deliveryman_revenue_charts\":\"deliveryman_revenue_charts\",\"courier_revenue_charts\":\"courier_revenue_charts\",\"recent_parcels\":\"recent_parcels\",\"bank_transaction\":\"bank_transaction\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 'logs', '{\"read\":\"log_read\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 'hubs', '{\"read\":\"hub_read\",\"create\":\"hub_create\",\"update\":\"hub_update\",\"delete\":\"hub_delete\",\"incharge_read\":\"hub_incharge_read\",\"incharge_create\":\"hub_incharge_create\",\"incharge_update\":\"hub_incharge_update\",\"incharge_delete\":\"hub_incharge_delete\",\"incharge_assigned\":\"hub_incharge_assigned\",\"view\":\"hub_view\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 'accounts', '{\"read\":\"account_read\",\"create\":\"account_create\",\"update\":\"account_update\",\"delete\":\"account_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 'income', '{\"read\":\"income_read\",\"create\":\"income_create\",\"update\":\"income_update\",\"delete\":\"income_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 'expense', '{\"read\":\"expense_read\",\"create\":\"expense_create\",\"update\":\"expense_update\",\"delete\":\"expense_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(7, 'todo', '{\"read\":\"todo_read\",\"create\":\"todo_create\",\"update\":\"todo_update\",\"delete\":\"todo_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(8, 'fund_transfer', '{\"read\":\"fund_transfer_read\",\"create\":\"fund_transfer_create\",\"update\":\"fund_transfer_update\",\"delete\":\"fund_transfer_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(9, 'roles', '{\"read\":\"role_read\",\"create\":\"role_create\",\"update\":\"role_update\",\"delete\":\"role_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(10, 'designations', '{\"read\":\"designation_read\",\"create\":\"designation_create\",\"update\":\"designation_update\",\"delete\":\"designation_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(11, 'departments', '{\"read\":\"department_read\",\"create\":\"department_create\",\"update\":\"department_update\",\"delete\":\"department_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(12, 'users', '{\"read\":\"user_read\",\"create\":\"user_create\",\"update\":\"user_update\",\"delete\":\"user_delete\",\"permission_update\":\"permission_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(13, 'merchant', '{\"read\":\"merchant_read\",\"create\":\"merchant_create\",\"update\":\"merchant_update\",\"delete\":\"merchant_delete\",\"view\":\"merchant_view\",\"delivery_charge_read\":\"merchant_delivery_charge_read\",\"delivery_charge_create\":\"merchant_delivery_charge_create\",\"delivery_charge_update\":\"merchant_delivery_charge_update\",\"delivery_charge_delete\":\"merchant_delivery_charge_delete\",\"shop_read\":\"merchant_shop_read\",\"shop_create\":\"merchant_shop_create\",\"shop_update\":\"merchant_shop_update\",\"shop_delete\":\"merchant_shop_delete\",\"payment_read\":\"merchant_payment_read\",\"payment_create\":\"merchant_payment_create\",\"payment_update\":\"merchant_payment_update\",\"payment_delete\":\"merchant_payment_delete\",\"permissions\":\"merchant_permissions\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(14, 'payments', '{\"read\":\"payment_read\",\"create\":\"payment_create\",\"update\":\"payment_update\",\"delete\":\"payment_delete\",\"reject\":\"payment_reject\",\"process\":\"payment_process\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(15, 'hub_payments', '{\"read\":\"hub_payment_read\",\"create\":\"hub_payment_create\",\"update\":\"hub_payment_update\",\"delete\":\"hub_payment_delete\",\"reject\":\"hub_payment_reject\",\"process\":\"hub_payment_process\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(16, 'hub_payments_request', '{\"read\":\"hub_payment_request_read\",\"create\":\"hub_payment_request_create\",\"update\":\"hub_payment_request_update\",\"delete\":\"hub_payment_request_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(17, 'liquid_fragile', '{\"read\":\"liquid_fragile_read\",\"update\":\"liquid_fragile_update\",\"status_change\":\"liquid_status_change\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(18, 'database_backup', '{\"read\":\"database_backup_read\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(19, 'sms_settings', '{\"read\":\"sms_settings_read\",\"create\":\"sms_settings_create\",\"update\":\"sms_settings_update\",\"delete\":\"sms_settings_delete\",\"status_change\":\"sms_settings_status_change\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(20, 'sms_send_settings', '{\"read\":\"sms_send_settings_read\",\"create\":\"sms_send_settings_create\",\"update\":\"sms_send_settings_update\",\"delete\":\"sms_send_settings_delete\",\"status_change\":\"sms_send_settings_status_change\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(21, 'general_settings', '{\"read\":\"general_settings_read\",\"update\":\"general_settings_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(22, 'notification_settings', '{\"read\":\"notification_settings_read\",\"update\":\"notification_settings_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(23, 'push_notification', '{\"read\":\"push_notification_read\",\"create\":\"push_notification_create\",\"update\":\"push_notification_update\",\"delete\":\"push_notification_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(24, 'parcel', '{\"read\":\"parcel_read\",\"create\":\"parcel_create\",\"update\":\"parcel_update\",\"delete\":\"parcel_delete\",\"status_update\":\"parcel_status_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(25, 'delivery_man', '{\"read\":\"delivery_man_read\",\"create\":\"delivery_man_create\",\"update\":\"delivery_man_update\",\"delete\":\"delivery_man_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(26, 'delivery_category', '{\"read\":\"delivery_category_read\",\"create\":\"delivery_category_create\",\"update\":\"delivery_category_update\",\"delete\":\"delivery_category_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(27, 'delivery_charge', '{\"read\":\"delivery_charge_read\",\"create\":\"delivery_charge_create\",\"update\":\"delivery_charge_update\",\"delete\":\"delivery_charge_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(28, 'delivery_type', '{\"read\":\"delivery_type_read\",\"status_change\":\"delivery_type_status_change\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(29, 'packaging', '{\"read\":\"packaging_read\",\"create\":\"packaging_create\",\"update\":\"packaging_update\",\"delete\":\"packaging_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(30, 'category', '{\"read\":\"category_read\",\"create\":\"category_create\",\"update\":\"category_update\",\"delete\":\"category_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(31, 'account_heads', '{\"read\":\"account_heads_read\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(32, 'salary', '{\"read\":\"salary_read\",\"create\":\"salary_create\",\"update\":\"salary_update\",\"delete\":\"salary_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(33, 'support', '{\"read\":\"support_read\",\"create\":\"support_create\",\"update\":\"support_update\",\"delete\":\"support_delete\",\"reply\":\"support_reply\",\"status_update\":\"support_status_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(34, 'asset_category', '{\"read\":\"asset_category_read\",\"create\":\"asset_category_create\",\"update\":\"asset_category_update\",\"delete\":\"asset_category_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(35, 'assets', '{\"read\":\"assets_read\",\"create\":\"assets_create\",\"update\":\"assets_update\",\"delete\":\"assets_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(36, 'news_offer', '{\"read\":\"news_offer_read\",\"create\":\"news_offer_create\",\"update\":\"news_offer_update\",\"delete\":\"news_offer_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(37, 'bank_transaction', '{\"read\":\"bank_transaction_read\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(38, 'cash_received_from_delivery_man', '{\"read\":\"cash_received_from_delivery_man_read\",\"create\":\"cash_received_from_delivery_man_create\",\"update\":\"cash_received_from_delivery_man_update\",\"delete\":\"cash_received_from_delivery_man_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(39, 'reports', '{\"parcel_status_reports\":\"parcel_status_reports\",\"parcel_wise_profit\":\"parcel_wise_profit\",\"parcel_total_summery\":\"parcel_total_summery\",\"salary_reports\":\"salary_reports\",\"merchant_hub_deliveryman\":\"merchant_hub_deliveryman\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(40, 'salary_generate', '{\"read\":\"salary_generate_read\",\"create\":\"salary_generate_create\",\"update\":\"salary_generate_update\",\"delete\":\"salary_generate_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(41, 'fraud', '{\"read\":\"fraud_read\",\"create\":\"fraud_create\",\"update\":\"fraud_update\",\"delete\":\"fraud_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(42, 'subscribe', '{\"read\":\"subscribe_read\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(43, 'pickup_request', '{\"regular\":\"pickup_request_regular\",\"express\":\"pickup_request_express\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(44, 'invoice', '{\"read\":\"invoice_read\",\"status_update\":\"invoice_status_update\",\"paid_invoice_read\":\"paid_invoice_read\",\"invoice_generate\":\"invoice_generate_menually\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(45, 'social_login_settings', '{\"read\":\"social_login_settings_read\",\"update\":\"social_login_settings_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(46, 'payout_setup_settings', '{\"read\":\"payout_setup_settings_read\",\"update\":\"payout_setup_settings_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(47, 'online_payment', '{\"read\":\"online_payment_read\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(48, 'payout', '{\"read\":\"payout_read\",\"create\":\"payout_create\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(49, 'currency', '{\"read\":\"currency_read\",\"create\":\"currency_create\",\"update\":\"currency_update\",\"delete\":\"currency_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(50, 'social_link', '{\"read\":\"social_link_read\",\"create\":\"social_link_create\",\"update\":\"social_link_update\",\"delete\":\"social_link_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(51, 'services', '{\"read\":\"service_read\",\"create\":\"service_create\",\"update\":\"service_update\",\"delete\":\"service_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(52, 'why_courier', '{\"read\":\"why_courier_read\",\"create\":\"why_courier_create\",\"update\":\"why_courier_update\",\"delete\":\"why_courier_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(53, 'faq', '{\"read\":\"faq_read\",\"create\":\"faq_create\",\"update\":\"faq_update\",\"delete\":\"faq_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(54, 'partner', '{\"read\":\"partner_read\",\"create\":\"partner_create\",\"update\":\"partner_update\",\"delete\":\"partner_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(55, 'blogs', '{\"read\":\"blogs_read\",\"create\":\"blogs_create\",\"update\":\"blogs_update\",\"delete\":\"blogs_delete\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(56, 'pages', '{\"read\":\"pages_read\",\"update\":\"pages_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(57, 'sections', '{\"read\":\"section_read\",\"update\":\"section_update\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(58, 'wallet_request', '{\"read\":\"wallet_request_read\",\"create\":\"wallet_request_create\",\"delete\":\"wallet_request_delete\",\"approve\":\"wallet_request_approve\",\"reject\":\"wallet_request_reject\"}', '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `expires_at` varchar(191) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `expires_at`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(11, 'App\\Models\\User', 15, '01875011412', NULL, '013accb1ea258658a86e5176021351c7fda2d348ba42b898e52f7dda72800b5c', '[\"*\"]', '2023-12-26 14:30:26', '2023-12-26 14:30:22', '2023-12-26 14:30:26'),
(15, 'App\\Models\\User', 4, '0094777889388', NULL, '1eb8692f7f7be79dacb131605b051b48139ee47202412c99bbdf9100a97f5e39', '[\"*\"]', '2023-12-27 22:28:36', '2023-12-27 21:42:22', '2023-12-27 22:28:36'),
(16, 'App\\Models\\User', 12, '0094756898989', NULL, 'd052d035cbd0d6d6d127246c3020f9cce2e11154100f722ba8bf9e457ee2558b', '[\"*\"]', '2023-12-27 22:06:09', '2023-12-27 22:05:58', '2023-12-27 22:06:09'),
(25, 'App\\Models\\User', 3, '0094777590976', NULL, '1148dd855152fd561832b88eb15b1be4559bc967dd90afc4b262cc64e20b1d0a', '[\"*\"]', '2024-02-01 17:05:12', '2024-02-01 16:33:09', '2024-02-01 17:05:12'),
(27, 'App\\Models\\User', 13, '0099777112233', NULL, '77e3ef7e749ad63f1140728147537c7ad45007566f53e02354909243b2c61d6c', '[\"*\"]', '2024-02-07 17:16:01', '2024-02-07 17:16:00', '2024-02-07 17:16:01'),
(79, 'App\\Models\\User', 35, '777889388', NULL, '0df35239ea9b7319d32462ef22acd5b98250e1d4d84de1f36c6f44e7bea41c39', '[\"*\"]', '2024-02-19 20:10:40', '2024-02-19 19:55:39', '2024-02-19 20:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_requests`
--

CREATE TABLE `pickup_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_type` varchar(191) DEFAULT NULL COMMENT 'regular = 1,',
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `address` text DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `parcel_quantity` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `cod_amount` decimal(16,2) DEFAULT 0.00,
  `invoice` varchar(191) DEFAULT NULL,
  `weight` bigint(20) DEFAULT 0,
  `exchange` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'yes = 1, no = 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_notifications`
--

INSERT INTO `push_notifications` (`id`, `title`, `description`, `user_id`, `merchant_id`, `type`, `image_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'fffffffff', 1, NULL, '1', NULL, '2024-02-15 16:59:19', '2024-02-15 16:59:19'),
(2, 'tello', 'ssssssssss', 1, NULL, '1', NULL, '2024-02-15 17:02:19', '2024-02-15 17:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `permissions`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super-admin', '[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_read\",\"user_create\",\"user_update\",\"user_delete\",\"permission_update\",\"merchant_read\",\"merchant_create\",\"merchant_update\",\"merchant_delete\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_delete\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"hub_payment_request_delete\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"database_backup_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_delete\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"payout_setup_settings_update\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"hub_view\",\"paid_invoice_read\",\"invoice_generate_menually\",\"currency_read\",\"currency_create\",\"currency_update\",\"currency_delete\",\"social_link_read\",\"social_link_create\",\"social_link_update\",\"social_link_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"why_courier_read\",\"why_courier_create\",\"why_courier_update\",\"why_courier_delete\",\"faq_read\",\"faq_create\",\"faq_update\",\"faq_delete\",\"partner_read\",\"partner_create\",\"partner_update\",\"partner_delete\",\"blogs_read\",\"blogs_create\",\"blogs_update\",\"blogs_delete\",\"pages_read\",\"pages_update\",\"section_read\",\"section_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]', 1, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(2, 'DeliPart (Head)', 'delipart-(head)', '[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"hub_view\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"user_read\",\"user_create\",\"user_update\",\"user_delete\",\"merchant_read\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"hub_payment_request_delete\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"cash_received_from_delivery_man_delete\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]', 1, '2023-12-08 18:13:20', '2024-02-19 18:42:09'),
(3, 'Hub -in charge', 'hub--in-charge', '[\"dashboard_read\",\"calendar_read\",\"hub_read\",\"hub_create\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_assigned\",\"hub_view\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"user_read\",\"user_create\",\"merchant_read\",\"merchant_create\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_payment_read\",\"merchant_payment_create\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"general_settings_read\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_charge_read\",\"delivery_charge_create\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_approve\",\"wallet_request_reject\"]', 1, '2024-02-08 11:33:28', '2024-02-08 11:33:28');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `month` varchar(191) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_generates`
--

CREATE TABLE `salary_generates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `month` varchar(191) DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `status` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Unpaid=0,Paid=1,Partial Paid=2',
  `due` decimal(16,2) NOT NULL DEFAULT 0.00,
  `advance` decimal(16,2) NOT NULL DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_generates`
--

INSERT INTO `salary_generates` (`id`, `user_id`, `month`, `amount`, `status`, `due`, `advance`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12', 7000.00, 0, 0.00, 0.00, 'Auto Generated', '2023-12-11 23:02:09', '2023-12-11 23:02:09'),
(2, 2, '2023-12', 9000.00, 0, 0.00, 0.00, 'Auto Generated', '2023-12-11 23:02:09', '2023-12-11 23:02:09'),
(3, 3, '2023-12', 7000.00, 0, 0.00, 0.00, 'Auto Generated', '2023-12-11 23:02:09', '2023-12-11 23:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `type`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'title_1', 'WE PROVIDE', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(2, 1, 'title_2', 'HASSLE FREE', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(3, 1, 'title_3', 'FASTEST DELIVERY', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(4, 1, 'sub_title', 'We Committed to delivery - Make easy Efficient and quality delivery.', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(5, 1, 'banner', NULL, '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(6, 2, 'branch_icon', 'fa fa-warehouse', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(7, 2, 'branch_count', '7520', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(8, 2, 'branch_title', 'Branches', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(9, 2, 'parcel_icon', 'fa fa-gifts', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(10, 2, 'parcel_count', '50000000', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(11, 2, 'parcel_title', 'Parcel Delivered', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(12, 2, 'merchant_icon', 'fa fa-users', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(13, 2, 'merchant_count', '400000', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(14, 2, 'merchant_title', 'Happy Merchant', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(15, 2, 'reviews_icon', 'fa fa-thumbs-up', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(16, 2, 'reviews_count', '700', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(17, 2, 'reviews_title', 'Positive Reviews', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(18, 3, 'about_us', 'Fastest platform with all courier service features. Help you start, run and grow your courier service.', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(19, 4, 'subscribe_title', 'Subscribe Us', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(20, 4, 'subscribe_description', 'Get business news , tip and solutions to your problems our experts.', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(21, 5, 'playstore_icon', 'fa-brands fa-google-play', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(22, 5, 'playstore_link', 'https://drive.google.com/drive/folders/1jLe_s4F-HDSjI7dHPsen7vRUw2wv9SMi', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(23, 5, 'ios_icon', 'fa-brands fa-app-store-ios', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(24, 5, 'ios_link', 'https://drive.google.com/drive/folders/1jLe_s4F-HDSjI7dHPsen7vRUw2wv9SMi', '2023-01-28 01:30:40', '2023-01-28 01:30:40'),
(25, 6, 'map_link', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d542.6581052086841!2d90.3516149889463!3d23.798889773393963!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c0e8a725cb8b%3A0x5a69b65edf9c7cf4!2sWemax%20IT!5e0!3m2!1sen!2sbd!4v1687082326781!5m2!1sen!2sbd', '2023-01-28 01:30:40', '2023-01-28 01:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `image_id`, `description`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'E-Commerce delivery', 10, 'Ea veritatis provident sed optio consectetur aliquam consectetur rerum voluptas inventore dignissimos aliquam officiis dicta voluptatem qui sit nobis omnis non nam quas qui sit qui reiciendis ex ut facilis recusandae et quidem sit eos quaerat sit voluptatem harum ut odio aut fugiat ducimus nostrum autem quos.', '1', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(2, 'Pick & Drop', 11, 'Fugit repellendus quod in sunt architecto at hic iste nihil accusantium aut quia impedit totam in esse corporis consequuntur eos consequatur sed aut accusamus vel rem iure labore sint dolore est ratione delectus perspiciatis asperiores ut voluptas molestias nostrum qui quo et ab ex deleniti harum quae harum sed rerum enim suscipit molestiae eius dignissimos eligendi ut praesentium rem occaecati reiciendis est quia magni commodi sint ipsum exercitationem est est quaerat.', '2', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(3, 'Packageing', 12, 'Ut voluptatem atque qui placeat tempore sit vel vero facere rerum suscipit sit maxime optio at illum soluta laudantium et asperiores sapiente veniam labore sapiente voluptate delectus ratione et expedita reprehenderit optio soluta quis.', '3', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(4, 'Warehousing', 13, 'Quibusdam modi eius voluptas id voluptas delectus inventore distinctio dolores aut autem saepe sequi fugit culpa quos illum non rerum iusto voluptatem fuga aut qui et aliquid id error sunt quae est aspernatur impedit suscipit officiis consequuntur in dolores fugit nisi modi et et qui minima provident repellat vero omnis laborum sint perspiciatis sit dolorem est veritatis quis ad deleniti qui dignissimos nihil.', '4', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'facebook_client_id', '761215211788306', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 'facebook_client_secret', '7723532b0459756c86a8c0467ab27ae1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 'facebook_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 'google_client_id', '730724862191-cncotvoaiai5vd5hikltrah9df39uou5.apps.googleusercontent.com', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 'google_client_secret', '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', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 'google_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(7, 'stripe_publishable_key', 'pk_test_csMkzUcsbjbcEuuW6K0QImTT00M403UGkp', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(8, 'stripe_secret_key', 'sk_test_aqfYWud5ZhFx0EGIvY6Scdxh00dlfZKnFT', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(9, 'stripe_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(10, 'razorpay_key', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(11, 'razorpay_secret', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(12, 'razorpay_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(13, 'sslcommerz_store_id', 'wemax635e0bd65804e', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(14, 'sslcommerz_store_password', 'wemax635e0bd65804e@ssl', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(15, 'sslcommerz_testmode', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(16, 'sslcommerz_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(17, 'paypal_client_id', 'ASNysE4ENGfyplv-cNRife5zi8137rEh21yoK4cBZvuy1JWEm-v_DdmfBKVedtmadG1VPgXxUjRg6Q_3', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(18, 'paypal_client_secret', 'EJwTIUMb8mjg0EH2gim8jpi8tQaVeomcVm0Rs-c3mjXxcvGR3y6imw1kohYuGs5NCPzJuXe-ggvyixaF', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(19, 'paypal_mode', 'sendbox', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(20, 'paypal_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(21, 'skrill_merchant_email', 'demoqco@sun-fish.com', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(22, 'skrill_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(23, 'bkash_app_id', 'application id', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(24, 'bkash_app_secret', 'application secret key', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(25, 'bkash_username', 'username', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(26, 'bkash_password', 'password', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(27, 'bkash_test_mode', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(28, 'bkash_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(29, 'aamarpay_store_id', 'aamarypay', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(30, 'aamarpay_signature_key', '28c78bb1f45112f5d40b956fe104645a', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(31, 'aamarpay_sendbox_mode', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(32, 'aamarpay_status', '1', '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `sms_send_settings`
--

CREATE TABLE `sms_send_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sms_send_status` tinyint(3) UNSIGNED NOT NULL COMMENT '1=Parcel Create, 2=Delivered Cancel Customer, 3=Delivered Cancel Merchant',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_send_settings`
--

INSERT INTO `sms_send_settings` (`id`, `sms_send_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 2, 0, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 3, 0, '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'reve_api_key', 'a7e4166cc9967d80', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(2, 'reve_secret_key', 'e863dd2f', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(3, 'reve_api_url', 'http://smpp.ajuratech.com:7788/sendtext', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(4, 'reve_username', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(5, 'reve_user_password', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(6, 'reve_status', '1', '2023-12-08 18:13:21', '2024-02-10 07:22:18'),
(7, 'twilio_sid', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(8, 'twilio_token', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(9, 'twilio_from', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(10, 'twilio_status', '0', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(11, 'nexmo_key', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(12, 'nexmo_secret_key', '', '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(13, 'nexmo_status', '0', '2023-12-08 18:13:21', '2023-12-08 18:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `name`, `icon`, `link`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'fab fa-facebook-square', 'https://www.facebook.com', '1', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(2, 'Instagram', 'fab fa-instagram', 'https://www.instagram.com', '2', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(3, 'Twitter', 'fab fa-twitter', 'https://www.twitter.com', '3', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(4, 'Youtube', 'fab fa-youtube', 'https://www.youtube.com', '4', 0, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(5, 'Whatsapp', 'fab fa-whatsapp', 'https://www.whatsapp.com', '5', 0, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(6, 'Skype', 'fab fa-skype', 'https://www.skype.com', '6', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service` varchar(191) DEFAULT NULL,
  `priority` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `date` date DEFAULT NULL,
  `attached_file` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Pending,2= Processing,3= Resolved,4= Closed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supports`
--

INSERT INTO `supports` (`id`, `user_id`, `department_id`, `service`, `priority`, `subject`, `description`, `date`, `attached_file`, `status`, `created_at`, `updated_at`) VALUES
(1, 14, 6, 'pickup', 'medium', 'System is working fine', '<p>Hello Team</p>', '2023-12-18', NULL, 2, '2023-12-18 23:22:21', '2023-12-18 23:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `support_chats`
--

CREATE TABLE `support_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attached_file` bigint(20) UNSIGNED DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_chats`
--

INSERT INTO `support_chats` (`id`, `support_id`, `user_id`, `attached_file`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, 'Yeah, We\'re upgrading system.', '2023-12-18 23:27:13', '2023-12-18 23:27:13');

-- --------------------------------------------------------

--
-- Table structure for table `to_dos`
--

CREATE TABLE `to_dos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'pending= 1, procesing= 2,complete= 3',
  `note` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `to_dos`
--

INSERT INTO `to_dos` (`id`, `title`, `description`, `user_id`, `date`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, '', 'Hello Testing!', 2, '2023-12-11', 3, 'Done', '2023-12-11 23:17:45', '2023-12-21 23:28:24'),
(2, 'Send PARCEL of The Code for XLT4532946', 'Kindly visit the hub and get the parcel ASAP.', 3, '2023-12-21', 1, NULL, '2023-12-21 23:32:56', '2023-12-21 23:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `original` varchar(191) DEFAULT NULL,
  `one` varchar(191) DEFAULT NULL,
  `two` varchar(191) DEFAULT NULL,
  `three` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `original`, `one`, `two`, `three`, `created_at`, `updated_at`) VALUES
(1, 'uploads/users/user.png', NULL, NULL, NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(2, 'uploads/users/user2.png', NULL, NULL, NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(3, 'uploads/users/user3.png', NULL, NULL, NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(4, 'uploads/users/user4.png', NULL, NULL, NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(5, 'uploads/users/user5.png', NULL, NULL, NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(6, 'uploads/users/user6.png', NULL, NULL, NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(7, 'uploads/users/user7.png', NULL, NULL, NULL, '2023-12-08 18:13:20', '2023-12-08 18:13:20'),
(8, 'uploads/settings/202312171634537917.png', NULL, NULL, NULL, '2023-12-08 18:13:21', '2023-12-18 00:34:53'),
(9, 'uploads/users/user9.png', NULL, NULL, NULL, '2023-12-08 18:13:21', '2023-12-08 18:13:21'),
(10, 'frontend/images/services/truck.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(11, 'frontend/images/services/pick-drop.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(12, 'frontend/images/services/packageing.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(13, 'frontend/images/services/warehouse.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(14, 'frontend/images/whycourier/timly-delivery.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(15, 'frontend/images/whycourier/limitless-pickup.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(16, 'frontend/images/whycourier/cash-on-delivery.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(17, 'frontend/images/whycourier/payment.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(18, 'frontend/images/whycourier/handling.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(19, 'frontend/images/whycourier/live-tracking.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(20, 'frontend/images/partner/1.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(21, 'frontend/images/partner/atom.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(22, 'frontend/images/partner/digg.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(23, 'frontend/images/partner/2.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(24, 'frontend/images/partner/huawei.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(25, 'frontend/images/partner/ups.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(26, 'frontend/images/partner/1.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(27, 'frontend/images/partner/atom.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(28, 'frontend/images/partner/digg.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(29, 'frontend/images/partner/2.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(30, 'frontend/images/partner/huawei.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(31, 'frontend/images/partner/ups.png', NULL, NULL, NULL, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(32, '', NULL, NULL, NULL, '2023-12-10 01:48:37', '2023-12-10 01:48:37'),
(33, '', NULL, NULL, NULL, '2023-12-17 19:03:27', '2023-12-17 19:03:27'),
(34, '', NULL, NULL, NULL, '2023-12-26 21:47:26', '2023-12-26 21:47:26'),
(35, 'uploads/settings/202312271236251704.png', NULL, NULL, NULL, '2023-12-27 20:36:25', '2023-12-27 20:36:25'),
(36, '', NULL, NULL, NULL, '2024-02-08 11:34:39', '2024-02-08 11:34:39'),
(37, '', NULL, NULL, NULL, '2024-02-12 03:44:55', '2024-02-12 03:44:55'),
(40, 'uploads/merchant/nid/2024021212032463089.pdf', NULL, NULL, NULL, '2024-02-12 05:56:16', '2024-02-12 06:03:24'),
(41, 'uploads/deliveryMan/image/2024021305512992834.png', NULL, NULL, NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(42, 'uploads/deliveryMan/image/2024021305512978772.png', NULL, NULL, NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(43, 'uploads/deliveryMan/image/2024021305512989200.png', NULL, NULL, NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(44, 'uploads/deliveryMan/image/2024021305512932596.png', NULL, NULL, NULL, '2024-02-12 23:51:29', '2024-02-12 23:51:29'),
(45, 'uploads/deliveryMan/image/2024021305534839987.png', NULL, NULL, NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(46, 'uploads/deliveryMan/image/2024021305534833235.png', NULL, NULL, NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(47, 'uploads/deliveryMan/image/2024021305534846650.png', NULL, NULL, NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(48, 'uploads/deliveryMan/image/2024021305534869261.png', NULL, NULL, NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(65, 'uploads/deliveryMan/image/2024021306430771816.apk', NULL, NULL, NULL, '2024-02-13 00:43:07', '2024-02-13 00:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `nid_number` varchar(191) DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hub_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_type` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Admin, 2=Merchant, 3=DeliveryMan, 4=In-Charge',
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `joining_date` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `salary` decimal(16,2) NOT NULL DEFAULT 0.00,
  `device_token` varchar(191) DEFAULT NULL,
  `web_token` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `verification_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `google_id` varchar(191) DEFAULT NULL,
  `facebook_id` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `mobile`, `nid_number`, `designation_id`, `department_id`, `hub_id`, `user_type`, `image_id`, `joining_date`, `address`, `role_id`, `permissions`, `otp`, `salary`, `device_token`, `web_token`, `status`, `verification_status`, `google_id`, `facebook_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Delivery Partner', 'admin@ezycloud.xyz', NULL, '$2y$10$U7X./k5iixwNuJpqISNKReRLdj4p3N0eU0xQXOWXWBdQPaINdfXK2', '19785938004', NULL, NULL, NULL, NULL, 1, 1, NULL, '30, Vijitha Road, Pamankada', NULL, '[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"hub_view\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_read\",\"user_create\",\"user_update\",\"user_delete\",\"permission_update\",\"merchant_read\",\"merchant_create\",\"merchant_update\",\"merchant_delete\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"merchant_permissions\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_delete\",\"hub_payment_reject\",\"hub_payment_process\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_delete\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"payout_setup_settings_update\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"currency_read\",\"currency_create\",\"currency_update\",\"currency_delete\",\"social_link_read\",\"social_link_create\",\"social_link_update\",\"social_link_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"why_courier_read\",\"why_courier_create\",\"why_courier_update\",\"why_courier_delete\",\"faq_read\",\"faq_create\",\"faq_update\",\"faq_delete\",\"partner_read\",\"partner_create\",\"partner_update\",\"partner_delete\",\"blogs_read\",\"blogs_create\",\"blogs_update\",\"blogs_delete\",\"pages_read\",\"pages_update\",\"section_read\",\"section_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]', NULL, 7000.00, NULL, 'erk6_Yn-gOOvTWieqsjfOu:APA91bEJY_XXO12myjJlZRIUkHzSPbooROrLyfF4ZJ075WAwuZsIT6S7a6k82hcADClpeMtpl7rOEayOKPfaftEa73ul2NMgrYvSfJWC-tHxMA4bB03_1AVPmcOm-W1KF5WEMv0dbkZ7', 1, 1, NULL, NULL, NULL, '2023-12-08 18:13:20', '2024-02-19 18:24:54'),
(2, 'DeliPartner', 'admin@deliverypartners.com', NULL, '$2y$10$.ZPhScRAS57HLSIgi14NMO2VOCpJ758.zZtUEsUKa1zqqYzF.oEXG', '0094777678678', '12345678910', 2, 2, 8, 1, 6, '2022-04-20', 'Malma Road, Mattale', 2, '[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"hub_view\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"merchant_read\",\"merchant_create\",\"merchant_update\",\"merchant_delete\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"merchant_permissions\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_delete\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"hub_payment_request_delete\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_delete\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"cash_received_from_delivery_man_delete\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"payout_setup_settings_update\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"currency_read\",\"currency_create\",\"currency_update\",\"currency_delete\",\"social_link_read\",\"social_link_create\",\"social_link_update\",\"social_link_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"why_courier_read\",\"why_courier_create\",\"why_courier_update\",\"why_courier_delete\",\"faq_read\",\"faq_create\",\"faq_update\",\"faq_delete\",\"partner_read\",\"partner_create\",\"partner_update\",\"partner_delete\",\"blogs_read\",\"blogs_create\",\"blogs_update\",\"blogs_delete\",\"pages_read\",\"pages_update\",\"section_read\",\"section_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]', NULL, 9000.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-08 18:13:21', '2024-02-19 20:40:31'),
(3, 'Angelo Mathews', 'angelo@ezycode.lk', NULL, '$2y$10$v5.MYXd00ebCJguTHiU5..o3NImLx3SiIdnb1Fg4q5RN80IW80jtu', '0094777590976', NULL, NULL, NULL, 8, 3, 3, NULL, '72, Gajaba Place, Kotahena, Col - 13', NULL, NULL, NULL, 7000.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-08 18:13:21', '2024-02-01 14:40:58'),
(4, 'John Keels', 'keels@gmail.com', NULL, '$2y$10$pWD7ezGUO/PlcD4SI8BMcOr1Rr9JUQTROMUUeCjifmPEkILnQy6t.', '0094777889388', NULL, NULL, NULL, 8, 2, 2, NULL, 'A04 Road, Nugegoda.', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-08 18:13:21', '2023-12-26 22:04:39'),
(5, 'Alphonso Silo', 'alphonso@gmail.com', NULL, '$2y$10$vXa7BLHZQsxvqbFW.OUI4.GH5lw.h5SPCz6k4x.njtEC.vE2vweBG', '0094777123456', NULL, NULL, NULL, 4, 2, NULL, NULL, 'Jaffna Road, Jaffna.', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-10 01:29:18', '2023-12-17 23:58:35'),
(7, 'Chindimal Perera', 'cargills@gmail.com', NULL, '$2y$10$ywnIPl8Kx09GutSCCIJYZONpxNpeXoUWJjg95jwTxG/XgqhuKfQL2', '0094777123458', NULL, NULL, NULL, 2, 2, NULL, NULL, 'Colombo - 13, Kotahena.', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-17 20:57:49', '2024-02-08 11:40:17'),
(8, 'Rupasinghe Ruwan', 'cargills.pettah@gmail.com', NULL, '$2y$10$saBBRV1OuDpPixTLh7i9FuxevaDZiuLZVDs8hp64rg1GIscnEEr.O', '0094777123459', NULL, NULL, NULL, 2, 2, NULL, NULL, 'Main Street, Pettah.', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-17 21:00:14', '2024-02-08 11:40:00'),
(9, 'Sanath Jayasooriya', 'sanath@ezycode.lk', NULL, '$2y$10$9GW1xrDylaUEsffCwiMzYOYyMz4UMo8FLtWHuiBymgd.ZNB2WPay6', '0094777898989', NULL, NULL, NULL, 8, 3, NULL, NULL, 'Hubstation Street, Bandaragama', NULL, NULL, NULL, 8000.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-17 21:15:51', '2023-12-17 21:18:33'),
(10, 'Arjuna Ranatunga', 'arjuna@ezycode.lk', NULL, '$2y$10$Z.zmYP1HWSR2rhqMT/pwnef75HaywRvWSIaUcQl4ux4oQ1x8E.7Ge', '0094777222233', NULL, NULL, NULL, 8, 3, NULL, NULL, 'A. V. R. Street, Kolonnawa', NULL, NULL, NULL, 7998.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-17 21:20:29', '2023-12-17 21:20:29'),
(11, 'Muttaiah Murali', 'muralee@ezycode.lk', NULL, '$2y$10$SPFNYC3bKNmWcYqli2BNDOLQzAZpESFLrPA2Qi5fxoRZwz94upaga', '0094777444444', NULL, NULL, NULL, 1, 3, NULL, NULL, 'Silver Road, Katharagama', NULL, NULL, NULL, 8000.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-17 21:21:44', '2023-12-17 21:21:44'),
(12, 'Senthooran', 'senthooran@gmail.com', NULL, '$2y$10$fPT9m3xdEKbS.RGue0rCh.QteKPcr2jj8XgFo4IkY2PvKfyt5RdRS', '0094756898989', NULL, NULL, NULL, 4, 3, NULL, NULL, 'K. K. S. Road, Jaffna', NULL, NULL, NULL, 8000.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-17 21:27:01', '2023-12-25 16:42:10'),
(13, 'Thileepan', 'thileepan@deliverypartners.com', NULL, '$2y$10$K26i1j9E8TwpNYd9GuaGEuCDs48muZW40Ko8Vp2Y.lXs/h09qJwn6', '0099777112233', NULL, NULL, NULL, 9, 3, NULL, NULL, '54, Anderson Flats, Narahenpita', NULL, NULL, NULL, 12000.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-18 23:06:53', '2024-02-19 20:00:57'),
(14, 'Weerasinge Bandara', 'wh@gmail.com', NULL, '$2y$10$Aa3ngUZN3s/fCBlwCzMIpu31WEEfa0FQjfW01e3biQTjbbOxsJLKO', '0094776345465', NULL, NULL, NULL, 2, 2, NULL, NULL, 'Pamunugama Road, Gampaha', NULL, '[]', NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-18 23:17:06', '2024-02-10 04:03:01'),
(16, 'Pranavan', 'pranavan@ezycode.lk', NULL, '$2y$10$gm/fdZBaq7Oq3mpvdHWRVesOlA8ny85kGmHAIjpvwhtY5UW7EfWbK', '0094775020200', '880463683', 4, 1, NULL, 1, 34, '2023-12-26', 'Vijitha Road, Pamankada', 1, '[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"hub_view\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_read\",\"user_create\",\"user_update\",\"user_delete\",\"permission_update\",\"merchant_read\",\"merchant_create\",\"merchant_update\",\"merchant_delete\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_delete\",\"hub_payment_reject\",\"hub_payment_process\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"database_backup_read\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_settings_status_change\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_delete\",\"sms_send_settings_status_change\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"bank_transaction_read\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"paid_invoice_read\",\"invoice_generate_menually\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"payout_setup_settings_update\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"currency_read\",\"currency_create\",\"currency_update\",\"currency_delete\",\"social_link_read\",\"social_link_create\",\"social_link_update\",\"social_link_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"why_courier_read\",\"why_courier_create\",\"why_courier_update\",\"why_courier_delete\",\"faq_read\",\"faq_create\",\"faq_update\",\"faq_delete\",\"partner_read\",\"partner_create\",\"partner_update\",\"partner_delete\",\"blogs_read\",\"blogs_create\",\"blogs_update\",\"blogs_delete\",\"pages_read\",\"pages_update\",\"section_read\",\"section_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]', NULL, 20000.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-12-26 21:47:26', '2023-12-26 21:55:38'),
(18, 'Islam', 'nurul_islam@gmail.com', NULL, '$2y$10$jAfWJ.VfGFRWJ/IzeuVgiu4fxUyQzz7p9PtrX4i3jnyyFd7TSKyPq', '05156415641', '', 1, 3, 2, 1, 36, '2024-02-08', 'Kottagala, Hatton', 3, '[\"dashboard_read\",\"hub_payment_read\",\"parcel_read\",\"cash_received_from_delivery_man_read\",\"cash_received_from_delivery_man_create\",\"cash_received_from_delivery_man_update\",\"cash_received_from_delivery_man_delete\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_delete\"]', NULL, 10000.00, NULL, 'fkwJR4Oayinj_No3bQBCvl:APA91bGIBiCBuiOvjRDwJwH842NQt3vsRxguKT2QRPB1gOGE5cze8WkL4eq_rMijBhnq7dD7qLbvo4CMTF7gdq-862JK5BCaro905CEN2XapEvZUfaurRVJFluXxzP0jIfLTBX-F0AZu', 1, 1, NULL, NULL, NULL, '2024-02-08 11:34:39', '2024-02-19 20:50:26'),
(19, 'M Riaz', 'mohammed@ezycloud.xyz', NULL, '$2y$10$9ZlrfpbrJ26rJeLrVaqime23rmU62gPL2xy0xjx4nRhxz8B4xeM1m', '018200641062', NULL, NULL, NULL, 2, 2, NULL, NULL, 'Mirpur-2', NULL, NULL, NULL, 0.00, NULL, '', 1, 1, NULL, NULL, NULL, '2024-02-10 07:10:46', '2024-02-19 18:28:10'),
(20, 'test', 'test2@gmail.com', NULL, '$2y$10$ULArdxCQ16B9ajUekXdZX.nXLDi.8iPAxzkK1CpXpD7241KJspRDq', '+942344', NULL, NULL, NULL, 1, 3, NULL, NULL, 'asdfadfasdfadfs', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-02-11 07:11:33', '2024-02-12 00:32:05'),
(21, 'adf', 'test22@gmail.com', NULL, '$2y$10$NysUMspFge151dckeHsKDOz.HzpcPOKKyIm7tKaRIgjp0lBxDKfLq', '123456789', NULL, NULL, NULL, 4, 3, NULL, NULL, 'asdfasdfasdfasdf', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-02-12 00:39:20', '2024-02-12 05:12:02'),
(22, 'asdf 123', 'asdfadf_123@gmail.com', NULL, '$2y$10$.cPjkYg.IzlZza177gW.0OgjLdv/Ld.x1L/O9kKSpIgaNpnGPp/4C', '123456789102', '', 1, 4, NULL, 1, 37, '2024-02-12', 'asdfad', 1, '[\"dashboard_read\",\"calendar_read\",\"total_parcel\",\"total_user\",\"total_merchant\",\"total_delivery_man\",\"total_hubs\",\"total_accounts\",\"total_parcels_pending\",\"total_pickup_assigned\",\"total_received_warehouse\",\"total_deliveryman_assigned\",\"total_partial_deliverd\",\"total_parcels_deliverd\",\"recent_accounts\",\"recent_salary\",\"recent_hub\",\"all_statements\",\"income_expense_charts\",\"merchant_revenue_charts\",\"deliveryman_revenue_charts\",\"courier_revenue_charts\",\"recent_parcels\",\"bank_transaction\",\"log_read\",\"hub_read\",\"hub_create\",\"hub_update\",\"hub_delete\",\"hub_incharge_read\",\"hub_incharge_create\",\"hub_incharge_update\",\"hub_incharge_delete\",\"hub_incharge_assigned\",\"account_read\",\"account_create\",\"account_update\",\"account_delete\",\"income_read\",\"income_create\",\"income_update\",\"income_delete\",\"expense_read\",\"expense_create\",\"expense_update\",\"expense_delete\",\"todo_read\",\"todo_create\",\"todo_update\",\"todo_delete\",\"fund_transfer_read\",\"fund_transfer_create\",\"fund_transfer_update\",\"fund_transfer_delete\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_read\",\"user_create\",\"user_update\",\"user_delete\",\"permission_update\",\"merchant_read\",\"merchant_create\",\"merchant_update\",\"merchant_delete\",\"merchant_view\",\"merchant_delivery_charge_read\",\"merchant_delivery_charge_create\",\"merchant_delivery_charge_update\",\"merchant_delivery_charge_delete\",\"merchant_shop_read\",\"merchant_shop_create\",\"merchant_shop_update\",\"merchant_shop_delete\",\"merchant_payment_read\",\"merchant_payment_create\",\"merchant_payment_update\",\"merchant_payment_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"payment_reject\",\"payment_process\",\"hub_payment_read\",\"hub_payment_create\",\"hub_payment_update\",\"hub_payment_delete\",\"hub_payment_reject\",\"hub_payment_process\",\"hub_payment_request_read\",\"hub_payment_request_create\",\"hub_payment_request_update\",\"hub_payment_request_delete\",\"parcel_read\",\"parcel_create\",\"parcel_update\",\"parcel_delete\",\"parcel_status_update\",\"delivery_man_read\",\"delivery_man_create\",\"delivery_man_update\",\"delivery_man_delete\",\"delivery_category_read\",\"delivery_category_create\",\"delivery_category_update\",\"delivery_category_delete\",\"delivery_charge_read\",\"delivery_charge_create\",\"delivery_charge_update\",\"delivery_charge_delete\",\"delivery_type_read\",\"delivery_type_status_change\",\"liquid_fragile_read\",\"liquid_fragile_update\",\"liquid_status_change\",\"packaging_read\",\"packaging_create\",\"packaging_update\",\"packaging_delete\",\"category_read\",\"category_create\",\"category_update\",\"category_delete\",\"account_heads_read\",\"database_backup_read\",\"salary_read\",\"salary_create\",\"salary_update\",\"salary_delete\",\"support_read\",\"support_create\",\"support_update\",\"support_delete\",\"support_reply\",\"support_status_update\",\"sms_settings_read\",\"sms_settings_create\",\"sms_settings_update\",\"sms_settings_delete\",\"sms_send_settings_read\",\"sms_send_settings_create\",\"sms_send_settings_update\",\"sms_send_settings_delete\",\"general_settings_read\",\"general_settings_update\",\"notification_settings_read\",\"notification_settings_update\",\"push_notification_read\",\"push_notification_create\",\"push_notification_update\",\"push_notification_delete\",\"asset_category_read\",\"asset_category_create\",\"asset_category_update\",\"asset_category_delete\",\"news_offer_read\",\"news_offer_create\",\"news_offer_update\",\"news_offer_delete\",\"parcel_status_reports\",\"parcel_wise_profit\",\"parcel_total_summery\",\"salary_reports\",\"merchant_hub_deliveryman\",\"salary_generate_read\",\"salary_generate_create\",\"salary_generate_update\",\"salary_generate_delete\",\"assets_read\",\"assets_create\",\"assets_update\",\"assets_delete\",\"fraud_read\",\"fraud_create\",\"fraud_update\",\"fraud_delete\",\"subscribe_read\",\"pickup_request_regular\",\"pickup_request_express\",\"invoice_read\",\"invoice_status_update\",\"social_login_settings_read\",\"social_login_settings_update\",\"payout_setup_settings_read\",\"payout_setup_settings_update\",\"online_payment_read\",\"payout_read\",\"payout_create\",\"hub_view\",\"paid_invoice_read\",\"invoice_generate_menually\",\"currency_read\",\"currency_create\",\"currency_update\",\"currency_delete\",\"social_link_read\",\"social_link_create\",\"social_link_update\",\"social_link_delete\",\"service_read\",\"service_create\",\"service_update\",\"service_delete\",\"why_courier_read\",\"why_courier_create\",\"why_courier_update\",\"why_courier_delete\",\"faq_read\",\"faq_create\",\"faq_update\",\"faq_delete\",\"partner_read\",\"partner_create\",\"partner_update\",\"partner_delete\",\"blogs_read\",\"blogs_create\",\"blogs_update\",\"blogs_delete\",\"pages_read\",\"pages_update\",\"section_read\",\"section_update\",\"wallet_request_read\",\"wallet_request_create\",\"wallet_request_delete\",\"wallet_request_approve\",\"wallet_request_reject\"]', NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-02-12 03:44:55', '2024-02-19 20:43:32'),
(26, 'riaz', 'riaz@ezycloud.xyz', NULL, '$2y$10$k6XXylKFHw8zQt5MGDrF9OwKyXqF6uzfDgtOwVFS08YPsUqywiTh2', '01820064106', NULL, NULL, NULL, 2, 2, NULL, NULL, 'Mirpur-2', NULL, '[\"parcel_update\"]', NULL, 0.00, NULL, 'cAWGIZ10y7Ub-RAg2F-EOM:APA91bFacqr7j8PG0KVq4td5kcbtAB1JiapsEwNV6lJsGXkwvThr3yRHws-Ux4iIaRb8J3t16EwbPjK3m6mdghakqFNOL03EEbTwMdmLw4TAdbTNr_ztfCkTRR1I31Zt_GvT7EzCgoyT', 1, 1, NULL, NULL, NULL, '2024-02-12 05:56:16', '2024-02-19 18:26:28'),
(27, 'test', 't1@gmail.com', NULL, '$2y$10$XlhS/c389nuIj4XXkVzPJej9Qz8pfa1ul4Y6gkMQzZs.GQt3vDYRu', '123456798', NULL, NULL, NULL, 11, 3, NULL, NULL, 'asdfasdf', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-02-12 23:51:28', '2024-02-12 23:51:28'),
(28, 'testss', 'testt@gmail.com', NULL, '$2y$10$Xwd9jUkBcB2nvaRs/ATti.jlMieQxpJ526kWKTHBsYrsRI4a5q0Wu', '123456788', NULL, NULL, NULL, 11, 3, NULL, NULL, 'Mirpur-2', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-02-12 23:53:48', '2024-02-12 23:53:48'),
(32, 'testt', 'a22@gmail.com', NULL, '$2y$10$EOugpg5n/eax0rUS7S7jSOoLQmZTDhgxqjmCA1NE8zOYKWwmRUZVi', '01826654854', NULL, NULL, NULL, 11, 3, NULL, NULL, 'asdfadfaaa', NULL, NULL, NULL, 0.00, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-02-12 23:57:41', '2024-02-13 00:43:07'),
(35, 'kamala Kannan', 'kamalakannan@gmail.com', NULL, '$2y$10$HCBcfk11cTdo7QuvztbGueqbFhJrP0dbOgB0BHKfj7Q17yzhUxDWG', '777889388', NULL, NULL, NULL, 1, 3, NULL, NULL, '78, Kalamaster Road, Kottawa', NULL, NULL, NULL, 0.00, 'd68a6OI2T-GmFDlrMUSw-m:APA91bFm2ZmwvQEqX108Ou7fovy-WBHnli5YC8m80x0aGcK1Li3_FzZLp0dYdSDMAd4jo0sCcDKCxF1efaCuxKt1zP6XcyNvO3ksP7U-GqCcUdIa3niTvfurGm2yn3NSjCnMGwRYo8ht', NULL, 1, 1, NULL, NULL, NULL, '2024-02-13 04:49:58', '2024-02-19 19:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `vat_statements`
--

CREATE TABLE `vat_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parcel_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'income=1,expense=2',
  `amount` decimal(16,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vat_statements`
--

INSERT INTO `vat_statements` (`id`, `parcel_id`, `type`, `amount`, `date`, `note`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 0.00, '2024-02-11 11:18:47', 'Parcel successfully delivered.', '2024-02-11 05:18:47', '2024-02-11 05:18:47'),
(2, 14, 1, 0.00, '2024-02-17 10:50:31', 'Parcel successfully delivered.', '2024-02-17 15:50:31', '2024-02-17 15:50:31'),
(3, 16, 1, 37.80, '2024-02-17 10:52:59', 'Parcel successfully delivered.', '2024-02-17 15:52:59', '2024-02-17 15:52:59'),
(4, 15, 1, 0.00, '2024-02-17 11:53:15', 'Parcel successfully delivered.', '2024-02-17 16:53:15', '2024-02-17 16:53:15'),
(5, 17, 1, 0.00, '2024-02-17 12:00:24', 'Parcel successfully delivered.', '2024-02-17 17:00:24', '2024-02-17 17:00:24'),
(6, 18, 1, 0.00, '2024-02-17 12:05:22', 'Parcel successfully delivered.', '2024-02-17 17:05:22', '2024-02-17 17:05:22'),
(7, 19, 1, 0.00, '2024-02-17 12:50:48', 'Parcel successfully delivered.', '2024-02-17 17:50:48', '2024-02-17 17:50:48'),
(8, 9, 1, 0.00, '2024-02-18 06:51:23', 'Partial delivered successfully', '2024-02-18 11:51:23', '2024-02-18 11:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` decimal(22,2) DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Income,2= Expense',
  `payment_method` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Offline ',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Pending , 2= Approved,3= Reject',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `source`, `user_id`, `merchant_id`, `transaction_id`, `amount`, `type`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Parcel delivery charge - #DP702143633C1', 4, 1, NULL, 70.00, 2, 2, 2, '2023-12-10 01:40:33', '2023-12-10 01:40:33'),
(2, 'Parcel delivery charge - #DP702822078C1', 4, 1, NULL, 222.87, 2, 2, 2, '2023-12-17 22:07:59', '2023-12-17 22:07:59'),
(3, 'Wallet Recharge', 14, 5, NULL, 20000.00, 1, 1, 2, '2023-12-18 23:47:42', '2023-12-19 00:25:11'),
(4, 'Parcel delivery charge - #DP702916797C5', 14, 5, NULL, 169.50, 2, 2, 2, '2023-12-19 00:26:37', '2023-12-19 00:26:37'),
(5, 'Parcel delivery charge - #DP706782226C18', 4, 1, NULL, 60.00, 2, 2, 2, '2024-02-01 15:10:26', '2024-02-01 15:10:26'),
(6, 'Wallet Recharge', 26, 8, NULL, 500.00, 1, 1, 1, '2024-02-14 14:10:20', '2024-02-14 14:10:20'),
(7, 'Parcel delivery charge - #DP707901972C8', 26, 8, NULL, 60.00, 2, 2, 2, '2024-02-14 14:12:52', '2024-02-14 14:12:52'),
(8, 'Parcel delivery charge - #DP708161242C815', 26, 8, NULL, 220.00, 2, 2, 2, '2024-02-17 14:14:02', '2024-02-17 14:14:02'),
(9, 'Parcel delivery charge - #DP708165739C416', 8, 4, NULL, 210.00, 2, 2, 2, '2024-02-17 15:28:59', '2024-02-17 15:28:59'),
(10, 'Parcel delivery charge - #DP708171044C817', 26, 8, NULL, 220.00, 2, 2, 2, '2024-02-17 16:57:24', '2024-02-17 16:57:24'),
(11, 'Parcel delivery charge - #DP708171405C818', 26, 8, NULL, 220.00, 2, 2, 2, '2024-02-17 17:03:25', '2024-02-17 17:03:25'),
(12, 'Parcel delivery charge - #DP708173489C819', 26, 8, NULL, 220.00, 2, 2, 2, '2024-02-17 17:38:09', '2024-02-17 17:38:09'),
(13, 'Parcel delivery charge - #DP708238889C820', 26, 8, NULL, 220.00, 2, 2, 2, '2024-02-18 11:48:09', '2024-02-18 11:48:09'),
(14, 'Parcel delivery charge - #DP708355090C421', 8, 4, NULL, 275.00, 2, 2, 2, '2024-02-19 20:04:50', '2024-02-19 20:04:50'),
(15, 'Parcel delivery charge - #DP708355163C422', 8, 4, NULL, 125.00, 2, 2, 2, '2024-02-19 20:06:03', '2024-02-19 20:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `why_couriers`
--

CREATE TABLE `why_couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= Active, 0= Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `why_couriers`
--

INSERT INTO `why_couriers` (`id`, `title`, `image_id`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Timely Delivery ', 14, '1', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(2, 'Limitless Pickup', 15, '2', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(3, 'Cash on delivery (COD)', 16, '3', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(4, 'Get Payment Any Time ', 17, '4', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(5, 'Secure Handling ', 18, '5', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22'),
(6, 'Live Tracking Update', 19, '6', 1, '2023-12-08 18:13:22', '2023-12-08 18:13:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `account_heads`
--
ALTER TABLE `account_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assetcategories`
--
ALTER TABLE `assetcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_author_foreign` (`author`),
  ADD KEY `assets_hub_id_foreign` (`hub_id`);

--
-- Indexes for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_transactions_hub_id_foreign` (`hub_id`),
  ADD KEY `bank_transactions_fund_transfer_id_foreign` (`fund_transfer_id`),
  ADD KEY `bank_transactions_account_id_foreign` (`account_id`),
  ADD KEY `bank_transactions_income_id_foreign` (`income_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_image_id_foreign` (`image_id`),
  ADD KEY `blogs_created_by_foreign` (`created_by`);

--
-- Indexes for table `cash_received_from_deliverymen`
--
ALTER TABLE `cash_received_from_deliverymen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_received_from_deliverymen_user_id_foreign` (`user_id`),
  ADD KEY `cash_received_from_deliverymen_hub_id_foreign` (`hub_id`),
  ADD KEY `cash_received_from_deliverymen_account_id_foreign` (`account_id`),
  ADD KEY `cash_received_from_deliverymen_delivery_man_id_foreign` (`delivery_man_id`),
  ADD KEY `cash_received_from_deliverymen_receipt_foreign` (`receipt`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courier_statements`
--
ALTER TABLE `courier_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courier_statements_income_id_foreign` (`income_id`),
  ADD KEY `courier_statements_parcel_id_foreign` (`parcel_id`),
  ADD KEY `courier_statements_delivery_man_id_foreign` (`delivery_man_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverycategories`
--
ALTER TABLE `deliverycategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_statements`
--
ALTER TABLE `deliveryman_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveryman_statements_parcel_id_foreign` (`parcel_id`),
  ADD KEY `deliveryman_statements_delivery_man_id_foreign` (`delivery_man_id`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_charges_category_id_foreign` (`category_id`);

--
-- Indexes for table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_man_user_id_foreign` (`user_id`),
  ADD KEY `delivery_man_driving_license_image_id_foreign` (`driving_license_image_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_account_head_id_foreign` (`account_head_id`),
  ADD KEY `expenses_merchant_id_foreign` (`merchant_id`),
  ADD KEY `expenses_delivery_man_id_foreign` (`delivery_man_id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`),
  ADD KEY `expenses_parcel_id_foreign` (`parcel_id`),
  ADD KEY `expenses_account_id_foreign` (`account_id`),
  ADD KEY `expenses_receipt_foreign` (`receipt`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frauds`
--
ALTER TABLE `frauds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frauds_created_by_foreign` (`created_by`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fund_transfers_from_account_foreign` (`from_account`),
  ADD KEY `fund_transfers_to_account_foreign` (`to_account`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_map_settings`
--
ALTER TABLE `google_map_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hubs`
--
ALTER TABLE `hubs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hub_incharges`
--
ALTER TABLE `hub_incharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hub_payments`
--
ALTER TABLE `hub_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hub_payments_hub_id_foreign` (`hub_id`),
  ADD KEY `hub_payments_from_account_foreign` (`from_account`),
  ADD KEY `hub_payments_reference_file_foreign` (`reference_file`);

--
-- Indexes for table `hub_statements`
--
ALTER TABLE `hub_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hub_statements_user_id_foreign` (`user_id`),
  ADD KEY `hub_statements_hub_id_foreign` (`hub_id`),
  ADD KEY `hub_statements_account_id_foreign` (`account_id`),
  ADD KEY `hub_statements_delivery_man_id_foreign` (`delivery_man_id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_account_head_id_foreign` (`account_head_id`),
  ADD KEY `incomes_user_id_foreign` (`user_id`),
  ADD KEY `incomes_merchant_id_foreign` (`merchant_id`),
  ADD KEY `incomes_delivery_man_id_foreign` (`delivery_man_id`),
  ADD KEY `incomes_parcel_id_foreign` (`parcel_id`),
  ADD KEY `incomes_account_id_foreign` (`account_id`),
  ADD KEY `incomes_hub_id_foreign` (`hub_id`),
  ADD KEY `incomes_hub_user_id_foreign` (`hub_user_id`),
  ADD KEY `incomes_hub_user_account_id_foreign` (`hub_user_account_id`),
  ADD KEY `incomes_receipt_foreign` (`receipt`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_id_unique` (`invoice_id`),
  ADD KEY `invoices_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchants_user_id_foreign` (`user_id`),
  ADD KEY `merchants_nid_id_foreign` (`nid_id`),
  ADD KEY `merchants_trade_license_foreign` (`trade_license`);

--
-- Indexes for table `merchant_delivery_charges`
--
ALTER TABLE `merchant_delivery_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_delivery_charges_merchant_id_foreign` (`merchant_id`),
  ADD KEY `merchant_delivery_charges_delivery_charge_id_foreign` (`delivery_charge_id`);

--
-- Indexes for table `merchant_online_payments`
--
ALTER TABLE `merchant_online_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_online_payments_account_id_foreign` (`account_id`),
  ADD KEY `merchant_online_payments_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `merchant_online_payment_receiveds`
--
ALTER TABLE `merchant_online_payment_receiveds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_online_payment_receiveds_account_id_foreign` (`account_id`),
  ADD KEY `merchant_online_payment_receiveds_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `merchant_payments`
--
ALTER TABLE `merchant_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_payments_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `merchant_settings`
--
ALTER TABLE `merchant_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_settings_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `merchant_shops`
--
ALTER TABLE `merchant_shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_shops_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `merchant_statements`
--
ALTER TABLE `merchant_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_statements_parcel_id_foreign` (`parcel_id`),
  ADD KEY `merchant_statements_merchant_id_foreign` (`merchant_id`),
  ADD KEY `merchant_statements_delivery_man_id_foreign` (`delivery_man_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_offers`
--
ALTER TABLE `news_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_offers_author_foreign` (`author`),
  ADD KEY `news_offers_file_foreign` (`file`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packagings`
--
ALTER TABLE `packagings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_page_index` (`page`),
  ADD KEY `pages_status_index` (`status`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parcels_merchant_id_foreign` (`merchant_id`),
  ADD KEY `parcels_hub_id_foreign` (`hub_id`),
  ADD KEY `parcels_transfer_hub_id_foreign` (`transfer_hub_id`);

--
-- Indexes for table `parcel_events`
--
ALTER TABLE `parcel_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parcel_events_parcel_id_foreign` (`parcel_id`),
  ADD KEY `parcel_events_delivery_man_id_foreign` (`delivery_man_id`),
  ADD KEY `parcel_events_pickup_man_id_foreign` (`pickup_man_id`),
  ADD KEY `parcel_events_hub_id_foreign` (`hub_id`),
  ADD KEY `parcel_events_transfer_delivery_man_id_foreign` (`transfer_delivery_man_id`),
  ADD KEY `parcel_events_created_by_foreign` (`created_by`);

--
-- Indexes for table `parcel_logs`
--
ALTER TABLE `parcel_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parcel_logs_merchant_id_foreign` (`merchant_id`),
  ADD KEY `parcel_logs_hub_id_foreign` (`hub_id`),
  ADD KEY `parcel_logs_delivery_man_id_foreign` (`delivery_man_id`),
  ADD KEY `parcel_logs_parcel_id_foreign` (`parcel_id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partners_image_id_foreign` (`image_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_merchant_id_foreign` (`merchant_id`),
  ADD KEY `payments_from_account_foreign` (`from_account`),
  ADD KEY `payments_reference_file_foreign` (`reference_file`);

--
-- Indexes for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_accounts_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pickup_requests_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `push_notifications_image_id_foreign` (`image_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salaries_user_id_foreign` (`user_id`),
  ADD KEY `salaries_account_id_foreign` (`account_id`);

--
-- Indexes for table `salary_generates`
--
ALTER TABLE `salary_generates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_generates_user_id_foreign` (`user_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_type_index` (`type`),
  ADD KEY `sections_key_index` (`key`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_image_id_foreign` (`image_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_send_settings`
--
ALTER TABLE `sms_send_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supports_user_id_foreign` (`user_id`),
  ADD KEY `supports_department_id_foreign` (`department_id`);

--
-- Indexes for table `support_chats`
--
ALTER TABLE `support_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_chats_support_id_foreign` (`support_id`),
  ADD KEY `support_chats_user_id_foreign` (`user_id`);

--
-- Indexes for table `to_dos`
--
ALTER TABLE `to_dos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_dos_user_id_foreign` (`user_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_google_id_unique` (`google_id`),
  ADD UNIQUE KEY `users_facebook_id_unique` (`facebook_id`),
  ADD KEY `users_designation_id_foreign` (`designation_id`),
  ADD KEY `users_department_id_foreign` (`department_id`),
  ADD KEY `users_hub_id_foreign` (`hub_id`),
  ADD KEY `users_image_id_foreign` (`image_id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `vat_statements`
--
ALTER TABLE `vat_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vat_statements_parcel_id_foreign` (`parcel_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`),
  ADD KEY `wallets_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `why_couriers`
--
ALTER TABLE `why_couriers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `why_couriers_image_id_foreign` (`image_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_heads`
--
ALTER TABLE `account_heads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=780;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetcategories`
--
ALTER TABLE `assetcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cash_received_from_deliverymen`
--
ALTER TABLE `cash_received_from_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courier_statements`
--
ALTER TABLE `courier_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `deliverycategories`
--
ALTER TABLE `deliverycategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deliveryman_statements`
--
ALTER TABLE `deliveryman_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery_man`
--
ALTER TABLE `delivery_man`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `frauds`
--
ALTER TABLE `frauds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `google_map_settings`
--
ALTER TABLE `google_map_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hubs`
--
ALTER TABLE `hubs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hub_incharges`
--
ALTER TABLE `hub_incharges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hub_payments`
--
ALTER TABLE `hub_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hub_statements`
--
ALTER TABLE `hub_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `merchant_delivery_charges`
--
ALTER TABLE `merchant_delivery_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `merchant_online_payments`
--
ALTER TABLE `merchant_online_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant_online_payment_receiveds`
--
ALTER TABLE `merchant_online_payment_receiveds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchant_payments`
--
ALTER TABLE `merchant_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `merchant_settings`
--
ALTER TABLE `merchant_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `merchant_shops`
--
ALTER TABLE `merchant_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `merchant_statements`
--
ALTER TABLE `merchant_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `news_offers`
--
ALTER TABLE `news_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packagings`
--
ALTER TABLE `packagings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `parcel_events`
--
ALTER TABLE `parcel_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `parcel_logs`
--
ALTER TABLE `parcel_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_generates`
--
ALTER TABLE `salary_generates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sms_send_settings`
--
ALTER TABLE `sms_send_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_chats`
--
ALTER TABLE `support_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `to_dos`
--
ALTER TABLE `to_dos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `vat_statements`
--
ALTER TABLE `vat_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `why_couriers`
--
ALTER TABLE `why_couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_author_foreign` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`);

--
-- Constraints for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD CONSTRAINT `bank_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bank_transactions_fund_transfer_id_foreign` FOREIGN KEY (`fund_transfer_id`) REFERENCES `fund_transfers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bank_transactions_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bank_transactions_income_id_foreign` FOREIGN KEY (`income_id`) REFERENCES `incomes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blogs_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cash_received_from_deliverymen`
--
ALTER TABLE `cash_received_from_deliverymen`
  ADD CONSTRAINT `cash_received_from_deliverymen_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_received_from_deliverymen_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_received_from_deliverymen_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_received_from_deliverymen_receipt_foreign` FOREIGN KEY (`receipt`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_received_from_deliverymen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courier_statements`
--
ALTER TABLE `courier_statements`
  ADD CONSTRAINT `courier_statements_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courier_statements_income_id_foreign` FOREIGN KEY (`income_id`) REFERENCES `incomes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courier_statements_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deliveryman_statements`
--
ALTER TABLE `deliveryman_statements`
  ADD CONSTRAINT `deliveryman_statements_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deliveryman_statements_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD CONSTRAINT `delivery_charges_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `deliverycategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD CONSTRAINT `delivery_man_driving_license_image_id_foreign` FOREIGN KEY (`driving_license_image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_man_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_account_head_id_foreign` FOREIGN KEY (`account_head_id`) REFERENCES `account_heads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_receipt_foreign` FOREIGN KEY (`receipt`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `frauds`
--
ALTER TABLE `frauds`
  ADD CONSTRAINT `frauds_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD CONSTRAINT `fund_transfers_from_account_foreign` FOREIGN KEY (`from_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fund_transfers_to_account_foreign` FOREIGN KEY (`to_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hub_payments`
--
ALTER TABLE `hub_payments`
  ADD CONSTRAINT `hub_payments_from_account_foreign` FOREIGN KEY (`from_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hub_payments_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hub_payments_reference_file_foreign` FOREIGN KEY (`reference_file`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `hub_statements`
--
ALTER TABLE `hub_statements`
  ADD CONSTRAINT `hub_statements_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hub_statements_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hub_statements_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hub_statements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_account_head_id_foreign` FOREIGN KEY (`account_head_id`) REFERENCES `account_heads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_hub_user_account_id_foreign` FOREIGN KEY (`hub_user_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_hub_user_id_foreign` FOREIGN KEY (`hub_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_receipt_foreign` FOREIGN KEY (`receipt`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `merchants`
--
ALTER TABLE `merchants`
  ADD CONSTRAINT `merchants_nid_id_foreign` FOREIGN KEY (`nid_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merchants_trade_license_foreign` FOREIGN KEY (`trade_license`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merchants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchant_delivery_charges`
--
ALTER TABLE `merchant_delivery_charges`
  ADD CONSTRAINT `merchant_delivery_charges_delivery_charge_id_foreign` FOREIGN KEY (`delivery_charge_id`) REFERENCES `delivery_charges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merchant_delivery_charges_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchant_online_payments`
--
ALTER TABLE `merchant_online_payments`
  ADD CONSTRAINT `merchant_online_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merchant_online_payments_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchant_online_payment_receiveds`
--
ALTER TABLE `merchant_online_payment_receiveds`
  ADD CONSTRAINT `merchant_online_payment_receiveds_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merchant_online_payment_receiveds_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchant_payments`
--
ALTER TABLE `merchant_payments`
  ADD CONSTRAINT `merchant_payments_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchant_settings`
--
ALTER TABLE `merchant_settings`
  ADD CONSTRAINT `merchant_settings_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchant_shops`
--
ALTER TABLE `merchant_shops`
  ADD CONSTRAINT `merchant_shops_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchant_statements`
--
ALTER TABLE `merchant_statements`
  ADD CONSTRAINT `merchant_statements_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merchant_statements_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `merchant_statements_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_offers`
--
ALTER TABLE `news_offers`
  ADD CONSTRAINT `news_offers_author_foreign` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `news_offers_file_foreign` FOREIGN KEY (`file`) REFERENCES `uploads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parcels`
--
ALTER TABLE `parcels`
  ADD CONSTRAINT `parcels_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`),
  ADD CONSTRAINT `parcels_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcels_transfer_hub_id_foreign` FOREIGN KEY (`transfer_hub_id`) REFERENCES `hubs` (`id`);

--
-- Constraints for table `parcel_events`
--
ALTER TABLE `parcel_events`
  ADD CONSTRAINT `parcel_events_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_events_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_events_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_events_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_events_pickup_man_id_foreign` FOREIGN KEY (`pickup_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_events_transfer_delivery_man_id_foreign` FOREIGN KEY (`transfer_delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parcel_logs`
--
ALTER TABLE `parcel_logs`
  ADD CONSTRAINT `parcel_logs_delivery_man_id_foreign` FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_logs_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_logs_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parcel_logs_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `partners`
--
ALTER TABLE `partners`
  ADD CONSTRAINT `partners_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_from_account_foreign` FOREIGN KEY (`from_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_reference_file_foreign` FOREIGN KEY (`reference_file`) REFERENCES `uploads` (`id`);

--
-- Constraints for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  ADD CONSTRAINT `payment_accounts_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pickup_requests`
--
ALTER TABLE `pickup_requests`
  ADD CONSTRAINT `pickup_requests_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD CONSTRAINT `push_notifications_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `salaries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_generates`
--
ALTER TABLE `salary_generates`
  ADD CONSTRAINT `salary_generates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `supports_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_chats`
--
ALTER TABLE `support_chats`
  ADD CONSTRAINT `support_chats_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `to_dos`
--
ALTER TABLE `to_dos`
  ADD CONSTRAINT `to_dos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_hub_id_foreign` FOREIGN KEY (`hub_id`) REFERENCES `hubs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vat_statements`
--
ALTER TABLE `vat_statements`
  ADD CONSTRAINT `vat_statements_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `parcels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `why_couriers`
--
ALTER TABLE `why_couriers`
  ADD CONSTRAINT `why_couriers_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
