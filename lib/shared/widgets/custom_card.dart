import 'package:trainix/config/imports.dart';

class CustomCard extends StatefulWidget {
  final String title;
  const CustomCard({super.key, required this.title});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.cardBackground,
      ),
      child: Text(widget.title),
    );
  }
}
