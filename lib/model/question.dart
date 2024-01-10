class Question {
  int id;
  List<String> options;
  int correctAnswer;
  String image;

  Question(this.id, this.options, this.correctAnswer, this.image);
}
final questionList = [
  Question(0, ["Bear", "Lion", "Koala", "Kangaroo"], 2, 'https://www.usatoday.com/gcdn/-mm-/1637044d22191b9453b9c17456ea74428fd3761d/c=299-0-1067-768/local/-/media/2022/03/16/USATODAY/usatsports/imageForEntry5-ODq.jpg'),
  Question(1, ["Apple", "Banana", "Mango", "Pineapple"], 1, 'https://5.imimg.com/data5/AK/RA/MY-68428614/apple.jpg'),
  Question(2, ["Plane", "Car", "Truck", "Boat"], 4, 'https://img.freepik.com/free-vector/wooden-boat-water-surface_1308-140985.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704067200&semt=ais'),
  Question(3, ["Spain", "Germany", "England", "France"], 3, 'https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/1200px-Flag_of_England.svg.png'),
  Question(4, ["Fly", "Butterfly", "Bee", "Spider"], 2, 'https://i.natgeofe.com/k/9acd2bad-fb0e-43a8-935d-ec0aefc60c2f/monarch-butterfly-grass_3x2.jpg'),
];
