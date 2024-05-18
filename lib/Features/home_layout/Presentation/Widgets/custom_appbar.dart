import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 24, vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dehaze_outlined)),
          const Text(
            'Index',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            width: 42,
            height: 42,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const Image(
                    image: AssetImage('assets/images/user.jpg'),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
