import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:dara_store/models/Cart.dart';
import 'package:dara_store/models/Product.dart';
import 'package:dara_store/repo.dart';
import 'package:http/http.dart';

import 'db.dart';
import 'models/category.dart';
import 'models/user.dart';

void fav(Product p) {
  if (p.isFavorite) {
    p.isFavorite = false;
    demoFav.remove(p);
  } else {
    p.isFavorite = true;
    demoFav.add(p);
  }
}

void addCart(Product p) {
  demoCarts.forEach((element) {
    if (element.product.id == p.id) {
      element.numOfItem++;
      CartService().addItemToCart({currentUser.username: element});
      CartService().addItemToCart({currentUser.username: element});
      return;
    }
  });
  demoCarts.add(Cart(product: p, numOfItem: 1, userId: currentUser.id));
  CartService().addItemToCart({
    currentUser.username: Cart(product: p, numOfItem: 1, userId: currentUser.id)
  });

  final box = Hive.box('box4');
  print(box.values);
}

void removeFromCart(Product p) {
  demoCarts.forEach((element) {
    if (element.product.id == p.id) {
      demoCarts.remove(element);
    }
  });
}

List<User> users = [
  User(
      id: -1,
      username: 'admin',
      password: 'admin',
      avatar: 'assets/images/Profile Image.png',
      name: 'isai'),
];

void retriveData() async {
  Client client = http.Client();
  List response0 = json.decode(
      (await client.get(Uri.parse('https://api.escuelajs.co/api/v1/users')))
          .body);

  response0.forEach((item) {
    users.add(User(
        name: item['name'],
        id: item['id'],
        username: item['email'],
        password: item['password'],
        avatar: item['avatar']));
    print(item);
  });

  List<Product> products = [];

  List response = json.decode((await client.get(Uri.parse(
          'https://api.escuelajs.co/api/v1/products?offset=0&limit=10')))
      .body);
  var counter = 1;
  response.forEach((item) {
    var isP = true;
    if (counter >= 5) {
      isP = false;
    }
    print(item);
    products.add(Product(
      id: item['id'] as int,
      title: item['title'],
      description: item['description'],
      price: item['price']
          .toDouble(), // Par défaut, le produit a une quantité de 1
      images: item['images'],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      isPopular: isP,
      caterogyId: item['category']['id'],
    ));
    counter++;
  });
  demoProducts = products;

  List<Category> categoriees = [];
  List response2 = json.decode((await client
          .get(Uri.parse('https://api.escuelajs.co/api/v1/categories')))
      .body);
  response2.forEach((item) {
    var isP = true;
    if (counter >= 5) {
      isP = false;
    }
    categoriees.add(Category(
      id: item['id'],
      image: item['image'],
      category: item['name'],
    ));
    demoCategories = categoriees;
  });
}

List<Product> getProductsByCategory(Category category) {
  List<Product> products = [];
  demoProducts.forEach((element) {
    if (element.caterogyId == category.id) {
      products.add(element);
    }
  });
  return products;
}


//   Future<void> postLoginData(String email, String password) async {
//   // The URL of the API endpoint
//   String apiUrl = 'https://api.escuelajs.co/api/v1/auth/login';

//   // The data to be sent in the request
//   Map<String, dynamic> data = {
//     'email': email,
//     "password": password,
//   };

//   try {
    
//     // Send a POST request to the API endpoint
//     var http;
//     http.Response response = await http.post(
//       Uri.parse(apiUrl),
//       headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//       body: jsonEncode(data),
//     );
//    print(response);
//     if (response.statusCode == 201) {
//       getprofileAndConnect(jsonDecode(response.body)['access_token']);
//       //  gettoStore();
//     print('Data posted successfully');
//   } else {
//     print('Failed to post data. Error: ${response.statusCode}');
//   }
//   } catch (e) {
//   print('Error occurred: $e');
// }
