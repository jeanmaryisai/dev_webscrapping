import 'package:hive/hive.dart';

import 'models/Cart.dart';

class CartService {
  static const String _cartBoxName = 'box4';
  List<Cart> cartList=List.empty(growable: true);
  Future<void> addItemToCart(Map<String, dynamic> item) async {
    final box =  Hive.box(_cartBoxName);
    box.add(item);
  }

  Future<List<Cart>> getCartItems({required int userId}) async {
    final box =  Hive.box(_cartBoxName);

    for (var el in box.values.toList()) {
      if (el['userId']==userId){
       
       cartList.add((Cart(userId:el['userId'],productId: el['productId'],price: el['price'],productName: el['productName'],paid: el['paid'],quantity: el['quantity'] )));

      }
    }
    return cartList;
  }

  Future<void> removeItemFromCart(int index) async {
    final box =  Hive.box(_cartBoxName);
    box.deleteAt(index);
  }
}

class FavoriteService {
  static const String _cartBoxName = 'fav4';
  List<FavoriteProduct> cartList=List.empty(growable: true);
  Future<void> addItemToCart(Map<String, dynamic> item) async {
    final box =  Hive.box(_cartBoxName);
    box.add(item);
  }

  Future<List<FavoriteProduct>> getCartItems({required int userId}) async {
    final box =  Hive.box(_cartBoxName);
    box.values.toList().forEach((el) {
      if (el['userId']==userId){
      cartList.add(FavoriteProduct(price: el['price'],productId: el['productId'],userId: el['userId'],productName: el['productName'])); 
        }
  });
    return cartList;
  }

  Future<void> removeItemFromCart(int index) async {
    final box =  Hive.box(_cartBoxName);
    box.deleteAt(index);
  }
}
