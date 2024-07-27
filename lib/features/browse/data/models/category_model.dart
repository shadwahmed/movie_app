class CategoryModel {
  String name;
  String id;
  String imagePath;

  CategoryModel({required this.name, required this.id, required this.imagePath});

  static List<CategoryModel> categories = [
    CategoryModel(
        name: "Action",
        id: "28",
        imagePath: "assets/images/categories_images/action.jpg"),
    CategoryModel(
        name: "Adventure",
        id: "12",
        imagePath: "assets/images/categories_images/adventure.jpg"),
    CategoryModel(
        name: "Animation",
        id: "16",
        imagePath: "assets/images/categories_images/animation.jpg"),
    CategoryModel(
        name: "Comedy",
        id: "35",
        imagePath: "assets/images/categories_images/comedy.jpg"),
    CategoryModel(
        name: "Crime",
        id: "80",
        imagePath: "assets/images/categories_images/crime.jpg"),
    CategoryModel(
        name: "Documentary",
        id: "99",
        imagePath: "assets/images/categories_images/Documentary.jpg"),
    CategoryModel(
        name: "Drama",
        id: "18",
        imagePath: "assets/images/categories_images/Drama.jpg"),
    CategoryModel(
        name: "Family",
        id: "10751",
        imagePath: "assets/images/categories_images/Family.jpg"),
    CategoryModel(
        name: "Fantasy",
        id: "14",
        imagePath: "assets/images/categories_images/Fantasy.jpg"),
    CategoryModel(
        name: "History",
        id: "36",
        imagePath: "assets/images/categories_images/History.jpg"),
    CategoryModel(
        name: "Horror",
        id: "27",
        imagePath: "assets/images/categories_images/horror.jpg"),
    CategoryModel(
        name: "Music",
        id: "10402",
        imagePath: "assets/images/categories_images/musicc.jpg"),
    CategoryModel(
        name: "Mystery",
        id: "9648",
        imagePath: "assets/images/categories_images/mystery.jpg"),
    CategoryModel(
        name: "Romance",
        id: "10749",
        imagePath: "assets/images/categories_images/Romance.jpg"),
    CategoryModel(
        name: "Science Fiction",
        id: "878",
        imagePath: "assets/images/categories_images/science.jpg"),
    CategoryModel(
        name: "TV Movie",
        id: "10770",
        imagePath: "assets/images/categories_images/TV Movie.jpg"),
    CategoryModel(
        name: "Thriller",
        id: "53",
        imagePath: "assets/images/categories_images/thriller.jpg"),
    CategoryModel(
        name: "War",
        id: "10752",
        imagePath: "assets/images/categories_images/war.jpg"),
    CategoryModel(
        name: "Western",
        id: "37",
        imagePath: "assets/images/categories_images/western.jpg"),
  ];
}