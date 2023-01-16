class Request {
  String date;
  String location;
  String description;
  String category;
  String image;
  int status;

  Request({
    required this.date,
    required this.location,
    required this.category,
    required this.description,
    required this.image,
    required this.status,
  });
}
