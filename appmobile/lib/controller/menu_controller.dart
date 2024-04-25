import 'package:appmobile/models/menu.dart';

class MController {
  final String day;
  MController({required this.day});
  List<Menu> generateMenuForDay() {
    print('Selected Day: $day');
    List<Menu> menus = [];
    switch (day) {
      case 'Saturday':
        menus = [
          Menu(
            picture: "assets/images/dish.png",
            title: 'Dish',
          ),
          Menu(
            picture: "assets/images/pommes.jpg",
            title: 'Pommes',
          ),
          Menu(
            picture: "assets/images/maaqouda.jpg",
            title: 'Mekouda',
          ),
          Menu(
            picture: "assets/images/orange.png",
            title: 'Orange',
          ),
        ];
        break;
      case 'Sunday':
        menus = [
          Menu(
            picture: "assets/images/dish.png",
            title: 'Dish',
          ),
          Menu(
            picture: "assets/images/pommes.jpg",
            title: 'Pommes',
          ),
          Menu(
            picture: "assets/images/maaqouda.jpg",
            title: 'Mekouda',
          ),
          Menu(
            picture: "assets/images/orange.png",
            title: 'Orange',
          ),
        ];
        break;
      case 'Monday':
        menus = [
          Menu(
            picture: "assets/images/dish.png",
            title: 'Dish',
          ),
          Menu(
            picture: "assets/images/pommes.jpg",
            title: 'Pommes',
          ),
          Menu(
            picture: "assets/images/maaqouda.jpg",
            title: 'Mekouda',
          ),
          Menu(
            picture: "assets/images/orange.png",
            title: 'Orange',
          ),
        ];
        break;
      case 'Tuesday':
        menus = [
          Menu(
            picture: "assets/images/dish.png",
            title: 'Dish',
          ),
          Menu(
            picture: "assets/images/pommes.jpg",
            title: 'Pommes',
          ),
          Menu(
            picture: "assets/images/maaqouda.jpg",
            title: 'Mekouda',
          ),
          Menu(
            picture: "assets/images/orange.png",
            title: 'Orange',
          ),
        ];
        break;
      case 'Wednesday':
        menus = [
          Menu(
            picture: "assets/images/dish.png",
            title: 'Dish',
          ),
          Menu(
            picture: "assets/images/pommes.jpg",
            title: 'Pommes',
          ),
          Menu(
            picture: "assets/images/maaqouda.jpg",
            title: 'Mekouda',
          ),
          Menu(
            picture: "assets/images/orange.png",
            title: 'Orange',
          ),
        ];
        break;
      case 'Tursday':
        menus = [
          Menu(
            picture: "assets/images/dish.png",
            title: 'Dish',
          ),
          Menu(
            picture: "assets/images/pommes.jpg",
            title: 'Pommes',
          ),
          Menu(
            picture: "assets/images/maaqouda.jpg",
            title: 'Mekouda',
          ),
          Menu(
            picture: "assets/images/harira.jpg",
            title: 'Harira',
          ),
        ];
        break;
      default:
        menus = [
          Menu(
            picture: "assets/images/dish.png",
            title: 'Dish',
          ),
          Menu(
            picture: "assets/images/pommes.jpg",
            title: 'Pommes',
          ),
          Menu(
            picture: "assets/images/maaqouda.jpg",
            title: 'Mekouda',
          ),
          Menu(
            picture: "assets/images/orange.png ",
            title: 'Orange',
          ),
        ];
        break;
    }
    return menus;
  }
}

 // generateMenuForDay() {}