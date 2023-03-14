import 'package:frotec/model/mobile.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final Mobile mobile;
  const ListItem({
    super.key,
    required this.mobile,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: (widget.mobile.isFavorite)
              ? const Icon(Icons.star)
              : const Icon(Icons.star_outline),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            setState(() {
              widget.mobile.isFavorite = !widget.mobile.isFavorite;
            });
          },
          tooltip: "Favoritar o contato",
        ),
        const SizedBox(width: 24),
        Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage(widget.mobile.photoPath),
            // ),
            //const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.mobile.plateNumber,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(widget.mobile.nickname,
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {Navigator.pushNamed(context, "/edit");},
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
