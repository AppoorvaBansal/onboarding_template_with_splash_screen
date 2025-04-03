import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Column(
        children: [
          // Profile Card
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://tse4.mm.bing.net/th?id=OIP.dIIR17SWwDN2wlv_x4JVUgHaHa&pid=Api&P=0&h=180')),
              title: Text('Appoorva Bansal'),
              subtitle: Text('Flutter Developer'),
            ),
          ),
          // Image Gallery using GridView
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Card(
                  child:Image(image: AssetImage('assets/images/imageA-$index.jpg'),height: 25,width: 25, ),
                  //Image.network('https://example.com/image$index.jpg', fit: BoxFit.cover),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
