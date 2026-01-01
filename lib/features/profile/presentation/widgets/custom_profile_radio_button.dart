import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class CustomProfileSwitchButton extends StatefulWidget {
  const CustomProfileSwitchButton({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  State<CustomProfileSwitchButton> createState() =>
      _CustomProfileSwitchButtonState();
}

class _CustomProfileSwitchButtonState extends State<CustomProfileSwitchButton> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return Container(
          height: height * 0.06,
          margin: EdgeInsets.only(
            left: width * 0.06,
            right: width * 0.06,
            bottom: 6,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xffDCDDE0),
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 30,
              ),

              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.enM18,
                ),
              ),

              // Switch
              Transform.scale(
                scale: 0.9,
                child: Switch(
                  trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return ColorStyles.primary;
                      }
                      return null;
                    },
                  ),
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  activeThumbColor: ColorStyles.primary,
                  activeTrackColor: Colors.teal.shade100,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
