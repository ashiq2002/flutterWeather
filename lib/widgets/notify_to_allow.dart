import 'package:flutter/material.dart';

class NotifyToAllowLocation extends StatelessWidget {
  final VoidCallback onPressed;
  const NotifyToAllowLocation({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width / 1.3,
            height: 160,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                Text(
                  'You must have need allow location access to use this app!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, height: 2),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: onPressed,
              child: const Text("Allow"))
        ],
      ),
    );
  }
}
