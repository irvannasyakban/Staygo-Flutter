// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.google.com/maps?q=5.206778,97.072333');
final Uri _whatsappUrl = Uri.parse('https://api.whatsapp.com/send?phone=6285358868477&text=Halo%20saya%20mau%20bertanya%20tentang%20Kamar%20Kost%20nya');

class DetailKost extends StatefulWidget {
  const DetailKost({super.key});

  @override
  State<DetailKost> createState() => _DetailKostState();
}

class _DetailKostState extends State<DetailKost> {
  int _currentIndex =
      0; // For tracking the index of the current page in the PageView

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchWhatsApp() async {
    if (!await launchUrl(_whatsappUrl)) {
      throw Exception('Could not launch $_whatsappUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar:
          true, // Extend body behind the AppBar to overlap it
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8), // Margin to add space around the button
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Background color of the circle
          ),
          child: Transform.translate(
            offset: Offset(4, 0), // Shift to the right by 4 pixels
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel for images
            Container(
              height: 260, // Adjust height of the image container
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: [
                  Image.asset(
                    'assets/detailkos1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/kos2.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // Border radius decoration below the carousel
            Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),

            // Page indicators for the carousel
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIndicator(0 == _currentIndex),
                SizedBox(width: 5),
                buildIndicator(1 == _currentIndex),
              ],
            ),

            // Kost Detail Information Section Full Screen Width
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding:
                  const EdgeInsets.all(15.0), // Padding inside the container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kost Title
                  Text(
                    'Kost Pak Mukhsin, Jl. Bukit Indah',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Location Row
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20, color: Colors.blue),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Jl. Bukit Indah, Muara Satu, Lhokseumawe',
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp 10.000.000',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '/Pertahun',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Rating Row
                  Row(
                    children: [
                      Icon(Icons.star, size: 20, color: Colors.orange),
                      SizedBox(width: 5),
                      Text(
                        '4,5/5 (100 reviewers)',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Availability Row
                  Row(
                    children: [
                      Icon(Icons.check_circle, size: 20, color: Colors.green),
                      SizedBox(width: 5),
                      Text(
                        '2 Tersedia',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Type of Kost
                  Text(
                    'Kost Khusus Wanita',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 7),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fasilitas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(
                      height: 10), // Spacing between search bar and buttons

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryButton('assets/icon-tv.png', 'TV'),
                      _buildCategoryButton('assets/icon-lemari.png', 'Lemari'),
                      _buildCategoryButton(
                          'assets/icon-tempat-tidur.png', 'Tempat Tidur'),
                      _buildCategoryButton('assets/icon-ac.png', 'AC'),
                    ],
                  ),

                  SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kebijakan Properti',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPolicyItem(
                          '1. Seluruh fasilitas kost, hanya diperuntukkan bagi Penyewa kost/penyewa kamar, bukan untuk umum.'),
                      SizedBox(height: 5),
                      _buildPolicyItem(
                          '2. Penyewa kost dilarang menerima tamu dan/atau membawa teman ke kamar kost. Sebaiknya menerima tamu atau teman adalah di tempat terbuka atau tempat umum lainnya, seperti warung atau café/resto.'),
                      SizedBox(height: 5),
                      _buildPolicyItem(
                          '3. Penyewa kost tidak diperkenankan merokok di dalam kamar maupun di lingkungan rumah kost.'),
                    ],
                  ),

                  SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Deskripsi Properti',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Luas Kamar 6x4m lengkap dengan kamar mandi di dalam, terdapat halaman, area parkir yang luas, lingkungan yang nyaman dan CCTV 24 jam.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Lokasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Jl.Bukit Indah, Kec. Muara Satu',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  Center(
                    child: TextButton(
                      onPressed: _launchUrl,
                      child: Text(
                        'Buka Google Maps',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Adjust padding if needed
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _launchWhatsApp,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF06283D), // Same color as given
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Rounded corners
              ),
              padding:
                  EdgeInsets.symmetric(vertical: 15), // Height of the button
            ),
            child: Text(
              'Pesan Kost',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Widget to build carousel page indicators
  Widget buildIndicator(bool isActive) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }

  Widget _buildCategoryButton(String imagePath, String label) {
    return Column(
      children: [
        Container(
          width: 80, // Adjust width of the button
          height: 80, // Adjust height of the button
          decoration: BoxDecoration(
            color: Color(0xFFD3EAFF),
            borderRadius: BorderRadius.circular(20), // Set border radius to 20
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0), // Padding for the image
            child: Image.asset(imagePath), // Load image from assets
          ),
          alignment: Alignment.center, // Center the icon
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  // Widget to build each policy item
  Widget _buildPolicyItem(String policyText) {
    return Text(
      policyText,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black54, // Reduced opacity for a lighter color
      ),
    );
  }
}
