import 'package:flutter/material.dart';
import '../models/rental_booking.dart';

class RentalHistoryPage extends StatelessWidget {
  final List<RentalBooking> bookings;

  const RentalHistoryPage({Key? key, required this.bookings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Sewa'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: bookings.isEmpty
          ? const Center(child: Text('Belum ada riwayat sewa'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final b = bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(b.imageUrl, width: 56, height: 56, fit: BoxFit.cover)),
                    title: Text(b.title),
                    subtitle: Text('${b.location} • ${b.price}'),
                    trailing: Text('${b.bookedAt.day}/${b.bookedAt.month}/${b.bookedAt.year}'),
                  ),
                );
              },
            ),
    );
  }
}
