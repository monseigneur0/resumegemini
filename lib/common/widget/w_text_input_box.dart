import 'package:flutter/material.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/common/widget/w_text_field_with_delete.dart';

class TextInputBox extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final Function(String)? onChanged;
  final Function()? onTapDelete;
  const TextInputBox(this.textController, {this.hintText = "", this.onChanged, this.onTapDelete, super.key});

  @override
  State<TextInputBox> createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerBoxDecoration(),
      child: TextFieldWithDelete(
        // showMaxCount: 300ew,
        controller: widget.textController,
        textInputAction: TextInputAction.next,
        texthint: widget.hintText,

        onTapDelete: widget.onTapDelete,
        onChanged: widget.onChanged,
      ).p(1),
    );
  }
}

BoxDecoration containerBoxDecoration() {
  return BoxDecoration(
    color: AppColors.grey100,
    border: Border.all(color: AppColors.grey400),
    borderRadius: BorderRadius.circular(8),
  );
}
