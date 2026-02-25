import 'package:flutter/material.dart';

class RentalDetailPage extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String available;
  final String price;
  final void Function(String title, String location, String imageUrl, String price) onBook;

  const RentalDetailPage({Key? key, required this.title, required this.location, required this.imageUrl, required this.available, required this.price, required this.onBook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail & Pesan'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl, height: 200, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16, color: Colors.black54),
                  const SizedBox(width: 6),
                  Text(location, style: const TextStyle(color: Colors.black54)),
                ],
              ),
              const SizedBox(height: 12),
              Text('Tersedia: $available', style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text('Harga: $price per jam', style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              const Text('Deskripsi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text('Tempat ini menyediakan fasilitas bermain PlayStation dengan suasana nyaman, koneksi internet stabil, serta pilihan game terbaru.'),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    onBook(title, location, imageUrl, price);
                    Navigator.pop(context);
                  },
                  child: const Text('Pesan Sekarang'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
