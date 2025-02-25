import 'dart:math';

class AcnooDemoProperties {
  static List<AcnooPropertyModel> properties = [
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room1.jpg',
      title: 'Artist Loft',
      price: 5500,
      address: '123 3rd Avenue, New York',
      bedRooms: 2,
      bathRooms: 2,
      flatArea: 800,
      ownerName: 'Wright Realty Group',
      facilities: _generateRandomFacilities(),
      amenities: _generateRandomamenities(),
    ),
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room2.jpg',
      title: 'Spacious 2 Bedroom',
      price: 4250,
      address: '24 Bedford Avenue, Brooklyn',
      bedRooms: 4,
      bathRooms: 5,
      flatArea: 3500,
      ownerName: 'Newport Property Management',
      facilities: _generateRandomFacilities(),
      amenities: _generateRandomamenities(),
    ),
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room3.jpg',
      title: 'Sunny open plan studio',
      price: 2550,
      address: '55 33rd Street, New York',
      bedRooms: 2,
      bathRooms: 2,
      flatArea: 3500,
      ownerName: 'Ruben G. Jackson',
      facilities: _generateRandomFacilities(),
      amenities: _generateRandomamenities(),
    ),
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room4.jpg',
      title: '428 31st Str, Astoria',
      price: 80000,
      address: 'New Riends Coiony, Sacramento',
      bedRooms: 2,
      bathRooms: 2,
      flatArea: 3500,
      ownerName: 'RPPM LLC',
      facilities: _generateRandomFacilities(),
      amenities: _generateRandomamenities(),
    ),
  ];
}

//Generate random facility & amenities values [For Demo purpose only]
Map<String, bool> _generateRandomFacilities() {
  final random = Random();
  return {
    "Parking": random.nextBool(),
    "Doorman": random.nextBool(),
    "Swimming Pool": random.nextBool(),
    "Playground": random.nextBool(),
    "Gym": random.nextBool(),
    "Sauna": random.nextBool(),
    "Barbeque area": random.nextBool(),
    "Minimart": random.nextBool(),
    "Roof Deck": random.nextBool(),
  };
}

Map<String, bool> _generateRandomamenities() {
  final random = Random();
  return {
    "Near Park": random.nextBool(),
    "Near Subway": random.nextBool(),
    "Washing/Dryer": random.nextBool(),
    "Fireplace": random.nextBool(),
  };
}

class AcnooPropertyModel {
  final String imageUrl;
  final String title;
  final int price;
  final String address;
  final int bedRooms;
  final int bathRooms;
  final int flatArea;
  final String ownerName;
  final Map<String, bool> facilities;
  final Map<String, bool> amenities;

  AcnooPropertyModel({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.address,
    required this.bedRooms,
    required this.bathRooms,
    required this.flatArea,
    required this.ownerName,
    required this.facilities,
    required this.amenities,
  });
}
