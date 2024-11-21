part of 'pages.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Fungsi untuk membuat konten halaman onboarding
  Widget buildPageContent(OnboardingItem item, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Menampilkan logo hanya di halaman pertama
        if (index == 0)
          Image.asset(
            item.img,
            width: 280,
            height: 280,
            fit: BoxFit.contain,
          ),
        
        // Menampilkan animasi Lottie hanya di halaman kedua dan ketiga
        if (index != 0)
          Lottie.asset(
            item.img,
            width: 280, // Atur lebar animasi
            height: 280, // Atur tinggi animasi
            fit: BoxFit.contain,
          ),
        
        const SizedBox(height: 24), // Mengurangi jarak antara gambar/animasi dan teks judul

        Text(
          item.title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 8), // Mengurangi jarak antara judul dan deskripsi

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            item.description,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 5), // Mengurangi jarak antara deskripsi dan tombol "Next"
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Daftar item onboarding
    List<OnboardingItem> listOfItems = [
      OnboardingItem(
        img: "assets/fleurish_logo.png",  // Gambar logo untuk halaman pertama
        title: "Welcome to Fleurish !",
        description:
            "Step into a world where every petal tells a story and every bouquet is crafted to bring smiles and lasting memories.",
      ),
      OnboardingItem(
        img: "assets/lottie1.json",  // Animasi untuk halaman kedua
        title: "Why Fleurish?",
        description:
            "Our mission is simple: to brighten your day with flowers that speak the language of your heart, no matter the occasion.",
      ),
      OnboardingItem(
        img: "assets/lottie2.json",  // Animasi untuk halaman ketiga
        title: "Celebrate Every Moment",
        description:
            "From breathtaking bouquets to stunning arrangements, we’re here to make your moments unforgettable.",
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F8D0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 600,
            child: PageView.builder(
              controller: pageController,
              itemCount: listOfItems.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return buildPageContent(listOfItems[index], index);
              },
            ),
          ),
          const SizedBox(height: 32),
          // Smooth Page Indicator
          SmoothPageIndicator(
            controller: pageController,
            count: listOfItems.length,
            effect: const ExpandingDotsEffect(
              spacing: 8.0,
              radius: 10.0,
              dotWidth: 10.0,
              dotHeight: 10.0,
              expansionFactor: 2,
              dotColor: Colors.grey,
              activeDotColor: Colors.green,
            ),
          ),
          const SizedBox(height: 32),
          // Tombol "Next" atau "Get Started"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == listOfItems.length - 1) {
                    // Jika di halaman terakhir, pindah ke halaman login
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    // Jika belum di halaman terakhir, pindah ke halaman berikutnya
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8787),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  currentIndex == listOfItems.length - 1 ? "Get Started" : "Next",
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
    );
  }
}

// Model untuk item onboarding
class OnboardingItem {
  final String img;
  final String title;
  final String description;

  OnboardingItem({
    required this.img,
    required this.title,
    required this.description,
  });
}
