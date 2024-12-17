-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2024 at 12:08 AM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tolitex_wipapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `device` varchar(191) NOT NULL,
  `browser` varchar(191) NOT NULL,
  `ip` varchar(191) NOT NULL,
  `extra` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `greeting` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `regards` varchar(191) DEFAULT NULL,
  `notify` smallint(6) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `slug`, `subject`, `greeting`, `message`, `regards`, `notify`, `created_at`, `updated_at`) VALUES
(1, 'Token Purchase - Order Placed by Online Gateway (USER)', 'order-submit-online-user', 'Order placed for Token Purchase #[[order_id]]', 'Thank you for your contribution!', 'You have requested to purchase [[token_symbol]] token. Your order has been received and is now being waiting for payment. You order details are show below for your reference.\n\n[[order_details]]\n\nYour token balance will appear in your account as soon as we have confirmed your payment from [[payment_gateway]].\n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(2, 'Token Purchase - Order Unpaid/Rejected by Gateway (USER)', 'order-canceled-user', 'Unpaid Order Canceled #[[order_id]]', 'Hello [[user_name]],', 'We noticed that you just tried to purchase [[token_symbol]] token, however we have not received your payment of [[payment_amount]] via [[payment_gateway]] for [[total_tokens]] Token.\n\nIt looks like your payment gateway ([[payment_gateway]]) has been rejected the transaction. \n\n[[order_details]]\n\nIf you want to pay manually, please feel free to contact us via [[support_email]]\n ', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(3, 'Token Purchase - Payment Approved by Gateway (ADMIN)', 'order-successful-admin', 'Payment Received - Order #[[order_id]]', 'Hello Admin,', 'You just received a payment of [[payment_amount]] for order (#[[order_id]]) via [[payment_gateway]]. \n\nThis order has now been approved automatically and token balance added to contributor ([[user_email]]) account. \n\n\nPS. Do not reply to this email.  \nThank you.\n ', 'false', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(4, 'Token Purchase - Payment Rejected/Canceled by Gateway (ADMIN)', 'order-rejected-admin', 'Payment Rejected - Order #[[order_id]]', 'Hello Admin,', 'The order (#[[order_id]]) has been canceled, however the payment was not successful and [[payment_gateway]] rejected or canceled the transaction. \n\n\n[[order_details]] \n\n\nPS. Do not reply to this email.  \nThank you.\n ', 'false', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(5, 'Welcome Email', 'welcome-email', 'Welcome to [[site_name]]', 'Hi [[user_name]],', 'Thanks for joining our platform! \n\nAs a member of our platform, you can mange your account, purchase token, referrals etc. \n\nFind out more about in - [[site_url]]', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(6, 'Send Email to User', 'send-user-email', 'New Message - [[site_name]]', 'Hi [[user_name]], ', '[[messages]]', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(7, 'Password Change Email', 'users-change-password-email', 'Password change request on [[site_name]]', 'Hello [[user_name]],', 'You are receiving this email because we received a password change request for your account.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(8, 'Unusual Login Email', 'users-unusual-login-email    ', 'Unusual Login Attempt on [[site_name]]!!!!', 'Hi [[user_name]], ', 'Someone tried to log in too many times in your [[site_name]] account.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(9, 'Confirm Your Email', 'users-confirm-password-email', 'Please verify your email address - [[site_name]]', 'Welcome!', 'Hello [[user_name]]! \n\nThank you for registering on our platform. You\'re almost ready to start.\n\nSimply click the button below to confirm your email address and active your account.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(10, 'Password Reset Email by Admin', 'users-reset-password-email', 'Your Password is reseted on [[site_name]]', 'Hello [[user_name]],', 'We are reset your login password as per your requested via support.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(11, '2FA Disable Confirmation by Admin', 'users-reset-2fa-email', 'Disable 2FA Authentication Request', 'Hello [[user_name]],', 'We are reset your 2FA authentication as per your requested via support.\n\n If you really want to reset 2FA authentication security in your account, then click the button below to confirm and reset 2FA security.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(12, 'KYC Approved Email', 'kyc-approved-email', 'KYC Verified: Contribute in [[site_name]] ICO', 'Hello [[user_name]],', 'Thank you for submitting your verification request. \n\nWe are pleased to let you know that your identity (KYC) has been verified and you are granted to participate in our token sale.\n\nWe invite you to get back to contributor account and purchase token before sales end.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(13, 'KYC Rejected Email', 'kyc-rejected-email', 'KYC Application has been rejected - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected for following reason: \n[[message]]\n\nDon\'t be upset! Still you want to verity your identity, please get back to your account and fill form with proper information and upload correct documents to complete your identity verification process.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(14, 'KYC Missing Email', 'kyc-missing-email', 'Identity Verification: Action Required - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected because of the following reason:\n[[message]]\n\nWe request to get back to your account in order to upload new documents and complete the identity verification.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(15, 'KYC Submitted Email', 'kyc-submit-email', 'Document submitted for Identity Verification - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'ve received your submitted document and other information for identity verification.\n\nWe\'ll review your information and if all is in order will approve your identity. If the information is incorrect or something missing, we will request this as soon as possible.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(16, 'KYC Submitted Email (ADMIN)', 'kyc-submit-email-admin', 'New request for Identity Verification', 'Hello Admin,', 'You have new identity verification request from name: [[user_name]], email: [[user_email]] and id: [[user_id]]. \n\nPlease login into dashboard and check from KYC list verification center. \n\nThank You.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(17, 'Token Purchase - Order Placed by Manual payment (USER)', 'order-submit-user', 'Order placed for Token Purchase #[[order_id]]', 'Thank you for your contribution!', 'You have requested to purchase [[token_symbol]] token. Your order has been received and is now being processed. You order details are show below for your reference. \n\n[[order_details]]\n\nIf you have not made the payment yet, please send your payments to the following address: [[payment_from]]\n\nYour order will be processed within 6 hours from the receipt of payment and token balance will appear in your account as soon as we have confirmed your payment. \n\nFeel free to contact us if you have any questions.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(18, 'Token Purchase - Order Successful (USER)', 'order-successful-user', 'Token Purchase Successful - Order #[[order_id]]', 'Congratulation [[user_name]], you order has been processed successfully.', 'Thank you for your contribution and purchase our [[token_symbol]] Token! \n\n[[order_details]]\n\nYour token balances now appear in your account. Please login into your and check your balance. Please note that, we will send smart contract end of the token sales. \n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(19, 'Token Purchase - Order Rejected by Admin (USER)', 'order-rejected-user', 'Canceled Order #[[order_id]]', 'Hello [[user_name]],', 'The order (#[[order_id]]) has been canceled. \n\nWe noticed that you just tried to purchase [[token_symbol]] token, however we have not received your payment of [[payment_amount]] from your wallet ([[payment_from]]) for [[total_tokens]] Token.\n\nIf you still want to contribute please login into account and purchase the token again. \n[[site_login]]\n\nFeel free to contact us if you have any questions.\n', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(20, 'Token Purchase - Order Placed (ADMIN)', 'order-placed-admin', 'New Token Purchase Request #[[order_id]]', 'Hello Admin,', 'You have received a token purchased request form [[user_name]].\n\n[[order_details]]\n\nOrder By: [[user_name]]\nEmail Address: [[user_email]]\n\nPlease login into account and check details of transaction and take necessary steps.\n\n\nPS. Do not reply to this email. \nThank you.\n', 'false', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(21, 'Token Purchase - Canceled by User (ADMIN)', 'order-canceled-admin', 'Order #[[order_id]] Canceled by Contributor', 'Hello Admin,', 'The order (#[[order_id]]) has been canceled by [[user_name]] (contributor).\n\n\nPS. Do not reply to this email.\nThank you.\n', 'false', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(22, 'Token Refund - Refund By Admin (USER)', 'order-refund-token', 'Your order has been refunded', 'Hello [[user_name]],', 'Thank you for purchase [[token_symbol]] token from [[site_name]].\n\nWe found some problem in your payment so we have refunded your order and readjusted your token balance. Please find below your refund and original purchase order details.\n[[refund_details]]\n[[order_details]]\n\nNote: Your payment already refunded via same payment method that you used for payment.\n\nIf you have any questions about this refund, please feel free to contact us.\n', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(23, 'Wallet Change Request Submitted', 'wallet-change-pending', 'Request for changing wallet address received', 'Hello [[user_name]],', 'Thank you for requesting to change your receiving wallet address. \n\nWe\'ll review your information and if all is in order, will approve your request.', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(24, 'Wallet Change Request Submitted (Admin)', 'wallet-change-pending-admin', 'User #[[user_id]] wants to change receiving wallet', 'Hello Admin,', 'You have received a wallet change request form [[user_name]].\n\nPlease login into account to check details of the request and take necessary steps accordingly.\n\n\nPS. Do not reply to this email. \nThank you.\n', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(25, 'Wallet Change Request Status', 'wallet-change-status', 'Request for changing wallet address [[status]]', 'Hello [[user_name]],', 'Your wallet change request has been [[status]].\n\nIf you have any questions about this, please feel free to contact us.\n', 'true', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `global_metas`
--

CREATE TABLE `global_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `value` text,
  `extra` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ico_metas`
--

CREATE TABLE `ico_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `stage_id` int(11) NOT NULL,
  `option_name` varchar(191) NOT NULL,
  `option_value` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ico_metas`
--

INSERT INTO `ico_metas` (`id`, `stage_id`, `option_name`, `option_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(2, 1, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(3, 2, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(4, 2, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(5, 3, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(6, 3, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(7, 4, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(8, 4, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(9, 5, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(10, 5, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(11, 6, 'bonus_option', '{\"base\":{\"amount\":25,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":1},\"bonus_amount\":{\"status\":1,\"tire_1\":{\"amount\":15,\"token\":2500},\"tire_2\":{\"amount\":null,\"token\":null},\"tire_3\":{\"amount\":null,\"token\":null}}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(12, 6, 'price_option', '{\"tire_1\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_2\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0},\"tire_3\":{\"price\":0,\"min_purchase\":0,\"start_date\":\"2000-01-01 00:00:00\",\"end_date\":\"2000-01-01 23:59:00\",\"status\":0}}', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `ico_stages`
--

CREATE TABLE `ico_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `total_tokens` bigint(20) NOT NULL,
  `base_price` double NOT NULL,
  `min_purchase` bigint(20) NOT NULL DEFAULT '0',
  `max_purchase` bigint(20) NOT NULL DEFAULT '0',
  `soft_cap` bigint(20) NOT NULL DEFAULT '0',
  `hard_cap` bigint(20) NOT NULL DEFAULT '0',
  `display_mode` varchar(191) NOT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `user_panel_display` int(11) NOT NULL DEFAULT '0',
  `sales_token` double NOT NULL DEFAULT '0',
  `sales_amount` double NOT NULL DEFAULT '0',
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ico_stages`
--

INSERT INTO `ico_stages` (`id`, `name`, `start_date`, `end_date`, `total_tokens`, `base_price`, `min_purchase`, `max_purchase`, `soft_cap`, `hard_cap`, `display_mode`, `private`, `user_panel_display`, `sales_token`, `sales_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Stage 1', '2024-10-08 05:07:12', '2024-11-08 05:07:12', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(2, 'Demo Stage 2', '2024-11-08 05:07:12', '2024-12-08 05:07:12', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(3, 'Demo Stage 3', '2024-11-08 05:07:12', '2024-12-08 05:07:12', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(4, 'Demo Stage 4', '2024-11-08 05:07:12', '2024-12-08 05:07:12', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(5, 'Demo Stage 5', '2024-11-08 05:07:12', '2024-12-08 05:07:12', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(6, 'Demo Stage 6', '2024-11-08 05:07:12', '2024-12-08 05:07:12', 850000, 0.2, 100, 10000, 0, 0, 'normal', 0, 0, 0, 0, 'active', '2024-10-08 10:07:12', '2024-10-08 10:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `firstName` varchar(191) NOT NULL,
  `lastName` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `dob` varchar(191) DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `telegram` varchar(191) DEFAULT '',
  `documentType` varchar(191) DEFAULT '',
  `document` varchar(191) DEFAULT '',
  `document2` varchar(191) DEFAULT '',
  `document3` varchar(191) DEFAULT '',
  `walletName` varchar(191) DEFAULT '',
  `walletAddress` varchar(191) DEFAULT '',
  `notes` text,
  `reviewedBy` int(11) NOT NULL DEFAULT '0',
  `reviewedAt` datetime DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  `short` varchar(191) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `label`, `short`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'English', 'EN', 'en', 1, '2024-10-08 10:07:14', '2024-10-08 10:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_01_043848_create_settings_table', 1),
(4, '2018_11_03_084440_create_activities_table', 1),
(5, '2018_11_03_091911_create_user_metas_table', 1),
(6, '2018_11_03_100212_create_transactions_table', 1),
(7, '2018_11_05_055256_create_kycs_table', 1),
(8, '2018_11_08_110810_create_ico_stages_table', 1),
(9, '2018_11_10_054817_create_ico_metas_table', 1),
(10, '2018_11_12_090411_create_payment_methods_table', 1),
(11, '2018_11_22_102451_create_pages_table', 1),
(12, '2018_11_27_123445_create_email_templates_table', 1),
(13, '2018_12_11_134112_create_global_metas_table', 1),
(14, '2019_05_05_123232_create_referrals_table', 1),
(15, '2019_07_16_133004_add_refund_column_in_transactions_table', 1),
(16, '2019_08_28_124836_add_lang_column_in_pages_table', 1),
(17, '2019_08_28_130012_create_languages_table', 1),
(18, '2019_08_28_130334_create_translates_table', 1),
(19, '2022_11_15_133104_add_dist_amount_column_in_users_table', 1),
(20, '2023_10_17_090714_create_private_invitations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `menu_title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `custom_slug` varchar(191) NOT NULL,
  `meta_keyword` varchar(191) DEFAULT NULL,
  `meta_description` text,
  `meta_index` int(11) NOT NULL DEFAULT '1',
  `description` longtext NOT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `lang` varchar(191) NOT NULL DEFAULT 'en',
  `public` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `menu_title`, `slug`, `custom_slug`, `meta_keyword`, `meta_description`, `meta_index`, `description`, `external_link`, `status`, `lang`, `public`, `created_at`, `updated_at`) VALUES
(1, 'Thank you for your interest to our [[site_name]]', 'Welcome block', 'home_top', 'home-top-block', NULL, NULL, 1, 'You can contribute [[token_symbol]] token go through Buy Token page. \n\n You can get a quick response to any questions, and chat with the project in our Telegram: https://t.me/icocrypto \n\n<strong>Don’t hesitate to invite your friends!</strong> \n\n[[whitepaper_download_button]]', NULL, 'active', 'en', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(2, 'How to buy?', 'How to buy?', 'how_buy', 'how-to-buy', NULL, NULL, 1, 'Login with your email and password then go to Buy Token!', NULL, 'active', 'en', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(3, 'FAQ ', 'FAQ ', 'faq', 'faq', NULL, NULL, 1, 'Frequently Ask Questions...', NULL, 'active', 'en', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(4, 'Privacy and Policy', 'Privacy and Policy', 'privacy', 'privacy-policy', NULL, NULL, 1, '[[site_name]] Privacy and Policies...', NULL, 'active', 'en', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(5, 'Terms and Condition', 'Terms and Condition', 'terms', 'terms-and-condition', NULL, NULL, 1, '[[site_name]] Terms and Condition...', NULL, 'active', 'en', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(6, 'ICO Distribution', 'ICO Distribution', 'distribution', 'ico-distribution', NULL, NULL, 1, 'Distribution page content', NULL, 'hide', 'en', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(7, 'Referral', 'Referral', 'referral', 'referral', NULL, NULL, 1, 'Invite your friends and family and receive free tokens. \nThe referral link may be used during a token contribution, in the pre-sale and the ICO. \n\nImagine giving your unique referral link to your crypto-friend and he or she contributes tokens using your link, the bonus will be sent to your account automatically. The strategy is simple: the more links you send to your colleagues, family and friends - the more tokens you may earn!', NULL, 'hide', 'en', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(8, 'Custom Page', 'Custom Page', 'custom_page', 'custom-page', NULL, NULL, 1, 'Details about the page!', NULL, 'hide', 'en', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `data` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `payment_method`, `title`, `description`, `data`, `status`, `created_at`, `updated_at`) VALUES
(1, 'manual', 'Pay via Crypto', 'You can send payment direct to our wallets. We will manually verify.', '{\"eth\":{\"status\":\"inactive\",\"address\":null,\"limit\":null,\"price\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"btc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"ltc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"bch\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"bnb\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"trx\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xlm\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xrp\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"usdt\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"usdc\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"dash\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"waves\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"xmr\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"busd\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"ada\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"doge\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"sol\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"uni\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"},\"link\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\",\"network\":\"default\"},\"cake\":{\"status\":\"inactive\",\"address\":null,\"num\":3,\"req\":\"no\"}}', 'inactive', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(2, 'bank', 'Pay via Bank Transfer', 'You can send payment direct to our bank account.', '{\"bank_account_name\":null,\"bank_account_number\":null,\"bank_holder_address\":null,\"bank_name\":null,\"bank_address\":null,\"routing_number\":null,\"iban\":null,\"swift_bic\":null}', 'inactive', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(3, 'paypal', 'Pay with PayPal', 'You can send your payment using your PayPal account.', '{\"email\":null,\"sandbox\":0,\"clientId\":null,\"clientSecret\":null,\"is_active\":0}', 'inactive', '2024-10-08 10:07:12', '2024-10-08 10:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `private_invitations`
--

CREATE TABLE `private_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `signup` int(11) NOT NULL DEFAULT '0',
  `visit` int(11) NOT NULL DEFAULT '0',
  `start_date` varchar(191) DEFAULT NULL,
  `end_date` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_bonus` double DEFAULT NULL,
  `refer_by` int(11) DEFAULT NULL,
  `refer_bonus` double DEFAULT NULL,
  `meta_data` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) NOT NULL,
  `value` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'TokenLite', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(2, 'site_email', 'info@yourdomain.com', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(3, 'site_base_currency', 'USD', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(4, 'site_copyright', 'All Right Reserved.', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(5, 'site_support_address', '', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(6, 'site_support_phone', '', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(7, 'site_support_email', '', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(8, 'token_default_in_userpanel', 'ETH', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(9, 'token_sales_raised', 'token', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(10, 'token_sales_total', 'token', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(11, 'token_sales_cap', 'token', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(12, 'tokenlite_credible', 'none', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(13, 'main_website_url', NULL, '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(14, 'pm_automatic_rate_time', '30', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(15, 'theme_admin', 'style', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(16, 'theme_user', 'style', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(17, 'theme_custom', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(18, 'theme_auth_layout', 'default', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(19, 'site_date_format', 'd M, Y', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(20, 'site_time_format', 'h:i A', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(21, 'site_timezone', 'UTC', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(22, 'tokenlite_ukey', '5hcPWdxQ', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(23, 'site_social_links', '{\"onsite\":\"on\",\"onlogin\":\"on\",\"facebook\":null,\"twitter\":null,\"linkedin\":null,\"github\":null,\"medium\":null,\"youtube\":null,\"telegram\":null}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(24, 'tokenlite_install', '2024-10-08 05:07:10', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(25, 'referral_system', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(26, 'referral_allow', 'all_time', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(27, 'referral_calc', 'percent', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(28, 'referral_bonus', '10', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(29, 'referral_bonus_join', '10', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(30, 'referral_info_show', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(31, 'referral_allow_join', 'all_time', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(32, 'referral_calc_join', 'percent', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(33, 'disable_reg_msg', 'Registration is temporarily off.', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(34, 'pinv_alt_msg', 'This is a private invitation. Please register.', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(35, 'token_wallet_opt', '{\"wallet_opt\":[\"ethereum\",\"bitcoin\",\"litecoin\"]}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(36, 'token_wallet_note', 'Address should be ERC20-compliant.', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(37, 'token_wallet_custom', '{\"cw_name\":null,\"cw_text\":null}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(38, 'token_wallet_req', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(39, 'token_number_format', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(40, 'user_in_cur1', 'eth', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(41, 'user_in_cur2', 'btc', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(42, 'user_mytoken_page', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(43, 'user_mytoken_stage', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(44, 'user_sales_progress', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(45, 'welcome_img_hide', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(46, 'opt_count_hide', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(47, 'languages_show_as', 'code', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(48, 'languages_switcher', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(49, 'languages_default', 'en', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(50, 'site_mail_driver', 'mail', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(51, 'site_mail_host', '', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(52, 'site_mail_port', '587', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(53, 'site_mail_encryption', 'tls', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(54, 'site_mail_from_address', 'noreply@yourdomain.com', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(55, 'site_mail_from_name', 'TokenLite', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(56, 'site_mail_username', '', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(57, 'site_mail_password', '', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(58, 'site_mail_footer', 'Best Regards\n[[site_name]]', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(59, 'tokenlite_pkey', '23604094', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(60, 'site_admin_management', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(61, 'manage_access_default', '{\"level\":[\"none\"]}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(62, 'kyc_opt_hide', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(63, 'kyc_public', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(64, 'kyc_before_email', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(65, 'kyc_firstname', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(66, 'kyc_lastname', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(67, 'kyc_email', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(68, 'kyc_phone', '{\"show\":1,\"req\":0}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(69, 'kyc_dob', '{\"show\":1,\"req\":0}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(70, 'kyc_gender', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(71, 'kyc_country', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(72, 'kyc_state', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(73, 'kyc_city', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(74, 'kyc_zip', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(75, 'kyc_address1', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(76, 'kyc_address2', '{\"show\":1,\"req\":0}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(77, 'kyc_telegram', '{\"show\":1,\"req\":0}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(78, 'kyc_document_passport', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(79, 'kyc_document_nidcard', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(80, 'kyc_document_driving', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(81, 'kyc_wallet', '{\"show\":1,\"req\":1}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(82, 'kyc_wallet_custom', '{\"cw_name\":null,\"cw_text\":null}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(83, 'kyc_wallet_note', 'Address should be ERC20-compliant.', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(84, 'kyc_wallet_opt', '{\"wallet_opt\":[\"ethereum\",\"bitcoin\",\"litecoin\"]}', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(85, 'token_purchase_usd', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(86, 'pmc_active_usd', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(87, 'token_purchase_eur', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(88, 'pmc_active_eur', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(89, 'token_purchase_gbp', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(90, 'pmc_active_gbp', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(91, 'token_purchase_cad', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(92, 'pmc_active_cad', '1', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(93, 'token_purchase_aud', '0', '2024-10-08 10:07:10', '2024-10-08 10:07:10'),
(94, 'pmc_active_aud', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(95, 'token_purchase_try', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(96, 'pmc_active_try', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(97, 'token_purchase_rub', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(98, 'pmc_active_rub', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(99, 'token_purchase_inr', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(100, 'pmc_active_inr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(101, 'token_purchase_brl', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(102, 'pmc_active_brl', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(103, 'token_purchase_nzd', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(104, 'pmc_active_nzd', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(105, 'token_purchase_pln', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(106, 'pmc_active_pln', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(107, 'token_purchase_jpy', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(108, 'pmc_active_jpy', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(109, 'token_purchase_myr', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(110, 'pmc_active_myr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(111, 'token_purchase_idr', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(112, 'pmc_active_idr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(113, 'token_purchase_ngn', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(114, 'pmc_active_ngn', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(115, 'token_purchase_mxn', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(116, 'pmc_active_mxn', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(117, 'token_purchase_php', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(118, 'pmc_active_php', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(119, 'token_purchase_chf', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(120, 'pmc_active_chf', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(121, 'token_purchase_thb', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(122, 'pmc_active_thb', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(123, 'token_purchase_sgd', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(124, 'pmc_active_sgd', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(125, 'token_purchase_czk', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(126, 'pmc_active_czk', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(127, 'token_purchase_nok', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(128, 'pmc_active_nok', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(129, 'token_purchase_zar', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(130, 'pmc_active_zar', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(131, 'token_purchase_sek', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(132, 'pmc_active_sek', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(133, 'token_purchase_kes', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(134, 'pmc_active_kes', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(135, 'token_purchase_nad', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(136, 'pmc_active_nad', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(137, 'token_purchase_dkk', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(138, 'pmc_active_dkk', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(139, 'token_purchase_hkd', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(140, 'pmc_active_hkd', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(141, 'token_purchase_huf', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(142, 'pmc_active_huf', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(143, 'token_purchase_pkr', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(144, 'pmc_active_pkr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(145, 'token_purchase_egp', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(146, 'pmc_active_egp', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(147, 'token_purchase_clp', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(148, 'pmc_active_clp', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(149, 'token_purchase_cop', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(150, 'pmc_active_cop', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(151, 'token_purchase_jmd', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(152, 'pmc_active_jmd', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(153, 'token_purchase_eth', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(154, 'pmc_active_eth', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(155, 'token_purchase_btc', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(156, 'pmc_active_btc', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(157, 'token_purchase_ltc', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(158, 'pmc_active_ltc', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(159, 'token_purchase_xrp', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(160, 'pmc_active_xrp', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(161, 'token_purchase_xlm', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(162, 'pmc_active_xlm', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(163, 'token_purchase_bch', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(164, 'pmc_active_bch', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(165, 'token_purchase_bnb', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(166, 'pmc_active_bnb', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(167, 'token_purchase_usdt', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(168, 'pmc_active_usdt', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(169, 'token_purchase_trx', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(170, 'pmc_active_trx', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(171, 'token_purchase_usdc', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(172, 'pmc_active_usdc', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(173, 'token_purchase_dash', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(174, 'pmc_active_dash', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(175, 'token_purchase_waves', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(176, 'pmc_active_waves', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(177, 'token_purchase_xmr', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(178, 'pmc_active_xmr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(179, 'token_purchase_busd', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(180, 'pmc_active_busd', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(181, 'token_purchase_ada', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(182, 'pmc_active_ada', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(183, 'token_purchase_doge', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(184, 'pmc_active_doge', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(185, 'token_purchase_sol', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(186, 'pmc_active_sol', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(187, 'token_purchase_uni', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(188, 'pmc_active_uni', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(189, 'token_purchase_link', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(190, 'pmc_active_link', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(191, 'token_purchase_cake', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(192, 'pmc_active_cake', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(193, 'token_purchase_avax', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(194, 'pmc_active_avax', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(195, 'token_purchase_luna', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(196, 'pmc_active_luna', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(197, 'token_purchase_matic', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(198, 'pmc_active_matic', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(199, 'token_purchase_dot', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(200, 'pmc_active_dot', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(201, 'token_purchase_shib', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(202, 'pmc_active_shib', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(203, 'token_purchase_cro', '0', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(204, 'pmc_active_cro', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(205, 'pm_exchange_method', 'automatic', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(206, 'pm_exchange_auto_lastcheck', '2024-10-08 04:57:11', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(207, 'token_calculate', 'normal', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(208, 'token_calculate_note', 'normal', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(209, 'token_default_method', 'ETH', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(210, 'active_payment_modules', '{\"Manual\":{\"type\":\"core\",\"version\":\"1.0\"},\"Bank\":{\"type\":\"core\",\"version\":\"1.0\"},\"Paypal\":{\"type\":\"core\",\"version\":\"1.0\"}}', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(211, 'site_api_key', 'DEkFb4m682UyOJtQMQFuN56J', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(212, 'site_api_secret', 'Ngvke14e63d6PWJj', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(213, 'nio_lkey', '27SFWt4f2u3UFgSRfUv8FYnLSgxmzjxi', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(214, 'pmc_rate_usd', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(215, 'pmc_rate_eur', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(216, 'pmc_rate_gbp', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(217, 'pmc_rate_cad', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(218, 'pmc_rate_aud', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(219, 'pmc_rate_try', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(220, 'pmc_rate_rub', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(221, 'pmc_rate_inr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(222, 'pmc_rate_brl', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(223, 'pmc_rate_nzd', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(224, 'pmc_rate_pln', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(225, 'pmc_rate_jpy', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(226, 'pmc_rate_myr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(227, 'pmc_rate_idr', '1', '2024-10-08 10:07:11', '2024-10-08 10:07:11'),
(228, 'pmc_rate_ngn', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(229, 'pmc_rate_mxn', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(230, 'pmc_rate_php', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(231, 'pmc_rate_chf', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(232, 'pmc_rate_thb', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(233, 'pmc_rate_sgd', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(234, 'pmc_rate_czk', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(235, 'pmc_rate_nok', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(236, 'pmc_rate_zar', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(237, 'pmc_rate_sek', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(238, 'pmc_rate_kes', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(239, 'pmc_rate_nad', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(240, 'pmc_rate_dkk', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(241, 'pmc_rate_hkd', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(242, 'pmc_rate_huf', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(243, 'pmc_rate_pkr', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(244, 'pmc_rate_egp', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(245, 'pmc_rate_clp', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(246, 'pmc_rate_cop', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(247, 'pmc_rate_jmd', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(248, 'pmc_rate_eth', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(249, 'pmc_rate_btc', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(250, 'pmc_rate_ltc', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(251, 'pmc_rate_xrp', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(252, 'pmc_rate_xlm', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(253, 'pmc_rate_bch', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(254, 'pmc_rate_bnb', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(255, 'pmc_rate_usdt', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(256, 'pmc_rate_trx', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(257, 'pmc_rate_usdc', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(258, 'pmc_rate_dash', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(259, 'pmc_rate_waves', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(260, 'pmc_rate_xmr', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(261, 'pmc_rate_busd', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(262, 'pmc_rate_ada', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(263, 'pmc_rate_doge', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(264, 'pmc_rate_sol', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(265, 'pmc_rate_uni', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(266, 'pmc_rate_link', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(267, 'pmc_rate_cake', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(268, 'pmc_rate_avax', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(269, 'pmc_rate_luna', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(270, 'pmc_rate_matic', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(271, 'pmc_rate_dot', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(272, 'pmc_rate_shib', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(273, 'pmc_rate_cro', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(274, 'actived_stage', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(275, 'token_name', 'TokenLite', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(276, 'token_symbol', 'TLE', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(277, 'token_decimal_min', '2', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(278, 'token_decimal_max', '6', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(279, 'token_decimal_show', '3', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(280, 'token_price_show', '1', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(281, 'token_before_kyc', '0', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(282, 'site_db_version', '243057', '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(283, 'lang_last_update_en', '1728364034', '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(284, 'lang_last_generate_en', '1728364034', '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(285, 'lang_db_version', '240929', '2024-10-08 10:07:15', '2024-10-08 10:07:15');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tnx_id` varchar(191) NOT NULL,
  `tnx_type` varchar(191) NOT NULL,
  `tnx_time` datetime NOT NULL,
  `tokens` double NOT NULL DEFAULT '0',
  `bonus_on_base` double NOT NULL DEFAULT '0',
  `bonus_on_token` double NOT NULL DEFAULT '0',
  `total_bonus` double NOT NULL DEFAULT '0',
  `total_tokens` double NOT NULL,
  `stage` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `receive_amount` double NOT NULL DEFAULT '0',
  `receive_currency` varchar(191) DEFAULT NULL,
  `base_amount` double DEFAULT NULL,
  `base_currency` varchar(191) DEFAULT NULL,
  `base_currency_rate` double DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `currency_rate` double DEFAULT NULL,
  `all_currency_rate` text,
  `wallet_address` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_id` varchar(191) NOT NULL DEFAULT '',
  `payment_to` varchar(191) DEFAULT NULL,
  `checked_by` text,
  `added_by` text,
  `checked_time` datetime DEFAULT NULL,
  `details` varchar(191) NOT NULL DEFAULT '',
  `extra` text,
  `status` varchar(191) NOT NULL DEFAULT '',
  `dist` int(11) NOT NULL DEFAULT '0',
  `refund` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translates`
--

CREATE TABLE `translates` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `text` text,
  `pages` varchar(191) NOT NULL DEFAULT 'global',
  `group` varchar(191) NOT NULL DEFAULT 'system',
  `panel` varchar(191) NOT NULL DEFAULT 'any',
  `load` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translates`
--

INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(1, 'messages.email_exist', 'base', 'Email is already exist!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(2, 'messages.email.unique', 'base', 'Email address should be unique!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(3, 'messages.email.reset', 'base', 'Somthing is wrong! We are unable to send reset link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(4, 'messages.email.verify', 'base', 'Somthing is wrong! We are unable to send the verification link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(5, 'messages.email.password_change', 'base', 'Somthing is wrong! We are unable to send the confirmation link to your email. Please! contact with administrator via :email.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(6, 'messages.email.failed', 'base', 'But email was not send to user. Please check your mail setting credential.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(7, 'messages.form.invalid', 'base', 'Invalid form data!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(8, 'messages.form.wrong', 'base', 'Something wrong in form submission!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(9, 'messages.wrong', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(10, 'messages.nothing', 'base', 'Nothing to do!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(11, 'messages.agree', 'base', 'You should agree our terms and policy.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(12, 'messages.errors', 'base', 'An error occurred. Please try again.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(13, 'messages.login.email_verify', 'base', 'Please login to verify you email address.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(14, 'messages.login.inactive', 'base', 'Your account may inactive or suspended. Please contact us if something wrong.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(15, 'messages.register.success.heading', 'base', 'Thank you!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(16, 'messages.register.success.subhead', 'base', 'Your sign-up process is almost done.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(17, 'messages.register.success.msg', 'base', 'Please check your email and verify your account.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(18, 'messages.register.success.unverified.msg', 'base', 'You can also sign in without verifying.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(19, 'messages.register.invitation.invalid.msg', 'base', 'The invitation link is invalid or already expired.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(20, 'messages.register.referral.code.invalid.msg', 'base', 'Your referral code is invalid.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(21, 'messages.verify.verified', 'base', 'Email address is already verified.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(22, 'messages.verify.not_found', 'base', 'User Account is not found!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(23, 'messages.verify.expired', 'base', 'Your verification link is expired!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(24, 'messages.verify.invalid', 'base', 'Your verification link is invalid!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(25, 'messages.verify.confirmed', 'base', 'Your email is verified now!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(26, 'messages.verify.success.heading', 'base', 'Congratulations!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(27, 'messages.verify.success.subhead', 'base', 'You\'ve successfully verified your email address and your account is now active.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(28, 'messages.verify.success.msg', 'base', 'Please sign-in to start token purchase.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(29, 'messages.trnx.created', 'base', 'Transaction successful, You will redirect to payment page.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(30, 'messages.trnx.wrong', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(31, 'messages.trnx.required', 'base', 'Transaction id is required!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(32, 'messages.trnx.canceled', 'base', 'Transaction failed! Try again.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(33, 'messages.trnx.notfound', 'base', 'Transaction id is not found', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(34, 'messages.trnx.reviewing', 'base', 'We are reviewing your payment!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(35, 'messages.trnx.canceled_own', 'base', 'You had canceled your order', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(36, 'messages.trnx.require_currency', 'base', 'Currency is required!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(37, 'messages.trnx.require_token', 'base', 'Token amount is required!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(38, 'messages.trnx.select_method', 'base', 'Select payment method!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(39, 'messages.trnx.minimum_token', 'base', 'You have to purchase more than 1 token.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(40, 'messages.trnx.purchase_token', 'base', 'Tokens Purchase', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(41, 'messages.trnx.referral_bonus', 'base', 'Referral Bonus', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(42, 'messages.trnx.payments.not_available', 'base', 'Sorry! Currently payment method not available in your selected currency!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(43, 'messages.trnx.manual.success', 'base', 'Transaction successful!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(44, 'messages.trnx.manual.failed', 'base', 'Transaction Failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(45, 'messages.trnx.admin.approved', 'base', 'Transaction approved and token added to user.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(46, 'messages.trnx.admin.canceled', 'base', 'Transaction canceled.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(47, 'messages.trnx.admin.deleted', 'base', 'Transaction Deleted.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(48, 'messages.trnx.admin.already_deleted', 'base', 'This transaction is already deleted.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(49, 'messages.trnx.admin.already_approved', 'base', 'This transaction is already approved.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(50, 'messages.trnx.admin.already_canceled', 'base', 'This transaction is already canceled.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(51, 'messages.trnx.admin.already_updated', 'base', 'This transaction is already updated to :status.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(52, 'messages.token.success', 'base', 'Token added to the user account!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(53, 'messages.token.failed', 'base', 'Failed to add token!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(54, 'messages.insert.success', 'base', ':what insert successful!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(55, 'messages.insert.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(56, 'messages.insert.failed', 'base', ':what insert failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(57, 'messages.stage.expired', 'base', 'Sorry, this stage is expired!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(58, 'messages.stage.inactive', 'base', 'Currently no active stage found!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(59, 'messages.stage.notice', 'base', 'Please create a new stage or update stage date, because this stage is expired!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(60, 'messages.stage.upcoming', 'base', 'Stage will start at :time', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(61, 'messages.stage.delete_failed', 'base', 'You can not remove the last stage.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(62, 'messages.stage.not_started', 'base', 'Our sell have not started yet. Please check after some times.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(63, 'messages.stage.completed', 'base', 'Our token sales has been finished. Thank you very much for your contribution.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(64, 'messages.create.success', 'base', ':what has been created!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(65, 'messages.create.failed', 'base', ':what creating failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(66, 'messages.update.success', 'base', ':what has been updated!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(67, 'messages.update.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(68, 'messages.update.failed', 'base', ':what updating failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(69, 'messages.password.old_err', 'base', 'Your old password is incorrect.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(70, 'messages.password.success', 'base', 'Password successfully changed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(71, 'messages.password.changed', 'base', 'We have sent a verification code to your email please confirm and change.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(72, 'messages.password.failed', 'base', 'Varification link has expired!!! try again', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(73, 'messages.password.token', 'base', 'Invalid link/token!!! try again', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(74, 'messages.delete.delete', 'base', ':what is deleted!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:12', '2024-10-08 10:07:12'),
(75, 'messages.delete.delete_failed', 'base', ':what is deletion failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(76, 'messages.unverified.users.delete', 'base', ':what deleted!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(77, 'messages.unverified.users.delete_failed', 'base', ':what deletion failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(78, 'messages.kyc.approved', 'base', 'KYC application approved successfully!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(79, 'messages.kyc.missing', 'base', 'KYC application is missing!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(80, 'messages.kyc.rejected', 'base', 'KYC application is rejected!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(81, 'messages.kyc.wait', 'base', 'Your KYC Application is placed, please wait for our review.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(82, 'messages.kyc.mandatory', 'base', 'Identity verification (KYC/AML) is mandatory to participate in our token sale.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(83, 'messages.kyc.forms.submitted', 'base', 'You have successfully submitted your application for identity verification.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(84, 'messages.kyc.forms.failed', 'base', 'We weren\'t able to process the application submission for identity verification. Please reload this page and fill the form again and submit. ', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(85, 'messages.kyc.forms.document', 'base', ':NAME is required, Please upload your document.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(86, 'messages.upload.success', 'base', ':what has been uploaded!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(87, 'messages.upload.warning', 'base', 'Something is wrong!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(88, 'messages.upload.invalid', 'base', 'This type of file is not supported!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(89, 'messages.upload.failed', 'base', ':what uploading failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(90, 'messages.invalid.address', 'base', 'Enter a valid wallet address.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(91, 'messages.invalid.address_is', 'base', 'Enter a valid :is wallet address.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(92, 'messages.invalid.social', 'base', 'Sorry, Social login is not available now.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(93, 'messages.mail.send', 'base', 'Email has been send successfully.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(94, 'messages.mail.failed', 'base', 'Failed to send email.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(95, 'messages.mail.issues', 'base', 'Unable to send email! Please check your mail setting credential.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(96, 'messages.wallet.change', 'base', 'Wallet address change request submitted.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(97, 'messages.wallet.cancel', 'base', 'Wallet address change request is canceled.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(98, 'messages.wallet.approved', 'base', 'Wallet address change request is approved.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(99, 'messages.wallet.failed', 'base', 'Wallet address change request is failed.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(100, 'messages.ico_not_setup', 'base', 'ICO Sales opening soon, Please check after sometimes.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(101, 'messages.demo_payment_note', 'base', 'All the <span class=\"badge badge-xs badge-purple ucap\">Add-ons</span> type payment modules is NOT part of main product. You\'ve to purchase separately from CodeCanyon to get those. <strong><a href=\"https://codecanyon.net/user/softnio/portfolio\" target=\"_blank\">Check out here</a></strong>.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(102, 'messages.demo_user', 'base', 'Your action can\'t perform as you login with a Demo Account. For full-access, please send an email at info@softnio.com.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(103, 'messages.demo_preview', 'base', 'You can\'t perform this action as this is preview purpose.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(104, 'messages.stage_update', 'base', 'Successfully :status the stage!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(105, 'messages.stage_move', 'base', 'The stage has been :status successfully!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(106, 'messages.stage_not_found', 'base', 'Stage not found!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(107, 'messages.pending_stage_delete', 'base', 'This stage can\'t be deleted as it has pending transactions.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(108, 'messages.payment_method_update', 'base', 'Payment method :status', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(109, 'messages.required_app', 'base', 'The :what payment module required minimum :version version of application. Please update your core application to latest version.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(110, 'messages.permission', 'base', 'You do not have enough permissions to perform requested operation.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(111, 'messages.unable_proceed', 'base', 'Unable to proceed request!', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(112, 'messages.transfer.wrong', 'base', 'Something is wrong, please try again later!', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(113, 'messages.transfer.request_submitted', 'base', 'Your request successfully submitted and waiting for our team approval.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(114, 'messages.transfer.balance_insufficient', 'base', 'You balance is insufficient for send token.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(115, 'messages.transfer.can_not_send_token', 'base', 'You can not send your token to your own account.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(116, 'messages.transfer.invalid_email_address', 'base', 'Sorry! your provided email address is invalid or not associated with our platform.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(117, 'messages.transfer.send_maximum_amount', 'base', 'You can send maximum :amount :symbol at once.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(118, 'messages.transfer.minimum_amount_required', 'base', 'Minimum :amount :symbol required to send.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(119, 'messages.transfer.invalid_transaction', 'base', 'Invalid transaction or not found!', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(120, 'messages.transfer.transaction_approved', 'base', 'Transaction approved successfully.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(121, 'messages.transfer.account_not_found', 'base', 'The receiver account not found.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(122, 'messages.transfer.transaction_rejected', 'base', 'Transaction has been rejected.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(123, 'messages.transfer.transaction_already', 'base', 'Transaction already :status.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(124, 'messages.withdraw.approved', 'base', 'Withdraw transaction has been approved successfully.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(125, 'messages.withdraw.rejected', 'base', 'Withdraw transaction has been rejected.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(126, 'messages.withdraw.deleted', 'base', 'Withdraw transaction has been deleted.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(127, 'messages.withdraw.already_approved', 'base', 'Withdraw transaction has been already approved.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(128, 'messages.withdraw.canceled', 'base', 'Withdraw transaction has been canceled.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(129, 'messages.withdraw.unable_delete', 'base', 'Unable delete the withdraw transaction.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(130, 'messages.withdraw.successfully_placed_progress', 'base', 'Your withdrawal has been successfully placed. You can see its progress on this withdrawal page.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(131, 'messages.withdraw.wrong', 'base', 'Something is wrong! Unable to process your request.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(132, 'messages.withdraw.insufficient_balance', 'base', 'You balance is insufficient for a withdrawal.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(133, 'messages.withdraw.withdraw_maximum', 'base', 'You can withdraw maximum :amount :symbol at once.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(134, 'messages.withdraw.minimum_required', 'base', 'Minimum :amount :symbol required to withdraw.', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(135, 'messages.cancel_order', 'base', 'Do you really cancel your order?', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(136, 'messages.unable_process', 'base', 'Unable process request!', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(137, 'messages.sure', 'base', 'Are you sure?', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(138, 'messages.unable_perform', 'base', 'Unable to perform!', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(139, 'messages.use_modern_browser', 'base', 'Please use a modern browser to properly view this template!', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(140, 'messages.copied_to_clipboard', 'base', 'Copied to Clipboard', 'messages, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(141, 'messages.active.success', 'base', ':what has been activated.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(142, 'messages.active.failed', 'base', ':what active has been failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(143, 'messages.inactive.success', 'base', ':what has been inactivated.', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(144, 'messages.inactive.failed', 'base', ':what inactivate has been failed!', 'messages, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(145, 'pagination.previous', 'base', '&laquo; Previous', 'pagination, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(146, 'pagination.next', 'base', 'Next &raquo;', 'pagination, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(147, 'pagination.prev', 'base', 'Prev', 'pagination, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(148, 'pagination.msg_next', 'base', 'Next', 'pagination, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(149, 'pagination.first', 'base', 'First', 'pagination, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(150, 'pagination.last', 'base', 'Last', 'pagination, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(151, 'passwords.password', 'base', 'Passwords must be at least six characters and match the confirmation.', 'passwords, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(152, 'passwords.reset', 'base', 'Your password has been reset!', 'passwords, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(153, 'passwords.sent', 'base', 'We have e-mailed your password reset link!', 'passwords, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(154, 'passwords.token', 'base', 'This password reset token is invalid.', 'passwords, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(155, 'passwords.user', 'base', 'We can\'t find a user with that e-mail address.', 'passwords, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(156, 'auth.failed', 'base', 'These credentials do not match our records.', 'auth, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(157, 'auth.throttle', 'base', 'Too many login attempts. Please try again in :seconds', 'auth, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(158, 'auth.recaptcha', 'base', 'Your request failed to complete as bot detected.', 'auth, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(159, 'auth.health.save_action', 'base', 'Please register and activate the application to perform the action.', 'auth, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(160, 'auth.health.fail', 'base', 'Invalidated-the-license-due-to-wrong-key', 'auth, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(161, 'validation.accepted', 'base', 'The :attribute must be accepted.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(162, 'validation.active_url', 'base', 'The :attribute is not a valid URL.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(163, 'validation.after', 'base', 'The :attribute must be a date after :date.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(164, 'validation.after_or_equal', 'base', 'The :attribute must be a date after or equal to :date.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(165, 'validation.alpha', 'base', 'The :attribute may only contain letters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(166, 'validation.alpha_dash', 'base', 'The :attribute may only contain letters, numbers, dashes and underscores.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(167, 'validation.alpha_num', 'base', 'The :attribute may only contain letters and numbers.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(168, 'validation.array', 'base', 'The :attribute must be an array.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(169, 'validation.before', 'base', 'The :attribute must be a date before :date.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(170, 'validation.before_or_equal', 'base', 'The :attribute must be a date before or equal to :date.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(171, 'validation.between.numeric', 'base', 'The :attribute must be between :min and :max.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(172, 'validation.between.file', 'base', 'The :attribute must be between :min and :max kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(173, 'validation.between.string', 'base', 'The :attribute must be between :min and :max characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(174, 'validation.between.array', 'base', 'The :attribute must have between :min and :max items.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(175, 'validation.boolean', 'base', 'The :attribute field must be true or false.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(176, 'validation.confirmed', 'base', 'The :attribute confirmation does not match.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(177, 'validation.date', 'base', 'The :attribute is not a valid date.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(178, 'validation.date_equals', 'base', 'The :attribute must be a date equal to :date.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(179, 'validation.date_format', 'base', 'The :attribute does not match the format :format.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(180, 'validation.different', 'base', 'The :attribute and :other must be different.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(181, 'validation.digits', 'base', 'The :attribute must be :digits digits.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(182, 'validation.digits_between', 'base', 'The :attribute must be between :min and :max digits.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(183, 'validation.dimensions', 'base', 'The :attribute has invalid image dimensions.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(184, 'validation.distinct', 'base', 'The :attribute field has a duplicate value.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(185, 'validation.email', 'base', 'The :attribute must be a valid email address.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(186, 'validation.exists', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(187, 'validation.file', 'base', 'The :attribute must be a file.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(188, 'validation.filled', 'base', 'The :attribute field must have a value.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(189, 'validation.gt.numeric', 'base', 'The :attribute must be greater than :value.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(190, 'validation.gt.file', 'base', 'The :attribute must be greater than :value kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(191, 'validation.gt.string', 'base', 'The :attribute must be greater than :value characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(192, 'validation.gt.array', 'base', 'The :attribute must have more than :value items.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(193, 'validation.gte.numeric', 'base', 'The :attribute must be greater than or equal :value.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(194, 'validation.gte.file', 'base', 'The :attribute must be greater than or equal :value kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(195, 'validation.gte.string', 'base', 'The :attribute must be greater than or equal :value characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(196, 'validation.gte.array', 'base', 'The :attribute must have :value items or more.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(197, 'validation.image', 'base', 'The :attribute must be an image.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(198, 'validation.in', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(199, 'validation.in_array', 'base', 'The :attribute field does not exist in :other.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(200, 'validation.integer', 'base', 'The :attribute must be an integer.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(201, 'validation.ip', 'base', 'The :attribute must be a valid IP address.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(202, 'validation.ipv4', 'base', 'The :attribute must be a valid IPv4 address.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(203, 'validation.ipv6', 'base', 'The :attribute must be a valid IPv6 address.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(204, 'validation.json', 'base', 'The :attribute must be a valid JSON string.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(205, 'validation.lt.numeric', 'base', 'The :attribute must be less than :value.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(206, 'validation.lt.file', 'base', 'The :attribute must be less than :value kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(207, 'validation.lt.string', 'base', 'The :attribute must be less than :value characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(208, 'validation.lt.array', 'base', 'The :attribute must have less than :value items.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(209, 'validation.lte.numeric', 'base', 'The :attribute must be less than or equal :value.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(210, 'validation.lte.file', 'base', 'The :attribute must be less than or equal :value kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(211, 'validation.lte.string', 'base', 'The :attribute must be less than or equal :value characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(212, 'validation.lte.array', 'base', 'The :attribute must not have more than :value items.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(213, 'validation.max.numeric', 'base', 'The :attribute may not be greater than :max.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(214, 'validation.max.file', 'base', 'The :attribute may not be greater than :max kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(215, 'validation.max.string', 'base', 'The :attribute may not be greater than :max characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(216, 'validation.max.array', 'base', 'The :attribute may not have more than :max items.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(217, 'validation.mimes', 'base', 'The :attribute must be a file of type: :values.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(218, 'validation.mimetypes', 'base', 'The :attribute must be a file of type: :values.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(219, 'validation.min.numeric', 'base', 'The :attribute must be at least :min.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(220, 'validation.min.file', 'base', 'The :attribute must be at least :min kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(221, 'validation.min.string', 'base', 'The :attribute must be at least :min characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(222, 'validation.min.array', 'base', 'The :attribute must have at least :min items.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(223, 'validation.not_in', 'base', 'The selected :attribute is invalid.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(224, 'validation.not_regex', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(225, 'validation.numeric', 'base', 'The :attribute must be a number.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(226, 'validation.present', 'base', 'The :attribute field must be present.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(227, 'validation.regex', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(228, 'validation.required', 'base', 'The :attribute field is required.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(229, 'validation.required_if', 'base', 'The :attribute field is required when :other is :value.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(230, 'validation.required_unless', 'base', 'The :attribute field is required unless :other is in :values.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(231, 'validation.required_with', 'base', 'The :attribute field is required when :values is present.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(232, 'validation.required_with_all', 'base', 'The :attribute field is required when :values are present.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(233, 'validation.required_without', 'base', 'The :attribute field is required when :values is not present.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(234, 'validation.required_without_all', 'base', 'The :attribute field is required when none of :values are present.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(235, 'validation.same', 'base', 'The :attribute and :other must match.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(236, 'validation.size.numeric', 'base', 'The :attribute must be :size.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(237, 'validation.size.file', 'base', 'The :attribute must be :size kilobytes.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(238, 'validation.size.string', 'base', 'The :attribute must be :size characters.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(239, 'validation.size.array', 'base', 'The :attribute must contain :size items.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(240, 'validation.starts_with', 'base', 'The :attribute must start with one of the following: :values', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(241, 'validation.string', 'base', 'The :attribute must be a string.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(242, 'validation.timezone', 'base', 'The :attribute must be a valid zone.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(243, 'validation.unique', 'base', 'The :attribute has already been taken.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(244, 'validation.uploaded', 'base', 'The :attribute failed to upload.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(245, 'validation.url', 'base', 'The :attribute format is invalid.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(246, 'validation.uuid', 'base', 'The :attribute must be a valid UUID.', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(247, 'validation.custom.attribute-name.rule-name', 'base', 'custom-message', 'validation, global', 'system', 'any', 1, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(248, 'validation.only.required', 'base', 'Required.', 'validation, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(249, 'validation.min.char', 'base', 'At least :num chars.', 'validation, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(250, 'validation.max.char', 'base', 'Maximum :num chars.', 'validation, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(251, 'validation.same.value', 'base', 'Enter the same value.', 'validation, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(252, 'validation.email.valid', 'base', 'Enter valid email.', 'validation, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(253, 'validation.issue', 'base', 'Currently we are facing some technical issue, please try again after sometime.', 'validation, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(254, 'auth.signin', 'base', 'Sign-in', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(255, 'auth.sign_in_btn', 'base', 'Sign In', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(256, 'auth.sign_in', 'base', 'Sign in', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(257, 'auth.with_your', 'base', 'with your', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(258, 'auth.account', 'base', 'Account', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(259, 'auth.your_email', 'base', 'Your Email', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(260, 'auth.password', 'base', 'Password', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(261, 'auth.remember_me', 'base', 'Remember Me', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(262, 'auth.forgot_password', 'base', 'Forgot password?', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(263, 'auth.no_account', 'base', 'Don’t have an account?', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(264, 'auth.sign_with', 'base', 'Or Sign in with', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(265, 'auth.facebook', 'base', 'Facebook', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(266, 'auth.google', 'base', 'Google', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(267, 'auth.sign_here', 'base', 'Sign up here', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(268, 'auth.welcome', 'base', 'Welcome!', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(269, 'auth.logout', 'base', 'Logout', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(270, 'auth.sign_up', 'base', 'Sign up', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(271, 'auth.create_new', 'base', 'Create New', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(272, 'auth.email_verified', 'base', 'Email Verified', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(273, 'auth.resend_email', 'base', 'Resend Email', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(274, 'auth.verify_your_email', 'base', 'Verify Your Email', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(275, 'auth.set_admin_account', 'base', 'Please setup admin account.', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(276, 'auth.repeat_password', 'base', 'Repeat Password', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(277, 'auth.reset_password', 'base', 'Reset password', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(278, 'auth.forgot_password_note', 'base', 'If you forgot your password, well, then we\'ll email you instructions to reset your password.', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(279, 'auth.your_email_address', 'base', 'Your Email Address', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(280, 'auth.your_name', 'base', 'Your Name', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(281, 'auth.your_full_name', 'base', 'Your Full Name', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(282, 'auth.your_mobile', 'base', 'Your Mobile Number', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(283, 'auth.enter_full_name', 'base', 'Enter Full Name', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(284, 'auth.enter_email_address', 'base', 'Enter Email Address', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(285, 'auth.enter_mobile', 'base', 'Enter Mobile Number', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(286, 'auth.enter_password', 'base', 'Enter Password', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(287, 'auth.reset_link', 'base', 'Send Reset Link', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(288, 'auth.return_login', 'base', 'Return to login', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(289, 'auth.agree', 'base', 'I agree to the', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(290, 'auth.agree_and', 'base', 'and', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(291, 'auth.agree_terms', 'base', 'By registering you agree to the terms and conditions.', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(292, 'auth.agree_confirm', 'base', 'You should accept our terms and policy.', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(293, 'auth.create_account', 'base', 'Create Account', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(294, 'auth.already_account', 'base', 'Already have an account ?', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(295, 'auth.sign_instead', 'base', 'Sign in instead', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(296, 'auth.verify_email', 'base', 'Please verify your email address.', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(297, 'auth.cancel_signup', 'base', 'Cancel Signup', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(298, 'auth.sign_out', 'base', 'Sign Out', 'auth, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13');
INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(299, 'auth.social_private_sale_not_registered', 'base', 'You have not registered yet in our platform.', 'auth', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(300, 'dashboard.main_site', 'base', 'Main Site', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(301, 'dashboard.title_user_dashboard', 'base', 'User Dashboard', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(302, 'dashboard.title_user_transactions', 'base', 'User Transactions', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(303, 'dashboard.title_user_account', 'base', 'User Account', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(304, 'dashboard.title_user_token', 'base', ':symbol Token Balance', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(305, 'dashboard.title_token', 'base', 'My Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(306, 'dashboard.title_kyc', 'base', 'KYC Application', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(307, 'dashboard.title_dashboard', 'base', 'Dashboard', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(308, 'dashboard.title_transactions', 'base', 'Transactions', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(309, 'dashboard.title_profile', 'base', 'Profile', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(310, 'dashboard.kyc_details', 'base', 'User KYC Details', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(311, 'dashboard.id_verification', 'base', 'Begin ID-Verification', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(312, 'dashboard.buy_token', 'base', 'Buy Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(313, 'dashboard.current_price', 'base', 'Current Price', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(314, 'dashboard.buy_token_now', 'base', 'Buy Token Now', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(315, 'dashboard.kyc_approved', 'base', 'KYC Approved', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(316, 'dashboard.kyc_application', 'base', 'KYC Application', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(317, 'dashboard.kyc_pending', 'base', 'KYC Pending', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(318, 'dashboard.submit_kyc', 'base', 'Submit KYC', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(319, 'dashboard.your_contribution_in', 'base', 'Your Contribution in', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(320, 'dashboard.token_balance', 'base', 'Token Balance', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(321, 'dashboard.token_name', 'base', 'Token Name', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(322, 'dashboard.token_symbol', 'base', 'Token Symbol', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(323, 'dashboard.white_paper', 'base', 'White Paper', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(324, 'dashboard.contact_support', 'base', 'Contact Support', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(325, 'dashboard.my_profile', 'base', 'My Profile', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(326, 'dashboard.referral', 'base', 'Referral', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(327, 'dashboard.referral_url', 'base', 'Referral URL', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(328, 'dashboard.referral_lists', 'base', 'Referral Lists', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(329, 'dashboard.activity', 'base', 'Activity', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(330, 'dashboard.download_whitepaper', 'base', 'Download Whitepaper', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(331, 'dashboard.add_wallet_befor', 'base', 'Add your wallet address before buy', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(332, 'dashboard.account_status', 'base', 'Your Account Status', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(333, 'dashboard.receiving_wallet', 'base', 'Receiving Wallet', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(334, 'dashboard.new_address', 'base', 'New address under review for approve.', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(335, 'dashboard.your_wallet', 'base', 'Add Your Wallet Address', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(336, 'dashboard.earn_with_referral', 'base', 'Earn with Referral', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(337, 'dashboard.invite_friends', 'base', 'Invite your friends & family.', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(338, 'dashboard.refer_link', 'base', 'Use above link to refer your friend and get referral bonus.', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(339, 'dashboard.contact_support_team', 'base', 'Contact our support team via email', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(340, 'dashboard.current_bonus', 'base', 'Current Bonus', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(341, 'dashboard.start_date', 'base', 'Start Date', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(342, 'dashboard.end_date', 'base', 'End Date', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(343, 'dashboard.bonus_start_in', 'base', 'The Bonus Start in', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(344, 'dashboard.bonus_end_in', 'base', 'The Bonus End in', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(345, 'dashboard.token_sales_progress', 'base', 'Token Sales Progress', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(346, 'dashboard.raised', 'base', 'Raised', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(347, 'dashboard.total', 'base', 'Total', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(348, 'dashboard.sales_end_in', 'base', 'Sales End in', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(349, 'dashboard.sales_end_at', 'base', 'Sales End at', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(350, 'dashboard.sales_start_in', 'base', 'Sales Start in', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(351, 'dashboard.sales_start_at', 'base', 'Sales Start at', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(352, 'dashboard.raised_amount', 'base', 'Raised Amount', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(353, 'dashboard.total_token', 'base', 'Total Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(354, 'dashboard.hard_cap', 'base', 'Hard Cap', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(355, 'dashboard.hardcap', 'base', 'Hardcap', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(356, 'dashboard.soft_cap', 'base', 'Soft Cap', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(357, 'dashboard.softcap', 'base', 'Softcap', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(358, 'dashboard.token_sales_finished', 'base', 'Our token sales has been finished. Thank you very much for your contribution.', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(359, 'dashboard.view_transaction', 'base', 'View Transaction', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(360, 'dashboard.tranx_types', 'base', 'Types', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(361, 'dashboard.tranx_type', 'base', 'Type', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(362, 'dashboard.purchased_title', 'base', 'Purchased', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(363, 'dashboard.user_name', 'base', 'User Name', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(364, 'dashboard.title_note', 'base', 'Note:', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(365, 'dashboard.title_details', 'base', 'Details', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(366, 'dashboard.oops', 'base', 'Oops!!!', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(367, 'dashboard.token_title', 'base', 'My :symbol Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(368, 'dashboard.buy_more', 'base', 'Buy More Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(369, 'dashboard.equivalent_to', 'base', 'Equivalent to', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(370, 'dashboard.total_token_amount', 'base', 'Total Token Amount', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(371, 'dashboard.purchased_token', 'base', 'Purchased Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(372, 'dashboard.referral_token', 'base', 'Referral Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(373, 'dashboard.bonuses_token', 'base', 'Bonuses Token', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(374, 'dashboard.total_contributed', 'base', 'Total Contributed', 'dashboard, global', 'system', 'any', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(375, 'profile.profile_details', 'base', 'Profile Details', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(376, 'profile.email_confirm', 'base', 'Your password will only change after your confirmation by email.', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(377, 'profile.personal_data', 'base', 'Personal Data', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(378, 'profile.settings', 'base', 'Settings', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(379, 'profile.full_name', 'base', 'Full Name', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(380, 'profile.email_address', 'base', 'Email Address', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(381, 'profile.mobile_number', 'base', 'Mobile Number', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(382, 'profile.date_of_birth', 'base', 'Date of Birth', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(383, 'profile.nationality', 'base', 'Nationality', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(384, 'profile.select_country', 'base', 'Select Country', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(385, 'profile.update_profile', 'base', 'Update Profile', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(386, 'profile.security_settings', 'base', 'Security Settings', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(387, 'profile.save_activities_log', 'base', 'Save my activities log', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(388, 'profile.confirm_email', 'base', 'Confirm me through email before password change', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(389, 'profile.manage_notification', 'base', 'Manage Notification', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(390, 'profile.resumption_notify', 'base', 'Notify me by email about resumption of sales', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(391, 'profile.sales_notify', 'base', 'Notify me by email about sales and latest news', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(392, 'profile.unusual_activity', 'base', 'Alert me by email in case of unusual activity in my account', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(393, 'profile.update', 'base', 'Update', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(394, 'profile.old_password', 'base', 'Old Password', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(395, 'profile.new_password', 'base', 'New Password', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(396, 'profile.confirm_password', 'base', 'Confirm New Password', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(397, 'profile.min_6_digit', 'base', 'Password should be a minimum of 6 digits and include lower and uppercase letter.', 'user_profile, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(398, 'profile.activitiy_log', 'base', 'Account Activities Log', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(399, 'profile.activitiy_clear', 'base', 'Clear All', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(400, 'profile.activitiy_note', 'base', 'Here is your recent activities. You can clear this log as well as disable the feature from profile settings tabs.', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(401, 'profile.activitiy_date', 'base', 'Date', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(402, 'profile.activitiy_device', 'base', 'Device', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(403, 'profile.activitiy_browser', 'base', 'Browser', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(404, 'profile.activitiy_ip', 'base', 'IP', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(405, 'profile.activitiy_delete_log', 'base', 'Once Delete, You will not get back this log in future!', 'user_profile, user_activity, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(406, 'profile.tranx_list', 'base', 'Transactions list', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(407, 'profile.tranx_amount', 'base', 'Amount', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(408, 'profile.tranx_from', 'base', 'From', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(409, 'profile.tranx_to', 'base', 'To', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(410, 'profile.tranx_pay', 'base', 'Pay', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(411, 'profile.token_types', 'base', 'Token Types', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(412, 'profile.tokens', 'base', 'Tokens', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(413, 'profile.tranx_no', 'base', 'Tranx NO', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(414, 'profile.no_data', 'base', 'No data available in table', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(415, 'profile.no_records', 'base', 'No records', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(416, 'profile.search_placeholder', 'base', 'Type in to Search', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(417, 'profile.cap_types', 'base', 'TYPES', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(418, 'profile.any_type', 'base', 'Any Type', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(419, 'profile.purchase', 'base', 'Purchase', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(420, 'profile.cap_status', 'base', 'STATUS', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(421, 'profile.cap_show_all', 'base', 'Show All', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(422, 'profile.approved', 'base', 'Approved', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(423, 'profile.pending', 'base', 'Pending', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(424, 'profile.canceled', 'base', 'Canceled', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(425, 'profile.status', 'base', 'Status', 'user_profile, user_transaction', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(426, 'kyc.verify_title', 'base', 'KYC Verification', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(427, 'kyc.verify_title_sub', 'base', 'To comply with regulations each participant is required to go through identity verification (KYC/AML) to prevent fraud, money laundering operations, transactions banned under the sanctions regime or those which fund terrorism. Please, complete our fast and secure verification process to participate in token offerings.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(428, 'kyc.identity_title', 'base', 'Identity Verification - KYC', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(429, 'kyc.identity_desc', 'base', 'To comply with regulation, participant will have to go through identity verification.', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(430, 'kyc.form_not_submitted', 'base', 'You have not submitted your necessary documents to verify your identity.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(431, 'kyc.form_submit', 'base', 'It would great if you please submit the form. If you have any question, please feel free to contact our support team.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(432, 'kyc.complete_kyc', 'base', 'Click here to complete your KYC', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(433, 'kyc.completed_kyc', 'base', 'You have completed the process of KYC', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(434, 'kyc.waiting_id_verify', 'base', 'We are still waiting for your identity verification. Once our team verified your identity, you will be notified by email. You can also check your KYC compliance status from your profile page.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(435, 'kyc.back_to_profile', 'base', 'Back to Profile', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(436, 'kyc.under_process', 'base', 'Your application verification under process.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(437, 'kyc.still_working', 'base', 'We are still working on your identity verification. Once our team verified your identity, you will be notified by email.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(438, 'kyc.resubmit_form', 'base', 'In our verification process, we found information that is incorrect or missing. Please resubmit the form. In case of any issues with the submission please contact our support team.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(439, 'kyc.submit_again', 'base', 'Submit Again', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(440, 'kyc.verified_title', 'base', 'Your identity verified successfully.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(441, 'kyc.verified_desc', 'base', 'One of our team members verified your identity. Now you can participate in our token sale. Thank you.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(442, 'kyc.info_missing', 'base', 'We found some information to be missing.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(443, 'kyc.form_rejected', 'base', 'Sorry! Your application was rejected.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(444, 'kyc.verify_head', 'base', 'Begin your ID-Verification', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(445, 'kyc.verify_text', 'base', 'In order to purchase our tokens, please verify your identity.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(446, 'kyc.verify_text_token', 'base', 'Verify your identity to participate in token sale.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(447, 'kyc.not_submitted', 'base', 'You have not submitted your documents to verify your identity (KYC).', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(448, 'kyc.click_proceed', 'base', 'Click to Proceed', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(449, 'kyc.document_received', 'base', 'We have received your document.', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(450, 'kyc.review_information', 'base', 'We will review your information and if all is in order will approve your identity. You will be notified by email once we verified your identity (KYC).', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(451, 'kyc.kyc_rejected', 'base', 'KYC Application has been rejected!', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(452, 'kyc.resubmit_application', 'base', 'We were having difficulties verifying your identity. In our verification process, we found information are incorrect or missing. Please re-submit the application again and verify your identity.', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(453, 'kyc.resubmit', 'base', 'Resubmit', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(454, 'kyc.kyc_verified', 'base', 'Identity (KYC) has been verified.', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(455, 'kyc.token_sale', 'base', 'One for our team verified your identity. You are eligible to participate in our token sale.', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(456, 'kyc.purchase_token', 'base', 'Purchase Token', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(457, 'kyc.kyc_verification_required', 'base', 'KYC verification required for purchase token', 'dashboard, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(458, 'profile.change_email_title', 'base', 'Change Email', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(459, 'profile.verify_email_address_title', 'base', 'Verify Email Address', 'user_profile, dashboard', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(460, 'profile.change_email_address', 'base', 'Your current email is :email. If you want to change it, a verification link will be sent to your new requested email. Once verified, your email will update accordingly.', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(461, 'profile.change_new_email', 'base', 'Your current email is :email, but there\'s a pending email change request to :new_email awaiting verification. Simply verify the new email to update your email.', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(462, 'profile.verify_email_address', 'base', 'Please verify your email :email as it has not been verified yet.', 'user_profile, dashboard', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(463, 'Profile.resend_verification_text', 'base', 'Resend the verification email if you haven\'t received it.', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(464, 'Profile.resend_verification_email', 'base', 'Resend Email', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(465, 'Profile.wrong_email_text', 'base', 'If you registered with wrong email address, change it now.', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(466, 'Profile.new_email_placeholder', 'base', 'Enter new email', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(467, 'Profile.change_email', 'base', 'Change Email', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(468, 'Profile.email_not_sent_warning', 'base', 'If you don\'t verify your email, you may not receive any email from us. To ensure account access, please verify your email.', 'user_profile', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(469, 'kyc.form.personal_details', 'base', 'Personal Details', 'kyc, kyc_form, global', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(470, 'kyc.form.personal_details_sub', 'base', 'Your basic personal information is required for identification purposes.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(471, 'kyc.form.personal_details_note', 'base', 'Please type carefully and fill out the form with your personal details. You are not allowed to edit the details once you have submitted the application.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(472, 'kyc.form.first_name', 'base', 'First Name', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(473, 'kyc.form.last_name', 'base', 'Last Name', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(474, 'kyc.form.phone_number', 'base', 'Phone Number', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(475, 'kyc.form.gender', 'base', 'Gender', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(476, 'kyc.form.select_gender', 'base', 'Select Gender', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(477, 'kyc.form.male', 'base', 'Male', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(478, 'kyc.form.female', 'base', 'Female', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(479, 'kyc.form.other', 'base', 'Other', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(480, 'kyc.form.telegram_username', 'base', 'Telegram Username', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(481, 'kyc.form.your_address', 'base', 'Your Address', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:13', '2024-10-08 10:07:13'),
(482, 'kyc.form.country', 'base', 'Country', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(483, 'kyc.form.state', 'base', 'State', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(484, 'kyc.form.city', 'base', 'City', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(485, 'kyc.form.postal_code', 'base', 'Zip / Postal Code', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(486, 'kyc.form.address_line_1', 'base', 'Address Line 1', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(487, 'kyc.form.address_line_2', 'base', 'Address Line 2', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(488, 'kyc.form.document_upload', 'base', 'Document Upload', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(489, 'kyc.form.scan_documents', 'base', 'To verify your identity, we ask you to upload high-quality scans or photos of your official identification documents issued by the government.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(490, 'kyc.form.upload_documents', 'base', 'In order to complete, please upload any of the following personal documents.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(491, 'kyc.form.passport', 'base', 'Passport', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(492, 'kyc.form.national_id_card', 'base', 'National ID Card', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(493, 'kyc.form.driver_license', 'base', 'Driver’s License', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(494, 'kyc.form.check_requirements', 'base', 'To avoid delays with verification process, please double-check to ensure the below requirements are fully met:', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(495, 'kyc.form.visible_documents', 'base', 'Document should be in good condition and clearly visible.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(496, 'kyc.form.no_glare', 'base', 'There is no light glare or reflections on the card.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(497, 'kyc.form.not_expire_credentials', 'base', 'Chosen credential must not be expired.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(498, 'kyc.form.file_limitation', 'base', 'File is at least 1 MB in size and has at least 300 dpi resolution.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(499, 'kyc.form.drag_and_drop_file', 'base', 'Drag and drop file', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(500, 'kyc.form.select', 'base', 'Select', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(501, 'kyc.form.or', 'base', 'or', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(502, 'kyc.form.upload_doc_copy', 'base', 'Upload Here Your :doctype Copy', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(503, 'kyc.form.nid_back_side', 'base', 'Upload Here Your National ID Back Side', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(504, 'kyc.form.photo_selfie', 'base', 'Upload a selfie as a Photo Proof while holding document in your hand', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(505, 'kyc.form.paying_wallet', 'base', 'Your Paying Wallet', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(506, 'kyc.form.paying_wallet_submit', 'base', 'Submit your wallet address that you are going to send funds', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(507, 'kyc.form.paying_wallet_note', 'base', 'DO NOT USE your exchange wallet address such as Kraken, Bitfinex, Bithumb, Binance etc.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(508, 'kyc.form.select_wallet', 'base', 'Select Wallet', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(509, 'kyc.form.enter_your_wallet', 'base', 'Enter your wallet address', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(510, 'kyc.form.your_wallet_address', 'base', 'Your personal wallet address', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(511, 'kyc.form.agree_terms', 'base', 'I have read the', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(512, 'kyc.form.agree_info', 'base', 'All the personal information I have entered is correct.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(513, 'kyc.form.agree_individual', 'base', 'I certify that, I am registering to participate in the token distribution event(s) in the capacity of an individual (and beneficial owner) and not as an agent or representative of a third party corporate entity.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(514, 'kyc.form.agree_final', 'base', 'I understand that, I can participate in the token distribution event(s) only with the wallet address that was entered in the application form.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(515, 'kyc.form.proceed', 'base', 'Proceed to Verify', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(516, 'kyc.form.confirm_terms', 'base', 'You should read our terms and policy.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(517, 'kyc.form.confirm_info', 'base', 'Confirm that all information is correct.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(518, 'kyc.form.confirm_individual', 'base', 'Certify that you are individual.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(519, 'kyc.form.confirm_final', 'base', 'Confirm that you understand.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(520, 'kyc.form.your_kyc_document', 'base', 'Your KYC Document', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(521, 'kyc.form.submited_on', 'base', 'Submited On', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(522, 'kyc.form.last_checked', 'base', 'Last Checked', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(523, 'kyc.form.not_reviewed_yet', 'base', 'Not reviewed yet', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(524, 'kyc.form.kyc_status', 'base', 'KYC Status', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(525, 'kyc.form.admin_note', 'base', 'Admin Note', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(526, 'kyc.form.personal_information', 'base', 'Personal Information', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(527, 'kyc.form.full_address', 'base', 'Full Address', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(528, 'kyc.form.country_of_residence', 'base', 'Country of Residence', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(529, 'kyc.form.uploaded_documents', 'base', 'Uploaded Documnets', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(530, 'kyc.form.document_doc', 'base', 'Document', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(531, 'kyc.form.proof', 'base', 'Proof', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(532, 'kyc.form.front_side', 'base', 'Front Side', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(533, 'kyc.form.back_side', 'base', 'Back Side', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(534, 'kyc.form.no_document_uploaded', 'base', 'No document uploaded.', 'kyc', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(535, 'buy_token.sale_start_soon', 'base', 'Our sale will start soon. Please check back at a later date/time or feel free to contact us.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(536, 'buy_token.calculate', 'base', 'Choose currency and calculate :SYMBOL token price', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(537, 'buy_token.choose_currency', 'base', 'You can buy our :SYMBOL token using the below currency choices to become part of our project.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(538, 'buy_token.amount_of_contribute', 'base', 'Amount of contribute', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(539, 'buy_token.contribute_amout', 'base', 'Enter the amount you would like to contribute in order to calculate the amount of tokens you will receive. The calculator below helps to convert the required quantity of tokens into the amount of your selected currency.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(540, 'buy_token.minimum_amount', 'base', 'Minimum contribution amount is required.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(541, 'buy_token.bonus', 'base', 'Bonus', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(542, 'buy_token.on_sale', 'base', 'On Sale', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(543, 'buy_token.sale_bonus', 'base', 'Sale Bonus', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(544, 'buy_token.amount_bonus', 'base', 'Amount Bonus', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(545, 'buy_token.exchange_note', 'base', 'Your contribution will be calculated based on exchange rate at the moment when your transaction is confirmed.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(546, 'buy_token.payment_button', 'base', 'Make Payment', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(547, 'buy_token.token_note', 'base', 'Tokens will appear in your account after payment successfully made and approved by our team. Please note that, :SYMBOL token will be distributed after the token sales end-date.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(548, 'buy_token.token_sales', 'base', 'Token Sales', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(549, 'buy_token.token_price', 'base', 'Token Price', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(550, 'buy_token.exchange_rate', 'base', 'Exchange Rate', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(551, 'buy_token.end_at', 'base', 'End at', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(552, 'buy_token.choose_method', 'base', 'You can choose any of following payment method to make your payment. The token balance will appear in your account after successful payment.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(553, 'buy_token.select_method', 'base', 'Select payment method:', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(554, 'buy_token.appear_address', 'base', 'Our payment address will appear or redirect you for payment after your order placed.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(555, 'buy_token.charge_fee', 'base', 'Payment gateway may charge you a processing fees.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(556, 'buy_token.maximum_amount_reached', 'base', 'Maximum amount reached, You can purchase maximum :amount :symbol per transaction.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(557, 'buy_token.purchase_minimum_amount', 'base', 'You must purchase minimum :amount :symbol.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(558, 'buy_token.sales_finished', 'base', 'Our sales has been finished. Thank you very much for your interest.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(559, 'buy_token.token_not_available', 'base', ':amount :symbol Token is not available.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(560, 'buy_token.available_amount', 'base', 'Available :amount :symbol only, You can purchase less than :amount :symbol Token.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(561, 'buy_token.transaction_may_deleted', 'base', 'Sorry, we\'re unable to proceed the transaction. This transaction may deleted. Please contact with administrator.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(562, 'buy_token.transaction_already_status', 'base', 'Your transaction is already :status. Sorry, we\'re unable to proceed the transaction.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(563, 'buy_token.transaction_status_check_account', 'base', 'Your transaction is already :status. Please check your account balance.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(564, 'buy_token.transaction_not_found', 'base', 'Transaction is not found!!', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(565, 'buy_token.transaction_not_valid', 'base', 'Transaction id or key is not valid!', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(566, 'buy_token.maximum_purchase', 'base', 'Maximum you can purchase :maximum_token token per contribution.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(567, 'buy_token.minimum_token', 'base', 'Enter minimum :minimum_token token and select currency!', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(568, 'buy_token.add.receive.wallet', 'base', 'Before proceed to purchase token, please add your receiving wallet address. In order to receive your token, the wallet address is mandatory.', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(569, 'buy_token.click.add.wallet', 'base', 'Click here to add wallet', 'buy_token', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(570, 'payment.order.title', 'base', 'Confirmation Your Payment', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(571, 'payment.order.cancel_title', 'base', 'Oops! Payment Canceled!', 'payment, cancel', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(572, 'payment.order.cancel_desc', 'base', 'You have canceled your payment. If you continue to have issues, please contact us with order no. :orderid.', 'payment, cancel', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(573, 'payment.order.close', 'base', 'Close', 'payment, cancel', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(574, 'payment.order.placed', 'base', 'Your Order no. :orderid has been placed successfully.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(575, 'payment.order.pending', 'base', 'Your Order no. :orderid has been placed & waiting for payment.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(576, 'payment.order.onhold', 'base', 'Your Order no. :orderid has been placed & waiting for team approval.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(577, 'payment.info.crypto_amount', 'base', 'Please send :amount :currency to the address below. The token balance will appear in your account only after transaction gets :num confirmation and approved by our team.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(578, 'payment.info.crypto_receive', 'base', 'To receiving :token :symbol token, please send :amount :currency to the address below. The token balance will appear in your account only after transaction gets :num confirmation and approved by our team.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(579, 'payment.info.bank_amount', 'base', 'Please make your payment of :amount :currency through bank to the below bank address. The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(580, 'payment.info.bank_receive', 'base', 'To receiving :token :symbol token, please make your payment of :amount :currency through bank to the below bank address. The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(581, 'payment.info.gateway_amount', 'base', 'The token balance will appear in your account only after you transaction gets :num confirmations and approved by :gateway.', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(582, 'payment.info.gateway_receive', 'base', 'To receiving :token :symbol token, please make your payment of :amount :currency through :gateway. The token balance will appear in your account after we received your payment.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(583, 'payment.info.wallet_verify', 'base', 'To speed up verification process please enter your wallet address from where you\'ll transferring your amount to our address.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(584, 'payment.info.hash_verify', 'base', 'To speed up verification process, please enter your transaction hash or payment id.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(585, 'payment.wallet_address', 'base', 'Enter Your Wallet Address', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(586, 'payment.payment_address', 'base', 'Insert your payment address', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(587, 'payment.cancel_order', 'base', 'Cancel Order', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(588, 'payment.select_method', 'base', 'Select your payment method.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(589, 'payment.note_hint', 'base', 'Do not make payment through exchange (Kraken, Bitfinex). You can use MyEtherWallet, MetaMask, Mist wallets etc.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(590, 'payment.note_alert', 'base', 'In case you send a different amount, number of :SYMBOL token will update accordingly.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(591, 'payment.note_redirect', 'base', 'Our payment address will appear or redirect you for payment after the order is placed.', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(592, 'payment.payment_process', 'base', 'Payment Process', 'payment, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(593, 'payment.payment_confirm', 'base', 'Confirm Payment', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(594, 'payment.skip_address', 'base', 'I\'ll provide wallet address later', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(595, 'payment.gas_limit', 'base', 'SET GAS LIMIT:', 'payment, offline', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(596, 'payment.gas_price', 'base', 'SET GAS PRICE:', 'payment, offline', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(597, 'payment.send_amount_to', 'base', 'Send Amount:', 'payment, order', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(598, 'payment.amount_with_bonus', 'base', 'Please make payment of :amount to receive :token_amount token including bonus :token_bonus token.', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14');
INSERT INTO `translates` (`id`, `key`, `name`, `text`, `pages`, `group`, `panel`, `load`, `created_at`, `updated_at`) VALUES
(599, 'payment.amount_no_bonus', 'base', 'Please make payment of :amount to receive :token_amount token.', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(600, 'payment.deposit_title', 'base', 'Payment Address for Deposit', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(601, 'payment.deposit_address', 'base', 'Payment to the following :Name Wallet Address', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(602, 'payment.deposit_address_or_scan', 'base', 'Payment to the following :Name Wallet Address Or scan the QR code', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(603, 'payment.scan_code', 'base', 'Scan QR code to payment.', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(604, 'payment.agree_terms', 'base', 'I hereby agree to the token purchase agreement and token sale term.', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(605, 'payment.no_method', 'base', 'Sorry! There is no payment method available for this currency. Please choose another currency or contact our support team.', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(606, 'payment.review_title', 'base', 'We\'re reviewing your payment.', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(607, 'payment.review_desc', 'base', 'We\'ll review your transaction and get back to your within 6 hours. You\'ll receive an email with the details of your contribution.', 'payment, manual', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(608, 'payment.already_paid', 'base', 'Click here if you already paid', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(609, 'payment.bellow_address', 'base', 'Make your payment to the below address', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(610, 'payment.check_status', 'base', 'Check Status', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(611, 'payment.gateway_status', 'base', 'Check status on :gateway', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(612, 'payment.send_amount', 'base', 'Please send :amount :currency to the address below.', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(613, 'payment.pay_or_cancel', 'base', 'Click the Pay button below to make payment for this transaction, or you can cancel this transaction.', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(614, 'payment.refunded_token', 'base', 'Refunded Token', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(615, 'payment.refunded_amount', 'base', 'Refunded Amount', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(616, 'payment.refund_note', 'base', 'Refund Note', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(617, 'payment.refund_stage_status', 'base', 'Refund not possible as the stage is deleted.', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(618, 'payment.we_have_received_payment', 'base', 'Thank you, we have received your payment!', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(619, 'payment.refund_not_enough_token_balance', 'base', 'This transaction cannot be refunded as user might not have enough token balance.', 'payment, online', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(620, 'payment.bank_details', 'base', 'Bank Details for Payment', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(621, 'payment.bank_note', 'base', 'The token balance will appear in your account only after your transaction gets approved by our team.', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(622, 'payment.bank_iban', 'base', 'IBAN', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(623, 'payment.bank_name', 'base', 'Bank Name', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(624, 'payment.bank_address', 'base', 'Bank Address', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(625, 'payment.bank_routing', 'base', 'Routing Number', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(626, 'payment.bank_swift', 'base', 'Swift/BIC', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(627, 'payment.bank_account_name', 'base', 'Account Name', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(628, 'payment.bank_account_number', 'base', 'Account Number', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(629, 'payment.bank_account_address', 'base', 'Account Holder Address', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(630, 'payment.bank_make_payment', 'base', 'Make Payment to the Following Bank Account', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(631, 'payment.bank_referance', 'base', 'Use this transaction id (#:orderid) as reference. Make your payment within 24 hours, If we will not received your payment within 24 hours, then we will cancel the transaction.', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(632, 'payment.pay_via', 'base', 'Pay via', 'payment, bank', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(633, 'tranx.details', 'base', 'Transaction Details', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(634, 'tranx.order_no', 'base', 'The order no. :orderid was placed on :datetime.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(635, 'tranx.successfully_paid', 'base', 'You have successfully paid this transaction', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(636, 'tranx.via', 'base', 'via', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(637, 'tranx.wallet', 'base', 'wallet', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(638, 'tranx.order_failed', 'base', 'Sorry! Your order has been :status due to payment.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(639, 'tranx.canceled_transfer_request', 'base', 'The transfer request was canceled at :time.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(640, 'tranx.under_review', 'base', 'The transaction is currently under review. We will send you an email once our review is complete.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(641, 'tranx.canceled_admin', 'base', 'The transaction was canceled by Administrator at :time.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(642, 'tranx.canceled_user', 'base', 'You have canceled this transaction.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(643, 'tranx.approved_admin', 'base', 'Transaction has been approved at :time.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(644, 'tranx.token_details', 'base', 'Token Details', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(645, 'tranx.token_of_stage', 'base', 'Token of Stage', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(646, 'tranx.token_amount', 'base', 'Token Amount (T)', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(647, 'tranx.bonus_token', 'base', 'Bonus Token (B)', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(648, 'tranx.offline_payment', 'base', 'Offline Payment', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(649, 'tranx.online_payment', 'base', 'Online Payment', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(650, 'tranx.issue_occured', 'base', 'Sorry, seems there is an issues occurred and we couldn’t process your request. Please contact us with your order no. :orderid, if you continue to having the issues.', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(651, 'tranx.total_payment', 'base', 'Total Payment', 'transaction, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(652, 'wallet.do_not_use', 'base', 'DO NOT USE your exchange wallet address OR if you don\'t have a private key of the your address. You WILL NOT receive your token and WILL LOSE YOUR FUNDS if you do.', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(653, 'wallet.erc_address', 'base', 'Address should be ERC20-compliant.', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(654, 'wallet.receive_info', 'base', 'In order to receive your :SYMBOL token, please select your wallet address and you have to put the address below input box. You will receive :SYMBOL token to this address after the token sale end.', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(655, 'wallet.current', 'base', 'Current Wallet', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(656, 'wallet.type', 'base', 'Wallet Type', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(657, 'wallet.receive_address', 'base', ':Name Wallet Address for receiving token', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(658, 'wallet.add_wallet', 'base', 'Add Wallet', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(659, 'wallet.enter_wallet', 'base', 'Enter your :Name wallet address', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(660, 'wallet.enter_new_wallet', 'base', 'Enter your new :Name wallet address', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(661, 'wallet.request', 'base', 'Request for change', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(662, 'wallet.request_update', 'base', 'Request for Update Wallet', 'user_wallet', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(663, 'status.approved', 'base', 'Approved', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(664, 'status.pending', 'base', 'Pending', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(665, 'status.progress', 'base', 'Progress', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(666, 'status.rejected', 'base', 'Rejected', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(667, 'status.warning', 'base', 'Warning', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(668, 'status.success', 'base', 'Success', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(669, 'status.running', 'base', 'Running', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(670, 'status.upcoming', 'base', 'Upcoming', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(671, 'status.completed', 'base', 'Completed', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(672, 'status.expired', 'base', 'Expired', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(673, 'status.pause', 'base', 'Pause', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(674, 'status.inactive', 'base', 'Inactive', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(675, 'status.edit', 'base', 'Edit', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(676, 'status.add', 'base', 'Add', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(677, 'status.see', 'base', 'See', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(678, 'status.more', 'base', 'More', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(679, 'status.view', 'base', 'View', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(680, 'status.enable', 'base', 'Enable', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(681, 'status.enabled', 'base', 'Enabled', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(682, 'status.disable', 'base', 'Disable', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(683, 'status.disabled', 'base', 'Disabled', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(684, 'status.proceed', 'base', 'Proceed', 'status, global', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(685, 'auth.2fa.hello', 'base', 'Hello', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(686, 'auth.2fa.title', 'base', '2FA', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(687, 'auth.2fa.reset_2fa', 'base', 'Reset 2FA', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(688, 'auth.2fa.enable_2fa', 'base', 'Enable 2FA', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(689, 'auth.2fa.confirm_2fa', 'base', 'Confirm 2FA', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(690, 'auth.2fa.disable_2fa', 'base', 'Disable 2FA', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(691, 'auth.2fa.current_status', 'base', 'Current Status:', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(692, 'auth.2fa.authentication', 'base', '2FA Authentication', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(693, 'auth.2fa.two-factor_verification', 'base', 'Two-Factor Verification', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(694, 'auth.2fa.verify_code', 'base', 'Enter the Code to verify', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(695, 'auth.2fa.reset_authentication', 'base', 'Reset 2FA Authentication', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(696, 'auth.2fa.authentication_code', 'base', 'Enter your authentication code', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(697, 'auth.2fa.google_code', 'base', 'Enter Google Authenticator Code', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(698, 'auth.2fa.auth', 'base', 'Two-factor authentication is a method for protection of your account. When it is activated you are required to enter not only your password, but also a special code. You can receive this code in mobile app. Even if third party gets access to your password, they still won\'t be able to access your account without the 2FA code.', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(699, 'auth.2fa.lost_access', 'base', 'If you lost your phone or uninstall the Google Authenticator app, then you will lost access of your account.', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(700, 'auth.2fa.step_2', 'base', 'Step 2:', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(701, 'auth.2fa.scan_qr_code', 'base', 'Scan the below QR code by your Google Authenticator app, or you can add account manually.', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(702, 'auth.2fa.manually_add_account', 'base', 'Manually add Account:', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(703, 'auth.2fa.account_name', 'base', 'Account Name:', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(704, 'auth.2fa.key', 'base', 'Key:', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(705, 'auth.2fa.verification_code', 'base', 'Enter the verification code generated by your mobile application (Google Authenticator).', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(706, 'auth.2fa.contact_us', 'base', 'If you lost your phone or Uninstall the Google Authenticator app and enable to access your account please contact with us.', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(707, 'auth.2fa.step_1', 'base', 'Step 1:', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(708, 'auth.2fa.install_this_app_from', 'base', 'Install this app from', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(709, 'auth.2fa.google_play', 'base', 'Google Play', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(710, 'auth.2fa.store_or', 'base', 'store or', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(711, 'auth.2fa.app_store', 'base', 'App Store', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(712, 'auth.2fa.reset_auth', 'base', 'Please enter your account password to reset 2FA authentication.', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(713, 'auth.2fa.invalid', 'base', 'You have provide a invalid 2FA authentication code!', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(714, 'auth.2fa.wrong', 'base', 'Please enter a valid authentication code!', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(715, 'auth.2fa.enabled', 'base', 'Successfully enable 2FA security in your account.', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(716, 'auth.2fa.disabled', 'base', 'Successfully disable 2FA security in your account.', 'user_2fa', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(717, 'transfer.send_token_friend', 'base', 'Send Token to Your Friend', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(718, 'transfer.available_token_balance', 'base', 'Available Token Balance:', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(719, 'transfer.receiver_email', 'base', 'Receiver/Friend Email', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(720, 'transfer.enter_receiver_email', 'base', 'Enter receiver email', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(721, 'transfer.enter_valid_email_address', 'base', 'Enter a valid email address, which is associated with our platform.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(722, 'transfer.enter_token_number', 'base', 'Enter token number', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(723, 'transfer.minimum_send', 'base', 'Minimum Send: :amount :symbol', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(724, 'transfer.you_do_not_have_token', 'base', 'You do not have enough token to send.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(725, 'transfer.you_can_not_send_token_now', 'base', 'You can not send token right now.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(726, 'transfer.enter_number_of_token', 'base', 'Enter number of token you would like to send.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(727, 'transfer.please_enter_minimum', 'base', 'Please enter minimum number of token.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(728, 'transfer.before_clicking_proceed', 'base', 'Before clicking the &quot;Proceed&quot; button, be sure that you want to send token. You can not cancel the request once you proceed.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(729, 'transfer.can_not_send_token_to_friend', 'base', 'Sorry! right now you can not send token to your friend account. Please contact us if you have any question.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(730, 'transfer.invite_your_friend_send_token', 'base', 'You can invite your friend to join our platform and also you can send your token to your friend using his email address.', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(731, 'transfer.see_transactions', 'base', 'See Transactions', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(732, 'transfer.send_token', 'base', 'Send Token', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(733, 'transfer.token_send_to', 'base', 'Token Send To', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(734, 'transfer.token_receive_from', 'base', 'Token Receive From', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(735, 'transfer.transfered_tokens', 'base', 'Transfered Tokens', 'transfer, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(736, 'withdraw.withdrawal', 'base', 'Withdrawal', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(737, 'withdraw.withdraw_wallet', 'base', 'Withdraw Wallet', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(738, 'withdraw.reference_hash', 'base', 'Reference Hash', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(739, 'withdraw.Wwithdraw_details', 'base', 'Withdraw Details', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(740, 'withdraw.request_at', 'base', 'Request At', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(741, 'withdraw.notes', 'base', 'Notes', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(742, 'withdraw.received_withdraw_request', 'base', 'We have received your withdraw request and our team will proceed shortly. We will send you an email once we have completed your withdraw.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(743, 'withdraw.withdraw_transaction', 'base', 'Withdraw transaction has been :status at :time.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(744, 'withdraw.canceled_withdraw_request', 'base', 'You have canceled the withdraw request.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(745, 'withdraw.token', 'base', 'Withdraw Token', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(746, 'withdraw.amount', 'base', 'Withdraw Amount (:TOKEN)', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(747, 'withdraw.minimum', 'base', 'Minimum Withdraw:', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(748, 'withdraw.choose_coin', 'base', 'Choose Coin', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(749, 'withdraw.on_same', 'base', 'Withdraw will be on same.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(750, 'withdraw.receiving_wallet_address', 'base', 'Wallet Address for Receiving', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(751, 'withdraw.your_wallet_address', 'base', 'Your wallet address', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(752, 'withdraw.provide_valid_wallet_address', 'base', 'Provide a valid wallet address for withdraw your token.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(753, 'withdraw.your_will_get', 'base', 'You will Get:', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(754, 'withdraw.withdraw', 'base', 'Withdraw', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(755, 'withdraw.do_not_have_token_to_withdraw', 'base', 'You do not have enough token to withdraw.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(756, 'withdraw.can_not_withdraw', 'base', 'You can not withdraw right now.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(757, 'see_', 'base', 'Withdraw History', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(758, 'withdraw.id', 'base', 'Withdraw ID', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(759, 'withdraw.wallet', 'base', 'Wallet Address', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(760, 'withdraw.information', 'base', 'Information', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(761, 'withdraw.enter_wallet', 'base', 'Enter your wallet address for withdraw.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(762, 'withdraw.can_not_withdraw_token', 'base', 'Sorry! right now you can not withdraw token. Please contact us if you have any question.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(763, 'withdraw.withdraw_funds_process', 'base', 'You can withdraw the your funds and we will process soon.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(764, 'withdraw.withdraw_your_token', 'base', 'Withdraw Your Token', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(765, 'withdraw.withdraw_your_token_any_time', 'base', 'You can withdraw your token any time, we will processed withing 24 hours after your withdraw request.', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(766, 'withdraw.see_history', 'base', 'See Withdraw History', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(767, 'withdraw.tokens_withdraw', 'base', 'Tokens Withdraw', 'withdraw, transaction', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(768, 'referral.referee', 'base', 'Referee', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(769, 'referral.earn_token', 'base', 'Earn Token', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(770, 'referral.bought_token', 'base', 'Bought Token', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(771, 'referral.register_date', 'base', 'Register Date', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(772, 'referral.no_one_join_yet!', 'base', 'No one join yet!', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(773, 'referral.not_purchased', 'base', 'Not purchased yet', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(774, 'referral.token_purchase', 'base', 'Token purchase by', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(775, 'referral.referred_by', 'base', 'You are referred by', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(776, 'referral.received_token', 'base', 'You have received bonus token.', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(777, 'referral.refered_by', 'base', 'Your were invited by :userid', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(778, 'referral.referral_id_invalid_msg', 'base', 'This referral code is invalid. If you don\'t have a valid code, you can also register by keeping this field empty.', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14'),
(779, 'referral.valid_code_required', 'base', 'A valid referral code is required.', 'referral', 'system', 'user', 0, '2024-10-08 10:07:14', '2024-10-08 10:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `registerMethod` varchar(191) DEFAULT 'Email',
  `social_id` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `dateOfBirth` varchar(191) DEFAULT NULL,
  `nationality` varchar(191) DEFAULT NULL,
  `lastLogin` datetime NOT NULL,
  `walletType` varchar(191) DEFAULT NULL,
  `walletAddress` varchar(191) DEFAULT NULL,
  `role` enum('admin','manager','user') NOT NULL DEFAULT 'user',
  `contributed` double DEFAULT NULL,
  `tokenBalance` double DEFAULT NULL,
  `distAmount` double DEFAULT NULL,
  `referral` varchar(191) DEFAULT NULL,
  `referralInfo` text,
  `google2fa` int(11) NOT NULL DEFAULT '0',
  `google2fa_secret` text,
  `type` enum('demo','main') NOT NULL DEFAULT 'main',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_metas`
--

CREATE TABLE `user_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `notify_admin` int(11) NOT NULL DEFAULT '0',
  `newsletter` int(11) NOT NULL DEFAULT '1',
  `unusual` int(11) NOT NULL DEFAULT '1',
  `save_activity` varchar(191) NOT NULL DEFAULT 'TRUE',
  `pwd_chng` varchar(191) NOT NULL DEFAULT 'TRUE',
  `pwd_temp` varchar(191) DEFAULT NULL,
  `email_expire` datetime DEFAULT NULL,
  `email_token` varchar(220) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`);

--
-- Indexes for table `global_metas`
--
ALTER TABLE `global_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ico_metas`
--
ALTER TABLE `ico_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ico_stages`
--
ALTER TABLE `ico_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_payment_method_unique` (`payment_method`);

--
-- Indexes for table `private_invitations`
--
ALTER TABLE `private_invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translates`
--
ALTER TABLE `translates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_metas`
--
ALTER TABLE `user_metas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `global_metas`
--
ALTER TABLE `global_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ico_metas`
--
ALTER TABLE `ico_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ico_stages`
--
ALTER TABLE `ico_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `private_invitations`
--
ALTER TABLE `private_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translates`
--
ALTER TABLE `translates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=780;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_metas`
--
ALTER TABLE `user_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
