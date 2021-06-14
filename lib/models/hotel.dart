class Hotel {
  String imageUrl;
  String name;
  String city;
  String country;
  int price;
  String description;

  Hotel({
    this.imageUrl,
    this.name,
    this.city,
    this.country,
    this.price,
    this.description
  });
}

// ignore: non_constant_identifier_names
final List<Hotel> top_hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Mandarian Oriental',
    city: 'Tokyo',
    country: 'Japan',
    price: 289,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'The Peninsula',
    city: 'Hong Kong',
    country: 'China',
    price: 614,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Raes on Watego',
    city: 'Byron Bay',
    country: 'Australia',
    price: 630,
  ),
];
