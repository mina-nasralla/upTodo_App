import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.icon,
    required this.title, required this.ontap, required this.iconcolor,  this.iconsuf,
  });

  final IconData icon;
  final IconData? iconsuf;
  final Color iconcolor;
  final String title;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: iconcolor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Icon(iconsuf, size: 30)
        ],
      ),
    );
  }
}
