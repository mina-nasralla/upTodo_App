import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/categories_screen/data/Cubit/category_cubit.dart';

class CategoryIconDialog extends StatelessWidget {
  CategoryIconDialog({
    super.key,
  });

  final List<IconData> icons = [
    Icons.directions_run,
    Icons.book,
    Icons.local_dining,
    Icons.cleaning_services,
    Icons.shopping_cart,
    Icons.people,
    Icons.email,
    Icons.palette,
    Icons.self_improvement,
    Icons.family_restroom,
    Icons.local_mall,
    Icons.directions_car,
    Icons.videogame_asset,
    Icons.account_balance_wallet,
    Icons.network_cell,
    Icons.pets,
    Icons.eco,
    Icons.volunteer_activism,
    Icons.event,
    Icons.spa,
    Icons.schedule,
    Icons.build,
    Icons.local_laundry_service,
    Icons.work,
    Icons.create,
    Icons.school,
    Icons.language,
    Icons.camera_alt,
    Icons.warning_amber_outlined,
    Icons.account_balance_outlined,
    Icons.sailing_outlined,
    Icons.dashboard_outlined,
    Icons.access_alarm,
    Icons.accessibility,
    Icons.account_box,
    Icons.airplanemode_active,
    Icons.attach_file,
    Icons.beach_access,
    Icons.bluetooth,
    Icons.brush,
    Icons.camera,
    Icons.cake,
    Icons.cast,
    Icons.cloud,
    Icons.desktop_mac,
    Icons.directions_bike,
    Icons.dns,
    Icons.euro_symbol,
    Icons.favorite,
    Icons.flash_on,
    Icons.gavel,
    Icons.headset,
    Icons.home,
    Icons.insert_emoticon,
    Icons.keyboard,
    Icons.laptop,
    Icons.mail,
    Icons.mic,
    Icons.movie,
    Icons.palette,
    Icons.phone,
    Icons.pie_chart,
    Icons.radio,
    Icons.satellite,
    Icons.speaker,
    Icons.star,
    Icons.terrain,
    Icons.thumb_up,
    Icons.toys,
    Icons.watch,
    Icons.wifi,
    Icons.zoom_out_map,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Select an Icon'),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(icons.length, (index) {
                return IconButton(
                  icon: Icon(icons[index], size: 30.0),
                  onPressed: () {
                    CategoryCubit.get(context).choosedicon=icons[index];
                    print('Icon $index selected');
                    print(CategoryCubit.get(context).choosedicon);
                    Navigator.of(context).pop();
                  },
                );
              }),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
