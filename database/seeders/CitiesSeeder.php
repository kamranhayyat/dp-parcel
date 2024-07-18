<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CitiesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $cities = [
            ['name' => 'Colombo 03', 'district_id' => 1],
            ['name' => 'Colombo 01', 'district_id' => 1],
            ['name' => 'Colombo 02', 'district_id' => 1],
            ['name' => 'Colombo 07', 'district_id' => 1],
            ['name' => 'Colombo 08', 'district_id' => 1],
            ['name' => 'Colombo 09', 'district_id' => 1],
            ['name' => 'Colombo 10', 'district_id' => 1],
            ['name' => 'Colombo 11', 'district_id' => 1],
            ['name' => 'Colombo 12', 'district_id' => 1],
            ['name' => 'Colombo 13', 'district_id' => 1],
            ['name' => 'Colombo 14', 'district_id' => 1],
            ['name' => 'Colombo 15', 'district_id' => 1],
            ['name' => 'Grandpass', 'district_id' => 1],
            ['name' => 'Kotahena', 'district_id' => 1],
            ['name' => 'Panchikawatta', 'district_id' => 1],
            ['name' => 'Slave Island', 'district_id' => 1],
            ['name' => 'Orugodawatta', 'district_id' => 1],
            ['name' => 'Colombo 04', 'district_id' => 1],
            ['name' => 'Colombo 05', 'district_id' => 1],
            ['name' => 'Colombo 06', 'district_id' => 1],
            ['name' => 'Narahenpita', 'district_id' => 1],

            ['name' => 'Kolonnawa', 'district_id' => 2],
            ['name' => 'Attidiya', 'district_id' => 2],
            ['name' => 'Bellantara', 'district_id' => 2],
            ['name' => 'Boralesgamuwa', 'district_id' => 2],
            ['name' => 'Dehiwala', 'district_id' => 2],
            ['name' => 'Delkanda', 'district_id' => 2],
            ['name' => 'Ethul Kotte', 'district_id' => 2],
            ['name' => 'Gangodawila', 'district_id' => 2],
            ['name' => 'Gongodawila', 'district_id' => 2],
            ['name' => 'Kalubowila', 'district_id' => 2],
            ['name' => 'Karagampitiya', 'district_id' => 2],
            ['name' => 'Kohuwala', 'district_id' => 2],
            ['name' => 'Kotte', 'district_id' => 2],
            ['name' => 'Maharagama', 'district_id' => 2],
            ['name' => 'Mount Lavinia', 'district_id' => 2],
            ['name' => 'Nawala', 'district_id' => 2],
            ['name' => 'Nugegoda', 'district_id' => 2],
            ['name' => 'Pita Kotte', 'district_id' => 2],
            ['name' => 'Polhengoda', 'district_id' => 2],
            ['name' => 'Sri Jayawardenepura', 'district_id' => 2],
            ['name' => 'Wijerama', 'district_id' => 2],
            ['name' => 'Hiripitiya (Homagama )', 'district_id' => 2],
            ['name' => 'Rajagiriya', 'district_id' => 2],
            ['name' => 'Battaramulla', 'district_id' => 2],
            ['name' => 'Battaramulla Koswatta', 'district_id' => 2],
            ['name' => 'Pelawatta ( Battaramulla )', 'district_id' => 2],
            ['name' => 'Talawatugoda', 'district_id' => 2],
            ['name' => 'Wellampitiya', 'district_id' => 2],
            ['name' => 'Idh Kothatuwa', 'district_id' => 2],
            ['name' => 'Kotigawatta', 'district_id' => 2],
            ['name' => 'Mulleriya', 'district_id' => 2],
            ['name' => 'Mulleriya New Town', 'district_id' => 2],
            ['name' => 'Imbutana', 'district_id' => 2],
            ['name' => 'Angoda', 'district_id' => 2],
            ['name' => 'Ambathale', 'district_id' => 2],

            ['name' => 'Madiwela', 'district_id' => 3],
            ['name' => 'Athurugiriya', 'district_id' => 3],
            ['name' => 'Diyagama (Homagama)', 'district_id' => 3],
            ['name' => 'Godagama', 'district_id' => 3],
            ['name' => 'Habarakada', 'district_id' => 3],
            ['name' => 'Hiripitiya (Kottawa)', 'district_id' => 3],
            ['name' => 'Hokandara', 'district_id' => 3],
            ['name' => 'Homagama', 'district_id' => 3],
            ['name' => 'Kiriwattuduwa', 'district_id' => 3],
            ['name' => 'Kottawa', 'district_id' => 3],
            ['name' => 'Mattegoda', 'district_id' => 3],
            ['name' => 'Panagoda (Homagama)', 'district_id' => 3],
            ['name' => 'Pannipitiya', 'district_id' => 3],
            ['name' => 'Pitipana Homagama', 'district_id' => 3],
            ['name' => 'Rukmale', 'district_id' => 3],
            ['name' => 'Rukmalgama', 'district_id' => 3],
            ['name' => 'Polgasowita', 'district_id' => 3],
            ['name' => 'Dampe', 'district_id' => 3],
            ['name' => 'Kahapola', 'district_id' => 3],
            ['name' => 'Wewala (Piliyandala)', 'district_id' => 3],
            ['name' => 'Thumbowila', 'district_id' => 3],
            ['name' => 'Halpita (Kesbewa)', 'district_id' => 3],
            ['name' => 'Rawathawatta', 'district_id' => 3],
            ['name' => 'Wethara', 'district_id' => 3],
            ['name' => 'Welmilla', 'district_id' => 3],
            ['name' => 'Angulana', 'district_id' => 3],
            ['name' => 'Bokundara', 'district_id' => 3],
            ['name' => 'Borupana Rathmalana', 'district_id' => 3],
            ['name' => 'Deltara', 'district_id' => 3],
            ['name' => 'Kaldemulla (Rathmalana)', 'district_id' => 3],
            ['name' => 'Kesbewa', 'district_id' => 3],
            ['name' => 'Madapatha', 'district_id' => 3],
            ['name' => 'Miriswatta (Piliyandala)', 'district_id' => 3],
            ['name' => 'Moratumulla', 'district_id' => 3],
            ['name' => 'Moratuwa', 'district_id' => 3],
            ['name' => 'Piliyandala', 'district_id' => 3],
            ['name' => 'Siddamulla', 'district_id' => 3],
            ['name' => 'Ratmalana', 'district_id' => 3],
            ['name' => 'Thelawala (Rathmalana)', 'district_id' => 3],
            ['name' => 'Weliwita', 'district_id' => 3],
            ['name' => 'Kaduwela', 'district_id' => 3],
            ['name' => 'Nawagamuwa', 'district_id' => 3],
            ['name' => 'Ranala', 'district_id' => 3],
            ['name' => 'Hangwella', 'district_id' => 3],
            ['name' => 'Kosgama', 'district_id' => 3],
            ['name' => 'Meepe', 'district_id' => 3],
            ['name' => 'Puwakpitiya', 'district_id' => 3],
            ['name' => 'Waga', 'district_id' => 3],
            ['name' => 'Labugama', 'district_id' => 3],
            ['name' => 'Malambe', 'district_id' => 3],
            ['name' => 'Godagama', 'district_id' => 3],
            ['name' => 'Padukka', 'district_id' => 3],
            ['name' => 'Galagaththena', 'district_id' => 3],
            ['name' => 'Dummodara', 'district_id' => 3],
            ['name' => 'Awissawella', 'district_id' => 3],

            ['name' => 'Negombo', 'district_id' => 4],
            ['name' => 'Gampaha', 'district_id' => 4],
            ['name' => 'Katunayake', 'district_id' => 4],
            ['name' => 'Ja-Ela', 'district_id' => 4],
            ['name' => 'Wattala', 'district_id' => 4],
            ['name' => 'Kelaniya', 'district_id' => 4],
            ['name' => 'Ragama', 'district_id' => 4],
            ['name' => 'Kandana', 'district_id' => 4],
            ['name' => 'Kiribathgoda', 'district_id' => 4],
            ['name' => 'Peliyagoda', 'district_id' => 4],
            ['name' => 'Minuwangoda', 'district_id' => 4],
            ['name' => 'Divulapitiya', 'district_id' => 4],
            ['name' => 'Mirigama', 'district_id' => 4],
            ['name' => 'Attanagalla', 'district_id' => 4],
            ['name' => 'Veyangoda', 'district_id' => 4],
            ['name' => 'Dompe', 'district_id' => 4],
            ['name' => 'Biyagama', 'district_id' => 4],
            ['name' => 'Mahara', 'district_id' => 4],
            ['name' => 'Seeduwa', 'district_id' => 4],
            ['name' => 'Kadawatha', 'district_id' => 4],
            ['name' => 'Welisara', 'district_id' => 4],
            ['name' => 'Ganemulla', 'district_id' => 4],
            ['name' => 'Wathurugama', 'district_id' => 4],
            ['name' => 'Heiyanthuduwa', 'district_id' => 4],
            ['name' => 'Udugampola', 'district_id' => 4],
            ['name' => 'Yakkala', 'district_id' => 4],
            ['name' => 'Naiwala', 'district_id' => 4],

            ['name' => 'Kalutara', 'district_id' => 5],
            ['name' => 'Panadura', 'district_id' => 5],
            ['name' => 'Beruwala', 'district_id' => 5],
            ['name' => 'Aluthgama', 'district_id' => 5],
            ['name' => 'Wadduwa', 'district_id' => 5],
            ['name' => 'Horana', 'district_id' => 5],
            ['name' => 'Matugama', 'district_id' => 5],
            ['name' => 'Bandaragama', 'district_id' => 5],
            ['name' => 'Ingiriya', 'district_id' => 5],
            ['name' => 'Bulathsinhala', 'district_id' => 5],
            ['name' => 'Dodangoda', 'district_id' => 5],
            ['name' => 'Agalawatta', 'district_id' => 5],
            ['name' => 'Payagala', 'district_id' => 5],
            ['name' => 'Maggona', 'district_id' => 5],
            ['name' => 'Kaluwamodara', 'district_id' => 5],
            ['name' => 'Dharga Town', 'district_id' => 5],
            ['name' => 'Nagoda', 'district_id' => 5],
            ['name' => 'Waskaduwa', 'district_id' => 5],
            ['name' => 'Moronthuduwa', 'district_id' => 5],
            ['name' => 'Bombuwala', 'district_id' => 5],
            ['name' => 'Gonapola', 'district_id' => 5],
            ['name' => 'Galpatha', 'district_id' => 5],

            ['name' => 'Kandy', 'district_id' => 6],
            ['name' => 'Peradeniya', 'district_id' => 6],
            ['name' => 'Katugastota', 'district_id' => 6],
            ['name' => 'Gampola', 'district_id' => 6],
            ['name' => 'Nawalapitiya', 'district_id' => 6],
            ['name' => 'Wattegama', 'district_id' => 6],
            ['name' => 'Kundasale', 'district_id' => 6],
            ['name' => 'Digana', 'district_id' => 6],
            ['name' => 'Akurana', 'district_id' => 6],
            ['name' => 'Pussellawa', 'district_id' => 6],
            ['name' => 'Kadugannawa', 'district_id' => 6],
            ['name' => 'Gelioya', 'district_id' => 6],
            ['name' => 'Menikhinna', 'district_id' => 6],
            ['name' => 'Madawala', 'district_id' => 6],
            ['name' => 'Pallekele', 'district_id' => 6],
            ['name' => 'Hantana', 'district_id' => 6],
            ['name' => 'Thalathuoya', 'district_id' => 6],
            ['name' => 'Harispattuwa', 'district_id' => 6],
            ['name' => 'Galagedara', 'district_id' => 6],
            ['name' => 'Udapalatha', 'district_id' => 6],
            ['name' => 'Panwila', 'district_id' => 6],
            ['name' => 'Thumpane', 'district_id' => 6],
            ['name' => 'Uduwawala', 'district_id' => 6],
            ['name' => 'Hanguranketha', 'district_id' => 6],
            ['name' => 'Galaha', 'district_id' => 6],
            ['name' => 'Rikillagaskada', 'district_id' => 6],
            ['name' => 'Hedeniya', 'district_id' => 6],
            ['name' => 'Kurunduwatta', 'district_id' => 6],
            ['name' => 'Wattappola', 'district_id' => 6],

            ['name' => 'Matale', 'district_id' => 7],
            ['name' => 'Dambulla', 'district_id' => 7],
            ['name' => 'Sigiriya', 'district_id' => 7],
            ['name' => 'Ukuwela', 'district_id' => 7],
            ['name' => 'Rattota', 'district_id' => 7],
            ['name' => 'Pallepola', 'district_id' => 7],
            ['name' => 'Naula', 'district_id' => 7],
            ['name' => 'Yatawatta', 'district_id' => 7],
            ['name' => 'Galewela', 'district_id' => 7],
            ['name' => 'Ambanganga Korale', 'district_id' => 7],
            ['name' => 'Wilgamuwa', 'district_id' => 7],
            ['name' => 'Palapathwela', 'district_id' => 7],
            ['name' => 'Laggala-Pallegama', 'district_id' => 7],
            ['name' => 'Raththota', 'district_id' => 7],
            ['name' => 'Madawala Ulpotha', 'district_id' => 7],
            ['name' => 'Kaikawala', 'district_id' => 7],
            ['name' => 'Elkaduwa', 'district_id' => 7],
            ['name' => 'Ukuwela Town', 'district_id' => 7],
            ['name' => 'Paldeniya', 'district_id' => 7],
            ['name' => 'Madipola', 'district_id' => 7],

//            ['name' => 'Nuwara Eliya', 'district_id' => 28],
//            ['name' => 'Hatton', 'district_id' => 28],
//            ['name' => 'Talawakelle', 'district_id' => 28],
//            ['name' => 'Lindula', 'district_id' => 28],
//            ['name' => 'Ginigathena', 'district_id' => 28],
//            ['name' => 'Ragala', 'district_id' => 28],
//            ['name' => 'Maskeliya', 'district_id' => 28],
//            ['name' => 'Kotagala', 'district_id' => 28],
//            ['name' => 'Nanu Oya', 'district_id' => 28],
//            ['name' => 'Pundaluoya', 'district_id' => 28],
//            ['name' => 'Walapane', 'district_id' => 28],
//            ['name' => 'Agarapathana', 'district_id' => 28],
//            ['name' => 'Bogawantalawa', 'district_id' => 28],
//            ['name' => 'Norwood', 'district_id' => 28],
//            ['name' => 'Kandapola', 'district_id' => 28],
//            ['name' => 'Rikillagaskada', 'district_id' => 28],
//            ['name' => 'Ambewela', 'district_id' => 28],
//            ['name' => 'Dayagama', 'district_id' => 28],
//            ['name' => 'Labookellie', 'district_id' => 28],
//            ['name' => 'Rozella', 'district_id' => 28],
//            ['name' => 'Kalapitiya', 'district_id' => 28],
//            ['name' => 'Holbrook', 'district_id' => 28],

            ['name' => 'Galle', 'district_id' => 9],
            ['name' => 'Hikkaduwa', 'district_id' => 9],
            ['name' => 'Ambalangoda', 'district_id' => 9],
            ['name' => 'Elpitiya', 'district_id' => 9],
            ['name' => 'Karapitiya', 'district_id' => 9],
            ['name' => 'Bentota', 'district_id' => 9],
            ['name' => 'Weligama', 'district_id' => 9],
            ['name' => 'Ahangama', 'district_id' => 9],
            ['name' => 'Imaduwa', 'district_id' => 9],
            ['name' => 'Koggala', 'district_id' => 9],
            ['name' => 'Baddegama', 'district_id' => 9],
            ['name' => 'Rathgama', 'district_id' => 9],
            ['name' => 'Balapitiya', 'district_id' => 9],
            ['name' => 'Habaraduwa', 'district_id' => 9],
            ['name' => 'Akmeemana', 'district_id' => 9],
            ['name' => 'Nagoda', 'district_id' => 9],
            ['name' => 'Thawalama', 'district_id' => 9],
            ['name' => 'Yakkalamulla', 'district_id' => 9],
            ['name' => 'Pitigala', 'district_id' => 9],
            ['name' => 'Niyagama', 'district_id' => 9],
            ['name' => 'Poddala', 'district_id' => 9],
            ['name' => 'Meetiyagoda', 'district_id' => 9],
            ['name' => 'Gonapinuwala', 'district_id' => 9],
            ['name' => 'Udugama', 'district_id' => 9],
            ['name' => 'Yatalamatta', 'district_id' => 9],
            ['name' => 'Hiniduma', 'district_id' => 9],

            ['name' => 'Matara', 'district_id' => 10],
            ['name' => 'Weligama', 'district_id' => 10],
            ['name' => 'Tangalle', 'district_id' => 10],
            ['name' => 'Dikwella', 'district_id' => 10],
            ['name' => 'Kamburupitiya', 'district_id' => 10],
            ['name' => 'Deniyaya', 'district_id' => 10],
            ['name' => 'Devinuwara', 'district_id' => 10],
            ['name' => 'Morawaka', 'district_id' => 10],
            ['name' => 'Akuressa', 'district_id' => 10],
            ['name' => 'Hakmana', 'district_id' => 10],
            ['name' => 'Mulatiyana', 'district_id' => 10],
            ['name' => 'Thelijjawila', 'district_id' => 10],
            ['name' => 'Thihagoda', 'district_id' => 10],
            ['name' => 'Kirinda Puhulwella', 'district_id' => 10],
            ['name' => 'Kotapola', 'district_id' => 10],
            ['name' => 'Urubokka', 'district_id' => 10],
            ['name' => 'Malimboda', 'district_id' => 10],
            ['name' => 'Welipitiya', 'district_id' => 10],
            ['name' => 'Athuraliya', 'district_id' => 10],
            ['name' => 'Pasgoda', 'district_id' => 10],
            ['name' => 'Weligatta', 'district_id' => 10],
            ['name' => 'Weragampita', 'district_id' => 10],

            ['name' => 'Hambantota', 'district_id' => 11],
            ['name' => 'Tissamaharama', 'district_id' => 11],
            ['name' => 'Tangalle', 'district_id' => 11],
            ['name' => 'Beliatta', 'district_id' => 11],
            ['name' => 'Weeraketiya', 'district_id' => 11],
            ['name' => 'Ambalantota', 'district_id' => 11],
            ['name' => 'Kataragama', 'district_id' => 11],
            ['name' => 'Suriyawewa', 'district_id' => 11],
            ['name' => 'Sooriyawewa', 'district_id' => 11],
            ['name' => 'Walasmulla', 'district_id' => 11],
            ['name' => 'Angunakolapelessa', 'district_id' => 11],
            ['name' => 'Middeniya', 'district_id' => 11],
            ['name' => 'Katuwana', 'district_id' => 11],
            ['name' => 'Kirama', 'district_id' => 11],
            ['name' => 'Lunugamvehera', 'district_id' => 11],
            ['name' => 'Koggala', 'district_id' => 11],
            ['name' => 'Godakawela', 'district_id' => 11],
            ['name' => 'Ranna', 'district_id' => 11],
            ['name' => 'Tissa', 'district_id' => 11],
            ['name' => 'Weerawila', 'district_id' => 11],
            ['name' => 'Angunukolapelessa', 'district_id' => 11],

            ['name' => 'Jaffna', 'district_id' => 12],
            ['name' => 'Chavakachcheri', 'district_id' => 12],
            ['name' => 'Point Pedro', 'district_id' => 12],
            ['name' => 'Nallur', 'district_id' => 12],
            ['name' => 'Valvettithurai', 'district_id' => 12],
            ['name' => 'Kopay', 'district_id' => 12],
            ['name' => 'Kodikamam', 'district_id' => 12],
            ['name' => 'Karainagar', 'district_id' => 12],
            ['name' => 'Velanai', 'district_id' => 12],
            ['name' => 'Kayts', 'district_id' => 12],
            ['name' => 'Atchuvely', 'district_id' => 12],
            ['name' => 'Chankanai', 'district_id' => 12],
            ['name' => 'Chunnakam', 'district_id' => 12],
            ['name' => 'Tellippalai', 'district_id' => 12],
            ['name' => 'Maruthankerney', 'district_id' => 12],
            ['name' => 'Karaveddy', 'district_id' => 12],
            ['name' => 'Manipay', 'district_id' => 12],
            ['name' => 'Vaddukoddai', 'district_id' => 12],
            ['name' => 'Uduvil', 'district_id' => 12],
            ['name' => 'Puttur', 'district_id' => 12],
            ['name' => 'Palaly', 'district_id' => 12],
            ['name' => 'Moolai', 'district_id' => 12],
            ['name' => 'Naranthanai', 'district_id' => 12],

            ['name' => 'Kilinochchi', 'district_id' => 13],
            ['name' => 'Paranthan', 'district_id' => 13],
            ['name' => 'Pooneryn', 'district_id' => 13],
            ['name' => 'Karachchi', 'district_id' => 13],
            ['name' => 'Mulankavil', 'district_id' => 13],
            ['name' => 'Pachchilaipalli', 'district_id' => 13],
            ['name' => 'Mallavi', 'district_id' => 13],
            ['name' => 'Uruthirapuram', 'district_id' => 13],
            ['name' => 'Akkarayan', 'district_id' => 13],
            ['name' => 'Puliyankulam', 'district_id' => 13],
            ['name' => 'Vaddakachchi', 'district_id' => 13],
            ['name' => 'Murikandy', 'district_id' => 13],

            ['name' => 'Mannar', 'district_id' => 14],
            ['name' => 'Murunkan', 'district_id' => 14],
            ['name' => 'Pesalai', 'district_id' => 14],
            ['name' => 'Thalaimannar', 'district_id' => 14],
            ['name' => 'Nanattan', 'district_id' => 14],
            ['name' => 'Silavatturai', 'district_id' => 14],
            ['name' => 'Vidathaltheevu', 'district_id' => 14],
            ['name' => 'Arippu', 'district_id' => 14],
            ['name' => 'Tharapuram', 'district_id' => 14],
            ['name' => 'Erukkalampiddy', 'district_id' => 14],
            ['name' => 'Thoddaveli', 'district_id' => 14],
            ['name' => 'Uyilankulam', 'district_id' => 14],

            ['name' => 'Vavuniya', 'district_id' => 15],
            ['name' => 'Vavunathivu', 'district_id' => 15],
            ['name' => 'Omanthai', 'district_id' => 15],
            ['name' => 'Cheddikulam', 'district_id' => 15],
            ['name' => 'Nedunkeni', 'district_id' => 15],
            ['name' => 'Puliyankulam', 'district_id' => 15],
            ['name' => 'Pandarikulam', 'district_id' => 15],
            ['name' => 'Settikulam', 'district_id' => 15],
            ['name' => 'Pavatkulam', 'district_id' => 15],
            ['name' => 'Kurumankadu', 'district_id' => 15],
            ['name' => 'Pampaimadu', 'district_id' => 15],
            ['name' => 'Nelukkulam', 'district_id' => 15],
            ['name' => 'Koomankulam', 'district_id' => 15],

            ['name' => 'Mullaitivu', 'district_id' => 16],
            ['name' => 'Puthukudiyiruppu', 'district_id' => 16],
            ['name' => 'Oddusuddan', 'district_id' => 16],
            ['name' => 'Mulliyawalai', 'district_id' => 16],
            ['name' => 'Maritimepattu', 'district_id' => 16],
            ['name' => 'Alampil', 'district_id' => 16],
            ['name' => 'Thunukkai', 'district_id' => 16],
            ['name' => 'Kokkilai', 'district_id' => 16],
            ['name' => 'Karunaddukerny', 'district_id' => 16],
            ['name' => 'Silavathurai', 'district_id' => 16],
            ['name' => 'Oddusudan', 'district_id' => 16],
            ['name' => 'Nanthikadal', 'district_id' => 16],

            ['name' => 'Batticaloa', 'district_id' => 17],
            ['name' => 'Kattankudy', 'district_id' => 17],
            ['name' => 'Eravur', 'district_id' => 17],
            ['name' => 'Valaichchenai', 'district_id' => 17],

        ];

        DB::table('cities')->insert($cities);
    }
}
