part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data bouquet lengkap
    final List<Map<String, String>> bouquetData = [
      {
        'image': 'assets/bouquet1.jpg',
        'title': 'Blush blossom bouquet',
        'description':
            'A delicate bouquet of pink blooms, perfect for celebrating love and life’s sweetest moments.',
      },
      {
        'image': 'assets/bouquet2.jpg',
        'title': 'Pastel charm bouquet',
        'description':
            'A beautiful mix of pastel flowers to brighten anyone’s day with its soft, enchanting charm.',
      },
      {
        'image': 'assets/bouquet3.jpg',
        'title': 'Golden sunrise bouquet',
        'description':
            'Bursting with warm colors, this bouquet radiates the beauty of a golden sunrise.',
      },
      {
        'image': 'assets/bouquet4.jpg',
        'title': 'Lavender delight bouquet',
        'description':
            'A serene arrangement of lavender blooms, perfect for creating a calming ambiance.',
      },
      {
        'image': 'assets/bouquet5.jpg',
        'title': 'Rosy romance bouquet',
        'description':
            'The ultimate bouquet for romance, featuring vibrant red roses to express deep love.',
      },
      {
        'image': 'assets/bouquet6.jpg',
        'title': 'Spring garden bouquet',
        'description':
            'A lively collection of fresh, colorful flowers inspired by the beauty of spring.',
      },
      {
        'image': 'assets/bouquet7.jpg',
        'title': 'Elegant white bouquet',
        'description':
            'A timeless bouquet of white flowers, embodying elegance and sophistication.',
      },
      {
        'image': 'assets/bouquet8.jpg',
        'title': 'Vibrant sunset bouquet',
        'description':
            'A bold mix of orange and pink blooms, reminiscent of a breathtaking sunset.',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F8D0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F8D0),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF4F8D0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFFF8787),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome, Ivone!',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.black),
              title: const Text('Cart'),
              onTap: () {
                // Tambahkan logika navigasi ke halaman Cart
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text('Log Out'),
              onTap: () {
                // Tambahkan logika log out (contoh: navigasi ke halaman login)
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
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
            Text(
              "Artificial bouquets",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            // GridView untuk item bouquet
            Expanded(
              child: GridView.builder(
                itemCount: bouquetData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final bouquet = bouquetData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            image: bouquet['image']!,
                            title: bouquet['title']!,
                            description: bouquet['description']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.asset(
                              bouquet['image']!,
                              fit: BoxFit.cover,
                              height: 120,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              bouquet['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
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
        currentIndex: 0, // Menandai halaman ini sebagai aktif
        onTap: (index) {
          if (index == 0) {
            // Halaman Home (sudah aktif)
          } else if (index == 1) {
            // Halaman Cart (tambahkan logika di sini jika ada)
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
