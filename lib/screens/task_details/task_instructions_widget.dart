import 'package:flutter/material.dart';
import 'package:social_bucks/core/app_export.dart';
import 'package:social_bucks/widgets/locale_text.dart';

class InstructionWidget extends StatelessWidget {
  final Map<String, dynamic> instructions;

 InstructionWidget({Key? key, required this.instructions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: instructions.entries.map((entry) => _buildInstruction(entry.key, entry.value)).toList(),
    );
  }

  Widget _buildInstruction(String text, dynamic subInstructions) {
    if (subInstructions == null) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.v),
        child: Text.rich(
          TextSpan(
            text: '• ',
            children: _parseText(text),
          ),
        ),
      );
    } else if (subInstructions is Map) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: '• ',
                children: _parseText(text),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subInstructions.entries
                    .map<Widget>((subEntry) => _buildInstruction(subEntry.key, subEntry.value))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    } else if (subInstructions is List) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: '',
                children: _parseText(text),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Column(
                children: subInstructions.map<Widget>((item) => LocaleText(item.toString())).toList(),
              ),
            ),
          ],
        ),
      );
    } else {
      // This shouldn't happen in the current data structure but added for completeness
      return Text('Invalid data structure');
    }
  }

  List<TextSpan> _parseText(String text) {
    RegExp exp = RegExp(r'<(.*?)>');
    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    exp.allMatches(text).forEach((match) {
      final String precedingText = text.substring(lastMatchEnd, match.start);
      final String boldText = match.group(1)!;

      if (precedingText.isNotEmpty) {
        spans.add(TextSpan(text: precedingText));
      }
      spans.add(TextSpan(text: boldText, style: TextStyle(fontWeight: FontWeight.bold)));

      lastMatchEnd = match.end;
    });

    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return spans;
  }
}

