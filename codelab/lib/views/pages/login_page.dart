part of 'pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8D0), // Warna latar belakang
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo dan judul aplikasi
            Column(
              children: [
                Image.asset(
                  'assets/fleurish_logo.png', // Ganti dengan lokasi file logo Anda
                  height: 220,
                  width: 220,
                ),
                const SizedBox(height: 16),
              ],
            ),
            const SizedBox(height: 48), // Jarak antara logo dan form login

            // Form login
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Field Email
                Text(
                  'Email *',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'liwangivone@gmail.com',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field Password
                Text(
                  'Password *',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '********',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Tombol Login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman HomePage
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8787),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
