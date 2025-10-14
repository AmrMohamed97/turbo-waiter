import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TicketCardSection extends StatelessWidget {
  final String title;
  final String? iconSvg;
  final IconData? icon;
  final List<Widget> fields;

  const TicketCardSection({
    super.key,
    required this.title,
    this.icon,
    this.iconSvg,
    required this.fields,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.purple.shade700,
                radius: 28,
                child: icon == null
                    ? SvgPicture.asset(
                        iconSvg!,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      )
                    : Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(),
          SizedBox(),
          ...fields,
        ],
      ),
    );
  }
}
