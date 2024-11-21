part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar data bouquet
    final List<String> bouquetImages = [
      'assets/bouquet1.jpg',
      'assets/bouquet2.jpg',
      'assets/bouquet3.jpg',
      'assets/bouquet4.jpg',
      'assets/bouquet5.jpg',
      'assets/bouquet6.jpg',
      'assets/bouquet7.jpg',
      'assets/bouquet8.jpg',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F8D0), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F8D0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {}, // Tambahkan aksi jika diperlukan
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {}, // Tambahkan aksi jika diperlukan
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Judul kategori
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // GridView untuk menampilkan bouquet
            Expanded(
              child: GridView.builder(
                itemCount: bouquetImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah item per baris
                  crossAxisSpacing: 16, // Jarak horizontal antar item
                  mainAxisSpacing: 16, // Jarak vertikal antar item
                  childAspectRatio: 0.8, // Proporsi lebar:tinggi untuk item
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        bouquetImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF4F8D0),
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}