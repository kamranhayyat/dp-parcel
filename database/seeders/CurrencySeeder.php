<?php

namespace Database\Seeders;

use App\Models\Backend\Currency;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CurrencySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $b = '$b';
        $U = '$U';
        DB::statement("INSERT INTO `currencies` (`id`, `country`, `name`, `code`, `symbol`, `exchange_rate`, `status`, `position`, `created_at`, `updated_at`) VALUES
        (1, 'Albania', 'Leke', 'ALL', 'Lek', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (2, 'America', 'Dollars', 'USD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (3, 'Afghanistan', 'Afghanis', 'AF', '؋', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (4, 'Argentina', 'Pesos', 'ARS', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (5, 'Aruba', 'Guilders', 'AWG', 'ƒ', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (6, 'Australia', 'Dollars', 'AUD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (8, 'Bahamas', 'Dollars', 'BSD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (9, 'Barbados', 'Dollars', 'BBD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (10, 'Belarus', 'Rubles', 'BYR', 'p.', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (11, 'Belgium', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (12, 'Beliz', 'Dollars', 'BZD', 'BZ$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (13, 'Bermuda', 'Dollars', 'BMD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (14, 'Bolivia', 'Bolivianos', 'BOB', '$b', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (16, 'Botswana', 'Pula\'s', 'BWP', 'P', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (17, 'Bulgaria', 'Leva', 'BG', 'лв', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (18, 'Brazil', 'Reais', 'BRL', 'R$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (20, 'Brunei Darussalam', 'Dollars', 'BND', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (21, 'Cambodia', 'Riels', 'KHR', '៛', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (22, 'Canada', 'Dollars', 'CAD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (23, 'Cayman Islands', 'Dollars', 'KYD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (24, 'Chile', 'Pesos', 'CLP', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (25, 'China', 'Yuan Renminbi', 'CNY', '¥', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (26, 'Colombia', 'Pesos', 'COP', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (27, 'Costa Rica', 'Colón', 'CRC', '₡', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (28, 'Croatia', 'Kuna', 'HRK', 'kn', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (29, 'Cuba', 'Pesos', 'CUP', '₱', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (30, 'Cyprus', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (32, 'Denmark', 'Kroner', 'DKK', 'kr', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (34, 'East Caribbean', 'Dollars', 'XCD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (35, 'Egypt', 'Pounds', 'EGP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (36, 'El Salvador', 'Colones', 'SVC', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (38, 'Euro', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (39, 'Falkland Islands', 'Pounds', 'FKP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (40, 'Fiji', 'Dollars', 'FJD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (41, 'France', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (42, 'Ghana', 'Cedis', 'GHS', '¢', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (43, 'Gibraltar', 'Pounds', 'GIP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (44, 'Greece', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (46, 'Guernsey', 'Pounds', 'GGP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (47, 'Guyana', 'Dollars', 'GYD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (49, 'Honduras', 'Lempiras', 'HNL', 'L', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (50, 'Hong Kong', 'Dollars', 'HKD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (51, 'Hungary', 'Forint', 'HUF', 'Ft', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (52, 'Iceland', 'Kronur', 'ISK', 'kr', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (53, 'India', 'Rupees', 'INR', '₹', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (55, 'Iran', 'Rials', 'IRR', '﷼', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (56, 'Ireland', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (57, 'Isle of Man', 'Pounds', 'IMP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (58, 'Israel', 'New Shekels', 'ILS', '₪', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (59, 'Italy', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (60, 'Jamaica', 'Dollars', 'JMD', 'J$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (61, 'Japan', 'Yen', 'JPY', '¥', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (62, 'Jersey', 'Pounds', 'JEP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (64, 'Korea [North]', 'Won', 'KPW', '₩', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (65, 'Korea [South]', 'Won', 'KRW', '₩', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (67, 'Laos', 'Kips', 'LAK', '₭', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (68, 'Latvia', 'Lati', 'LVL', 'Ls', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (69, 'Lebanon', 'Pounds', 'LBP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (70, 'Liberia', 'Dollars', 'LRD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (72, 'Lithuania', 'Litai', 'LTL', 'Lt', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (73, 'Luxembourg', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (74, 'Macedonia', 'Denars', 'MKD', 'ден', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (75, 'Malaysia', 'Ringgits', 'MYR', 'RM', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (76, 'Malta', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (77, 'Mauritius', 'Rupees', 'MUR', '₨', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (78, 'Mexico', 'Pesos', 'MXN', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (79, 'Mongolia', 'Tugriks', 'MNT', '₮', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (80, 'Mozambique', 'Meticais', 'MZ', 'MT', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (81, 'Namibia', 'Dollars', 'NAD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (82, 'Nepal', 'Rupees', 'NPR', '₨', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (84, 'Netherlands', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (85, 'New Zealand', 'Dollars', 'NZD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (87, 'Nigeria', 'Nairas', 'NGN', '₦', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (88, 'North Korea', 'Won', 'KPW', '₩', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (89, 'Norway', 'Krone', 'NOK', 'kr', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (90, 'Oman', 'Rials', 'OMR', '﷼', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (91, 'Pakistan', 'Rupees', 'PKR', '₨', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (92, 'Panama', 'Balboa', 'PAB', 'B/.', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (93, 'Paraguay', 'Guarani', 'PYG', 'Gs', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (95, 'Philippines', 'Pesos', 'PHP', 'Php', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (96, 'Poland', 'Zlotych', 'PL', 'zł', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (97, 'Qatar', 'Rials', 'QAR', '﷼', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (98, 'Romania', 'New Lei', 'RO', 'lei', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (99, 'Russia', 'Rubles', 'RUB', 'руб', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (100, 'Saint Helena', 'Pounds', 'SHP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (102, 'Serbia', 'Dinars', 'RSD', 'Дин.', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (103, 'Seychelles', 'Rupees', 'SCR', '₨', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (104, 'Singapore', 'Dollars', 'SGD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (105, 'Slovenia', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (106, 'Solomon Islands', 'Dollars', 'SBD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (107, 'Somalia', 'Shillings', 'SOS', 'S', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (108, 'South Africa', 'Rand', 'ZAR', 'R', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (109, 'South Korea', 'Won', 'KRW', '₩', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (110, 'Spain', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (111, 'Sri Lanka', 'Rupees', 'LKR', '₨', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (112, 'Sweden', 'Kronor', 'SEK', 'kr', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (113, 'Switzerland', 'Francs', 'CHF', 'CHF', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (114, 'Suriname', 'Dollars', 'SRD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (115, 'Syria', 'Pounds', 'SYP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (117, 'Thailand', 'Baht', 'THB', '฿', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (119, 'Turkey', 'Lira', 'TRY', 'TL', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (120, 'Turkey', 'Liras', 'TRL', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (121, 'Tuvalu', 'Dollars', 'TVD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (122, 'Ukraine', 'Hryvnia', 'UAH', '₴', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (123, 'United Kingdom', 'Pounds', 'GBP', '£', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (124, 'United States of America', 'Dollars', 'USD', '$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (125, 'Uruguay', 'Pesos', 'UYU', '$U', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (126, 'Uzbekistan', 'Sums', 'UZS', 'лв', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (127, 'Vatican City', 'Euro', 'EUR', '€', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (129, 'Vietnam', 'Dong', 'VND', '₫', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (130, 'Yemen', 'Rials', 'YER', '﷼', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (134, 'Bangladesh', 'Taka', 'BDT', '৳', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (139, 'Angola', 'Kwanza', 'AOA', 'Kz', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09'),
        (141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', NULL, 1, NULL, '2022-12-14 08:30:09', '2022-12-14 08:30:09');");

      
    }
}
