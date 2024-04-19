import 'package:bloodbank_management/res/colors.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  final List<String> items;
  final String? selected;
  final String title;
  final Function ontap;
  const SearchFilter(
      {super.key,
      required this.title,
      required this.items,
      required this.selected,
      required this.ontap});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: LightAppColors().seedColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: DropdownButtonFormField<String>(
              value: widget.selected,
              items: [
                const DropdownMenuItem<String>(
                  value: '',
                  child: Text('All'),
                ),
                ...List.generate(
                    widget.items.length,
                    (index) => DropdownMenuItem<String>(
                          value: widget.items[index],
                          child: Text(widget.items[index]),
                        ))
              ],
              onChanged: (value) {
                widget.ontap(value);
              },
              elevation: 0,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(
                    widget.title,
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
