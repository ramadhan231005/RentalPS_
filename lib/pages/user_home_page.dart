import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  static const Color accentOrange = Color(0xFFE8822A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Temukan Rental PS',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2D3A45),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Lihat Peta'),
                  )
                ],
              ),
              const SizedBox(height: 18),
              _buildSearchField(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.66,
                  children: const [
                    RentalCard(
                      title: "Gamer's Paradise",
                      location: 'Jakarta Selatan',
                      imageUrl:
                          'https://picsum.photos/id/1018/600/400',
                      available: '5/10',
                      price: 'Rp15.000',
                    ),
                    RentalCard(
                      title: 'PS Hub Bandung',
                      location: 'Bandung',
                      imageUrl:
                          'https://picsum.photos/id/1015/600/400',
                      available: '2/5',
                      price: 'Rp12.000',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search, color: Colors.black38),
        hintText: 'Cari berdasarkan nama atau lokasi...',
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFF6F8F9)),
            child: Row(
              children: const [
                Icon(Icons.videogame_asset, size: 36, color: Colors.blue),
                SizedBox(width: 12),
                Text('RentPlay', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Beranda'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Riwayat Sewa'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: Row(
              children: const [
                Text('Pesan'),
                SizedBox(width: 8),
                CircleAvatar(radius: 9, backgroundColor: accentOrange, child: Text('1', style: TextStyle(fontSize: 11, color: Colors.white))),
              ],
            ),
            onTap: () {},
          ),
          const Spacer(),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text('Pengguna Biasa'),
            subtitle: const Text('user@example.com'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class RentalCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String available;
  final String price;

  const RentalCard({
    Key? key,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.available,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(imageUrl, height: 120, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16, color: Colors.black45),
                    const SizedBox(width: 6),
                    Expanded(child: Text(location, style: const TextStyle(color: Colors.black54))),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.desktop_windows, color: Colors.blue, size: 18),
                        const SizedBox(width: 6),
                        Text(available, style: const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(price, style: const TextStyle(fontWeight: FontWeight.w700)),
                        const Text('per jam', style: TextStyle(color: Colors.black45, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 42,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: UserHomePage.accentOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Lihat Detail & Pesan'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
