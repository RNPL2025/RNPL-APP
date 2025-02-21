import 'dart:math';

class AcnooDemoProperties {
  static List<AcnooPropertyModel> properties = [
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room1.jpg',
      title: '4 BHK Independent Builder floor',
      price: 80000,
      address: 'New Riends Coiony, New delhi',
      bedRooms: 2,
      bathRooms: 2,
      flatArea: 3500,
      ownerName: 'Shaidul Ismam',
      facilities: _generateRandomFacilities(),
      amenities: _generateRandomamenities(),
    ),
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room2.jpg',
      title: '7 BHK Independent Builder floor',
      price: 95000,
      address: 'New Riends Coiony, New York',
      bedRooms: 4,
      bathRooms: 5,
      flatArea: 3500,
      ownerName: 'J. Cole',
      facilities: _generateRandomFacilities(),
      amenities: _generateRandomamenities(),
    ),
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room3.jpg',
      title: '2 BHK Independent Builder floor',
      price: 80000,
      address: 'New Riends Coiony, Sacramento',
      bedRooms: 2,
      bathRooms: 2,
      flatArea: 3500,
      ownerName: 'Ruben G. Jackson',
      facilities: _generateRandomFacilities(),
      amenities: _generateRandomamenities(),
    ),
    AcnooPropertyModel(
      imageUrl: 'assets/images/demo_images/demo_room4.jpg',
      title: '2 BHK Independent Builder floor',
      price: 80000,
      address: 'New Riends Coiony, Sacramento',
      bedRooms: 2,
      bathRooms: 2,
      flatArea: 3500,
      ownerName: 'Michael Jackson',
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
    "Security": random.nextBool(),
    "Lift": random.nextBool(),
    "Swimming Pool": random.nextBool(),
    "Playground": random.nextBool(),
    "Gymnasium": random.nextBool(),
    "Sauna": random.nextBool(),
    "Barbeque area": random.nextBool(),
    "Minimart": random.nextBool(),
    "Multipurpose hall": random.nextBool(),
  };
}

Map<String, bool> _generateRandomamenities() {
  final random = Random();
  return {
    "Air - Cond": random.nextBool(),
    "Cooking Allowed": random.nextBool(),
    "Near KTM/LRT": random.nextBool(),
    "Washing Machine": random.nextBool(),
    "Internet": random.nextBool(),
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
