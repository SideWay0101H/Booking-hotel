class Hotel {
  final int id;
  final String title;
  final String address;
  final String description;
  final String thumbnailPath;
  final List<String> imagePath;
  final int totalReview;
  final double ratingScore;
  final double price;
  // final LatLng coordinate;

  Hotel(
      {required this.id,
      required this.title,
      required this.address,
      required this.description,
      required this.thumbnailPath,
      required this.imagePath,
      required this.totalReview,
      required this.ratingScore,
      required this.price});

   static List<Hotel> sampleHotels = [
    Hotel(
      id: 1,
      title: 'Room 1',
      thumbnailPath: 'assets/image/thumbnail.png',
      address: '3/2, Xuan Khanh, Ninh Kieu, Can Tho',
      description: 'Welcome the hotel SW',
      imagePath: [
        'assets/image/gallery1.png',
        'assets/image/gallery2.png',
        'assets/image/gallery3.png'
      ],
      price:1313, 
      totalReview: 500000,
      ratingScore: 5,
    ),
    Hotel(
      id: 2,
      title: 'Room 2',
      thumbnailPath: 'assets/image/thumbnai2.png',
      address: '3/2, Xuan Khanh, Ninh Kieu, Can Tho',
      description: 'Welcome the hotel SW',
      imagePath: [
        'assets/image/gallery1.png',
        'assets/image/gallery2.png',
        'assets/image/gallery3.png'
      ],
      price:1313, 
      totalReview: 500000,
      ratingScore: 5,
    ),
    Hotel(
      id: 3,
      title: 'Room 3',
      thumbnailPath: 'assets/image/thumbnail.png',
      address: '3/2, Xuan Khanh, Ninh Kieu, Can Tho',
      description: 'Welcome the hotel SW',
      imagePath: [
        'assets/image/gallery1.png',
        'assets/image/gallery2.png',
        'assets/image/gallery3.png'
      ],
      price:1313, 
      totalReview: 500000,
      ratingScore: 5,
    ),
    Hotel(
      id: 4,
      title: 'Room 4',
      thumbnailPath: 'assets/image/thumbnail.png',
      address: '3/2, Xuan Khanh, Ninh Kieu, Can Tho',
      description: 'Welcome the hotel SW',
      imagePath: [
        'assets/image/gallery1.png',
        'assets/image/gallery2.png',
        'assets/image/gallery3.png'
      ],
      price:1313, 
      totalReview: 500000,
      ratingScore: 5,
    )
   ];
    
}
