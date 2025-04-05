import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Column(
        children: [
          Text('Profile'),
          ElevatedButton(onPressed: (){
            context.push('/teste');
          }, child: Text('Home!'))
        ],
      )));
  }
}
