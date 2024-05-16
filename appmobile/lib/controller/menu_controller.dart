import 'package:appmobile/models/menu.dart';

class MController {
    static List<Menu> getMenuForDay(String day) {
    switch (day) {
      case "Sun":
        return sundayMenu;
      case "Mon":
        return mondayMenu;
      case "Tue":
        return tuesdayMenu;
      case "Wed":
        return wednesdayMenu;
      case "Thu":
        return thursdayMenu;
      default:
        return [];
    }}
    static List<Menu> sundayMenu = [
      Menu(picture: "assets/images/dish.png", title: 'Dish'),
    Menu(picture: 'assets/images/pommes.jpg', title: 'Apple'),
    
  ];

  static List<Menu> mondayMenu = [
    Menu(picture: "assets/images/dish.png", title: 'Dish'),
    Menu(picture: "assets/images/pommes.jpg", title: 'Apple'),
    Menu(picture: "assets/images/maaqouda.jpg",  title: 'Maekouda'),
    Menu(picture: "assets/images/orange.png",  title: 'Orange'),
  ];

  static List<Menu> tuesdayMenu = [
      Menu(picture: "assets/images/dish.png", title: 'Dish'),
    Menu(picture: "assets/images/pommes.jpg", title: 'Apple'),
    Menu(picture: "assets/images/maaqouda.jpg",  title: 'Maekouda'),
    
  ];

  static List<Menu> wednesdayMenu = [
      Menu(picture: "assets/images/dish.png", title: 'Dish'),
    Menu(picture: "assets/images/pommes.jpg", title: 'Apple'),
    Menu(picture: "assets/images/maaqouda.jpg",  title: 'Maekouda'),
    Menu(picture: "assets/images/orange.png",  title: 'Orange'),
      Menu(picture: "assets/images/dish.png", title: 'Dish'),
    Menu(picture: "assets/images/pommes.jpg", title: 'Apple'),
    Menu(picture: "assets/images/maaqouda.jpg",  title: 'Maekouda'),
    Menu(picture: "assets/images/orange.png",  title: 'Orange'),
    
  ];

  static List<Menu> thursdayMenu = [
    Menu(picture: "assets/images/dish.png", title: 'Dish'),
    Menu(picture: "assets/images/pommes.jpg", title: 'Apple'),
    Menu(picture: "assets/images/maaqouda.jpg",  title: 'Maekouda'),
    Menu(picture: "assets/images/orange.png",  title: 'Orange'),


  ];
}

 