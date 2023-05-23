
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../products/products_screen.dart';
import '../../sign_in/sign_in_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Profile Image.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text('lis prodwi'),
            onTap: () {
              Navigator.pushNamed(context, ProductsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('paramet'),
            onTap: () {
             
            },
          ),
          Divider(), // Ajoute une ligne de séparation
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('dekoneksyon'),
            onTap: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}


class drawer_home extends StatelessWidget {
  const drawer_home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Isai Boutik',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.list_alt_outlined),
          title: Text('Lis pwodwi'),
          onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => HelloWorldPage(
          //         add: _addToCart,
          //         addWish: _addToWish,
          //       ),
          //     ),
          //   );
          },
        ),
        ListTile(
          leading: Icon(Icons.login_outlined),
          title: Text('Dekonekte'),
          onTap: () {
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(builder: (context) => LoginPage()),
            // );
          },
        ),
      ],
    ),
      );
  }
}
