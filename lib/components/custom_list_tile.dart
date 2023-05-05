import 'package:flutter/material.dart';
import 'package:mental_health/components/lottie_widget.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.path,
      required this.title,
      required this.subtitle,
      required this.screen});
  final String path;
  final String title;
  final String subtitle;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen,
              ));
        },
        child: ListTile(
          leading: LottieWidget(path: path),
          title: Text(
            title,
          ),
          subtitle: Text(
            subtitle,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          dense: false,
        ),
      ),
    );
  }
}
