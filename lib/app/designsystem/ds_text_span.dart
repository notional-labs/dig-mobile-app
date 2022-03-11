import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DSTextSpanHighlight {
  final String content;
  final TextStyle style;
  final GestureRecognizer? recognizer;

  DSTextSpanHighlight(this.content, this.style, this.recognizer);
}

class DSTextSpan {
  final String content;
  final TextStyle defaultStyle;
  final int maxLine;
  final List<DSTextSpanHighlight> contentHighlightList;
  final bool trimHeight;
  final TextAlign textAlign;

  DSTextSpan(this.content, this.contentHighlightList, this.defaultStyle,
      {this.maxLine = 1,
      this.trimHeight = false,
      this.textAlign = TextAlign.start});

  Widget format() {
    return RichText(
        textAlign: textAlign,
        maxLines: maxLine,
        textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: !trimHeight,
            applyHeightToLastDescent: !trimHeight),
        text: TextSpan(text: "", children: _generateTextSpans()));
  }

  List<TextSpan> _generateTextSpans() {
    List<TextSpan> result = [];
    List<DSTextSpanHighlight> contentList = _findContent();
    if (contentList.isEmpty) {
      result.add(TextSpan(text: content, style: defaultStyle));
    } else {
      for (DSTextSpanHighlight item in _findContent()) {
        result.add(TextSpan(
            text: item.content,
            style: item.style,
            recognizer: item.recognizer));
      }
    }
    return result;
  }

  List<DSTextSpanHighlight> _findContent() {
    List<DSTextSpanHighlight> result = [];
    String processString = content;
    int index = 0;
    while (processString.isNotEmpty && index < contentHighlightList.length) {
      DSTextSpanHighlight replaceValue = contentHighlightList[index];
      int startIndex = processString.indexOf(replaceValue.content);
      int endIndex = startIndex + replaceValue.content.length;
      final recognizer = contentHighlightList[index].recognizer;

      if (startIndex == -1) {
        index += 1;
      } else {
        String firstString = processString.substring(0, startIndex);
        String secondString = processString.substring(startIndex, endIndex);
        result.add(DSTextSpanHighlight(firstString, defaultStyle, null));
        result.add(
            DSTextSpanHighlight(secondString, replaceValue.style, recognizer));
        index += 1;
        processString = processString.substring(endIndex, processString.length);
      }
    }
    result.add(DSTextSpanHighlight(processString, defaultStyle, null));
    return result;
  }
}
