import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;
  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  List<User> users = [
    User('Unknown1', '0100001', 'a@a.com'), User('Unknown2', '0100002', 'b@b.com'),
    User('Unknown3', '0100003', 'c@c.com'), User('Unknown4', '0100004', 'd@d.com'),
    User('Unknown5', '0100005', 'e@e.com'), User('Unknown6', '0100006', 'f@f.com'),
    User('Unknown7', '0100007', 'g@g.com'), User('Unknown8', '0100008', 'h@h.com'),
    User('Unknown1', '0100001', 'a@a.com'), User('Unknown2', '0100002', 'b@b.com'),
    User('Unknown3', '0100003', 'c@c.com'), User('Unknown4', '0100004', 'd@d.com'),
    User('Unknown5', '0100005', 'e@e.com'), User('Unknown6', '0100006', 'f@f.com'),
    User('Unknown7', '0100007', 'g@g.com'), User('Unknown8', '0100008', 'h@h.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/big.jpeg'),
              ),
              title: Text(users[index].name),
              subtitle: Text(users[index].phone),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                print(users[index].name);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 2, color: Colors.black,);
          },
        ),
      ),
    );
  }
}