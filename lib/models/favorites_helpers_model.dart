class FavoritesHelpersModel {
  String avatar;
  String email;
  String phone;
  String ID;
  double rating;
  bool isVerified;

  FavoritesHelpersModel({
    required this.avatar,
    required this.email,
    required this.phone,
    required this.ID,
    required this.rating,
    required this.isVerified,
  });
}

class FavoritesHelpersList {
  static List<FavoritesHelpersModel> list = [
    FavoritesHelpersModel(
      avatar:
          'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      email: 'joe.doe@gmail.com',
      phone: '786-243-7526',
      ID: '09-05761234',
      rating: 4.8,
      isVerified: true,
    ),
    FavoritesHelpersModel(
      avatar:
          'https://images.unsplash.com/photo-1520409364224-63400afe26e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      email: 'joe.doe@gmail.com',
      phone: '786-243-7526',
      ID: '09-05761234',
      rating: 4.9,
      isVerified: false,
    ),
  ];
}
