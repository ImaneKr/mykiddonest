import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appmobile/models/menu.dart';

class MController {
  static final String baseUrl = 'https://backend-1-dg5f.onrender.com';

  static Future<List<Map<String, dynamic>>> fetchMenu() async {
    final response = await http.get(Uri.parse('$baseUrl/lunchmenu/'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((dynamic item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to get lunch menu.');
    }
  }

  static String bufferToStringUrl(Map<String, dynamic> buffer) {
    List<int> data = List<int>.from(buffer['data']);
    return utf8.decode(data);
  }

  static List<Menu> _mapMenuDataToMenuList(Map<String, dynamic> menuData) {
    List<Menu> menuList = [];
    for (int i = 1; i <= 4; i++) {
      String itemNameKey = 'item${i}_name';
      String itemImageKey = 'item${i}_image_url';
      if (menuData[itemNameKey] != null) {
        menuList.add(Menu(
          title: menuData[itemNameKey],
          picture: 'assets/images/dish.jpg',
        ));
      }
    }
    return menuList;
  }

  static Future<List<Menu>> getMenuForDay(String day) async {
    List<Map<String, dynamic>> menuData = await fetchMenu();
    List<Menu> dayMenu = menuData
        .where((meal) => meal['day_of_week'].substring(0, 3) == day)
        .expand((meal) => _mapMenuDataToMenuList(meal))
        .toList();
    return dayMenu;
  }
}
