const allProvinsi = [
  "Aceh Barat",
  "Aceh Barat Daya",
  "Aceh Besar",
  "Aceh Jaya",
  "Aceh Selatan",
  "Aceh Singkil",
  "Aceh Tamiang",
  "Aceh Tengah",
  "Aceh Tenggara",
  "Aceh Timur",
  "Aceh Utara",
  "Agam",
  "Alor",
  "Ambon",
  "Asahan",
  "Asmat",
  "Batam",
  "Badung",
  "Balangan",
  "Balikpapan",
  "Banda Aceh",
  "Bandar Lampung",
  "Bandung",
  "Bandung Barat",
  "Banggai",
  "Banggai Kepulauan",
  "Bangka",
  "Bangka Barat",
  "Bangka Selatan",
  "Bangka Tengah",
  "Bangkalan",
  "Bangli",
  "Banjar",
  "Banjar Baru",
  "Banjarmasin",
  "Banjarnegara",
  "Bantaeng",
  "Bantul",
  "Banyu Asin",
  "Banyumas",
  "Banyuwangi",
  "Barito Kuala",
  "Barito Selatan",
  "Barito Timur",
  "Barito Utara",
  "Barru",
  "Baru",
  "Batang",
  "Batang Hari",
  "Batu",
  "Batu Bara",
  "Baubau",
  "Bekasi",
  "Belitung",
  "Belitung Timur",
  "Belu",
  "Bener Meriah",
  "Bengkalis",
  "Bengkayang",
  "Bengkulu",
  "Bengkulu Selatan",
  "Bengkulu Tengah",
  "Bengkulu Utara",
  "Berau",
  "Biak Numfor",
  "Bima",
  "Binjai",
  "Bintan",
  "Bireuen",
  "Bitung",
  "Blitar",
  "Blora",
  "Boalemo",
  "Bogor",
  "Bojonegoro",
  "Bolaang Mongondow",
  "Bolaang Mongondow Selatan",
  "Bolaang Mongondow Timur",
  "Bolaang Mongondow Utara",
  "Bombana",
  "Bondowoso",
  "Bone",
  "Bone Bolango",
  "Bontang",
  "Boven Digoel",
  "Boyolali",
  "Brebes",
  "Bukittinggi",
  "Buleleng",
  "Bulukumba",
  "Bulungan",
  "Bungo",
  "Buol",
  "Buru",
  "Buru Selatan",
  "Buton",
  "Buton Utara",
  "Ciamis",
  "Cianjur",
  "Cilacap",
  "Cilegon",
  "Cimahi",
  "Cirebon",
  "Dumai",
  "Dairi",
  "Deiyai",
  "Deli Serdang",
  "Demak",
  "Denpasar",
  "Depok",
  "Dharmasraya",
  "Dogiyai",
  "Dompu",
  "Donggala",
  "Empat Lawang",
  "Ende",
  "Enrekang",
  "Fakfak",
  "Flores Timur",
  "Garut",
  "Gayo Lues",
  "Gianyar",
  "Gorontalo",
  "Gorontalo Utara",
  "Gowa",
  "Gresik",
  "Grobogan",
  "Gunung Kidul",
  "Gunung Mas",
  "Gunungsitoli",
  "Halmahera Barat",
  "Halmahera Selatan",
  "Halmahera Tengah",
  "Halmahera Timur",
  "Halmahera Utara",
  "Hulu Sungai Selatan",
  "Hulu Sungai Tengah",
  "Hulu Sungai Utara",
  "Humbang Hasundutan",
  "Indragiri Hilir",
  "Indragiri Hulu",
  "Indramayu",
  "Intan Jaya",
  "Jakarta Barat",
  "Jakarta Pusat",
  "Jakarta Selatan",
  "Jakarta Timur",
  "Jakarta Utara",
  "Jambi",
  "Jayapura",
  "Jayawijaya",
  "Jember",
  "Jembrana",
  "Jeneponto",
  "Jepara",
  "Jombang",
  "Kaimana",
  "Kampar",
  "Kapuas",
  "Kapuas Hulu",
  "Karang Asem",
  "Karanganyar",
  "Karawang",
  "Karimun",
  "Karo",
  "Katingan",
  "Kaur",
  "Kayong Utara",
  "Kebumen",
  "Kediri",
  "Keerom",
  "Kendal",
  "Kendari",
  "Kepahiang",
  "Kepulauan Anambas",
  "Kepulauan Aru",
  "Kepulauan Mentawai",
  "Kepulauan Meranti",
  "Kepulauan Sangihe",
  "Kepulauan Selayar",
  "Kepulauan Seribu",
  "Kepulauan Sula",
  "Kepulauan Talaud",
  "Kepulauan Yapen",
  "Kerinci",
  "Ketapang",
  "Klaten",
  "Klungkung",
  "Kolaka",
  "Kolaka Utara",
  "Konawe",
  "Konawe Selatan",
  "Konawe Utara",
  "Kotamobagu",
  "Kotawaringin Barat",
  "Kotawaringin Timur",
  "Kuantan Singingi",
  "Kubu Raya",
  "Kudus",
  "Kulon Progo",
  "Kuningan",
  "Kupang",
  "Kutai Barat",
  "Kutai Kartanegara",
  "Kutai Timur",
  "Labuhan Batu",
  "Labuhan Batu Selatan",
  "Labuhan Batu Utara",
  "Lahat",
  "Lamandau",
  "Lamongan",
  "Lampung Barat",
  "Lampung Selatan",
  "Lampung Tengah",
  "Lampung Timur",
  "Lampung Utara",
  "Landak",
  "Langkat",
  "Langsa",
  "Lanny Jaya",
  "Lebak",
  "Lebong",
  "Lembata",
  "Lhokseumawe",
  "Lima Puluh Kota",
  "Lingga",
  "Lombok Barat",
  "Lombok Tengah",
  "Lombok Timur",
  "Lombok Utara",
  "Lubuklinggau",
  "Lumajang",
  "Luwu",
  "Luwu Timur",
  "Luwu Utara",
  "Madiun",
  "Magelang",
  "Magetan",
  "Majalengka",
  "Majene",
  "Makassar",
  "Malang",
  "Malinau",
  "Maluku Barat Daya",
  "Maluku Tengah",
  "Maluku Tenggara",
  "Maluku Tenggara Barat",
  "Mamasa",
  "Mamberamo Raya",
  "Mamberamo Tengah",
  "Mamuju",
  "Mamuju Utara",
  "Manado",
  "Mandailing Natal",
  "Manggarai",
  "Manggarai Barat",
  "Manggarai Timur",
  "Manokwari",
  "Mappi",
  "Maros",
  "Mataram",
  "Maybrat",
  "Medan",
  "Melawi",
  "Merangin",
  "Merauke",
  "Mesuji",
  "Metro",
  "Mimika",
  "Minahasa",
  "Minahasa Selatan",
  "Minahasa Tenggara",
  "Minahasa Utara",
  "Mojokerto",
  "Morowali",
  "Muara Enim",
  "Muaro Jambi",
  "Mukomuko",
  "Muna",
  "Murung Raya",
  "Musi Banyuasin",
  "Musi Rawas",
  "Nabire",
  "Nagan Raya",
  "Nagekeo",
  "Natuna",
  "Nduga",
  "Ngada",
  "Nganjuk",
  "Ngawi",
  "Nias",
  "Nias Barat",
  "Nias Selatan",
  "Nias Utara",
  "Nunukan",
  "Ogan Ilir",
  "Ogan Komering Ilir",
  "Ogan Komering Ulu",
  "Ogan Komering Ulu Selatan",
  "Ogan Komering Ulu Timur",
  "Pacitan",
  "Padang",
  "Padang Lawas",
  "Padang Lawas Utara",
  "Padang Panjang",
  "Padang Pariaman",
  "Padangsidimpuan",
  "Pagar Alam",
  "Pakpak Bharat",
  "Palangka Raya",
  "Palembang",
  "Palopo",
  "Palu",
  "Pamekasan",
  "Pandeglang",
  "Pangandaran",
  "Pangkajene Dan Kepulauan",
  "Pangkal Pinang",
  "Paniai",
  "Parepare",
  "Pariaman",
  "Parigi Moutong",
  "Pasaman",
  "Pasaman Barat",
  "Paser",
  "Pasuruan",
  "Pati",
  "Payakumbuh",
  "Pegunungan Bintang",
  "Pekalongan",
  "Pekanbaru",
  "Pelalawan",
  "Pemalang",
  "Pematang Siantar",
  "Penajam Paser Utara",
  "Pesawaran",
  "Pesisir Barat",
  "Pesisir Selatan",
  "Pidie",
  "Pidie Jaya",
  "Pinrang",
  "Pohuwato",
  "Polewali Mandar",
  "Ponorogo",
  "Pontianak",
  "Poso",
  "Prabumulih",
  "Pringsewu",
  "Probolinggo",
  "Pulang Pisau",
  "Pulau Morotai",
  "Puncak",
  "Puncak Jaya",
  "Purbalingga",
  "Purwakarta",
  "Purworejo",
  "Raja Ampat",
  "Rejang Lebong",
  "Rembang",
  "Rokan Hilir",
  "Rokan Hulu",
  "Rote Ndao",
  "Siak",
  "Sabang",
  "Sabu Raijua",
  "Salatiga",
  "Samarinda",
  "Sambas",
  "Samosir",
  "Sampang",
  "Sanggau",
  "Sarmi",
  "Sarolangun",
  "Sawah Lunto",
  "Sekadau",
  "Seluma",
  "Semarang",
  "Seram Bagian Barat",
  "Seram Bagian Timur",
  "Serang",
  "Serdang Bedagai",
  "Seruyan",
  "Siau Tagulandang Biaro",
  "Sibolga",
  "Sidenreng Rappang",
  "Sidoarjo",
  "Sigi",
  "Sijunjung",
  "Sikka",
  "Simalungun",
  "Simeulue",
  "Singkawang",
  "Sinjai",
  "Sintang",
  "Situbondo",
  "Sleman",
  "Solok",
  "Solok Selatan",
  "Soppeng",
  "Sorong",
  "Sorong Selatan",
  "Sragen",
  "Subang",
  "Subulussalam",
  "Sukabumi",
  "Sukamara",
  "Sukoharjo",
  "Sumba Barat",
  "Sumba Barat Daya",
  "Sumba Tengah",
  "Sumba Timur",
  "Sumbawa",
  "Sumbawa Barat",
  "Sumedang",
  "Sumenep",
  "Sungai Penuh",
  "Supiori",
  "Surabaya",
  "Surakarta",
  "Tabalong",
  "Tabanan",
  "Takalar",
  "Tambrauw",
  "Tana Tidung",
  "Tana Toraja",
  "Tanah Bumbu",
  "Tanah Datar",
  "Tanah Laut",
  "Tangerang",
  "Tangerang Selatan",
  "Tanggamus",
  "Tanjung Balai",
  "Tanjung Jabung Barat",
  "Tanjung Jabung Timur",
  "Tanjung Pinang",
  "Tapanuli Selatan",
  "Tapanuli Tengah",
  "Tapanuli Utara",
  "Tapin",
  "Tarakan",
  "Tasikmalaya",
  "Tebing Tinggi",
  "Tebo",
  "Tegal",
  "Teluk Bintuni",
  "Teluk Wondama",
  "Temanggung",
  "Ternate",
  "Tidore Kepulauan",
  "Timor Tengah Selatan",
  "Timor Tengah Utara",
  "Toba Samosir",
  "Tojo Una-una",
  "Toli-toli",
  "Tolikara",
  "Tomohon",
  "Toraja Utara",
  "Trenggalek",
  "Tual",
  "Tuban",
  "Tulang Bawang Barat",
  "Tulangbawang",
  "Tulungagung",
  "Wajo",
  "Wakatobi",
  "Waropen",
  "Way Kanan",
  "Wonogiri",
  "Wonosobo",
  "Yahukimo",
  "Yalimo",
  "Yogyakarta"
];
