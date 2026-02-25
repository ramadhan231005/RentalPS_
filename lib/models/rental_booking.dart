class RentalBooking {
  final String title;
  final String location;
  final String imageUrl;
  final String price;
  final DateTime bookedAt;

  RentalBooking({required this.title, required this.location, required this.imageUrl, required this.price, DateTime? bookedAt}) : bookedAt = bookedAt ?? DateTime.now();
}
