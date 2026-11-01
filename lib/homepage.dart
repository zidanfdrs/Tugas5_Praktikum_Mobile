import 'package:flutter/material.dart';
import 'package:tugas5mobile/detail_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static const List<Map<String, Object>> makanan = [
    {
      'nama': 'Nasi Goreng ',
      'harga': 12000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaewAFj9KWHPrFFMAM53z7VRoVSQpequc6hSXnQn3UNA&s=10',
      'deskripsi': 'Nasi goreng dengan telur ceplok, kerupuk, dan bumbu yang diracik oleh saya sendiri.',
    },
    {
      'nama': 'Sosis Bakar',
      'harga': 10000,
      'img': 'https://i0.wp.com/resepkoki.id/wp-content/uploads/2021/12/Resep-Sosis-Bakar.jpg?fit=944%2C1259&ssl=1',
      'deskripsi': 'Sosis yang dibakar dengan saus pedas dan mayonnaise, memberikan rasa yang lezat dan aroma yang menggugah selera.',
    },
    {
      'nama': 'Sate Taichan',
      'harga': 15000,
      'img': 'https://images.alodokter.com/dk0z4ums3/image/upload/v1770972387/attached_image/sate-taichan-nilai-gizi-dan-tips-mengonsumsinya-0-alodokter.jpg',
      'deskripsi': 'Sate Taichan yang padat dengan kelembutan potongan daging ayam nya yang populer.',
    },
    {
      'nama': 'Nasi Ayam geprek',
      'harga': 12000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCsvNEyPBqRdpvqgAHulGs4yd5MTYqaIjBFhYF3GTww&s=10',
      'deskripsi': 'ayam goreng tepung krispi yang dihancurkan sampai remuk dan menyatu dengan sambal dengan selada , tomat , dan timun',
    },
    {
      'nama': 'Mie Goreng',
      'harga': 10000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTseMp8FEntX1lP2vPjvQn71pWPRHD5gQGrirhKqflQlA&s=10',
      'deskripsi': 'Indomie goreng dengan tambahan telur, sayuran, dan bumbu yang khas, memberikan cita rasa yang lezat dan memuaskan.',
    },
    {
      'nama': 'Mie Kuah',
      'harga': 10000,
      'img': 'https://i0.wp.com/i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/3366bd93-b074-4be8-9aa7-3c5337d7614c_Go-Biz_20220228_131814.jpeg',
      'deskripsi': 'Indomie kuah dengan tambahan telur, sayuran, dan bumbu yang khas, memberikan cita rasa yang lezat dan memuaskan.',
    },
    {
      'nama': 'Josu',
      'harga': 7000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbVjU8AEKXr9_VzaiycJImdmDwovT9B2IATtSWN6DdVgE35pMW8IvXBn4&s=10',
      'deskripsi': 'Extrajoss dengan tambahan susu kental manis, memberikan rasa yang menyegarkan dan energi tambahan untuk tubuh.',
    },
    {
      'nama': 'Teh Tarik',
      'harga': 6000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRilgS5qyBSvRBMqwb4KU-ZNFtdQk5Wvqw4UiGY3bSyJFTaU8tcZlKaUAFs&s=10',
      'deskripsi': 'Teh Tarik dengan rasa yang khas dan aroma yang menggugah selera.',
    },
    {
      'nama': 'Kentang Goreng',
      'harga': 10000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBj_0Go-hlYTNGo0hmY_4Lxrf_ETXuXimI26i4yomHO0HR7_jAaWeuvX1e&s=10',
      'deskripsi': 'Kentang goreng yang renyah dan gurih, cocok sebagai pelengkap makanan.',
    },
  ];

  static String _formatRupiah(int harga) {
    final angka = harga.toString();
    var hasil = '';

    for (var i = 0; i < angka.length; i++) {
      hasil += angka[i];
      final digitTersisa = angka.length - i - 1;

      if (digitTersisa > 0 && digitTersisa % 3 == 0) {
        hasil += '.';
      }
    }

    return 'Rp $hasil';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.restaurant),
        title: const Text('Selamat Datang di Angkringan Zadon'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: makanan.length,
        itemBuilder: (context, index) {
          final item = makanan[index];
          final nama = item['nama'] as String;
          final harga = item['harga'] as int;
          final img = item['img'] as String;
          final deskripsi = item['deskripsi'] as String;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  img,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 70,
                    color: Colors.amber.shade100,
                    child: const Icon(Icons.restaurant),
                  ),
                ),
              ),
              title: Text(
                nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '${_formatRupiah(harga)}\n$deskripsi',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      nama: nama,
                      harga: _formatRupiah(harga),
                      img: img,
                      deskripsi: deskripsi,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
