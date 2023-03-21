import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        // padding: const EdgeInsets.symmetric(
        //   vertical: 16,
        //   horizontal: 16,
        // ),
        // child: Column(
        //   children: [
        //     Card(
        //       child: Padding(padding: const EdgeInsets.all(16),
        //       child: Row(
        //         children: [titleText],
        //       ),),
        //     )
        //   ],
        // ),
      ),
    );
  }
  // Text loginText({
  //   required String Text
  // })
}
