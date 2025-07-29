import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userdetail extends StatelessWidget {
  Userdetail({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user!.photoURL ?? ''),
            radius: 30,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.displayName ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(user!.email ?? '', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
