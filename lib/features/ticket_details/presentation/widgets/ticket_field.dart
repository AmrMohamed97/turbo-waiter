import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TicketInfoField extends StatelessWidget {
  const TicketInfoField({
    super.key,
    this.icon,
    required this.label,
    required this.value,
    this.iconSvg,
  });
  final String? iconSvg;
  final IconData? icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2F48),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          icon == null
              ? SvgPicture.asset(
                  iconSvg!,
                  colorFilter: const ColorFilter.mode(
                    Colors.purpleAccent,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(icon, color: Colors.purpleAccent),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),

          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 20),
                scrollDirection: Axis.horizontal,
                child: SelectableText(
                  value.isNotEmpty ? value : "---",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
