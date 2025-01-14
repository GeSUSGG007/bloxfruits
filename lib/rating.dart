import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;
  final ValueChanged<int> onRatingChanged;

  const StarRating({
    required Key key,
    required this.value,
    required this.filledStar,
    required this.unfilledStar,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    const size = 36.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => onRatingChanged(index + 1),
          color: index < value ? color : null,
          iconSize: size,
          icon: Icon(
            index < value ? filledStar : unfilledStar,
          ),
          padding: EdgeInsets.zero,
          tooltip: "${index + 1} of 5",
        );
      }),
    );
  }
}
