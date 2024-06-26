import 'package:auto_localization/auto_localization.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LocaleText extends StatefulWidget {
   LocaleText(this.data, {this.style, this.textDirection, this.maxLines, this.overflow, this.textAlign, this.current="", this.translated=""});

   String data;
   String translated;
   String current;
   TextStyle? style;
   TextOverflow? overflow;
   TextAlign? textAlign;
   int? maxLines;
   TextDirection? textDirection;

  @override
  State<LocaleText> createState() => _LocaleTextState();
}

class _LocaleTextState extends State<LocaleText> {

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  void translate(){
    if (widget.translated == ""){
       AutoLocalization.translate(widget.data).then((value) {
        setState(() {
          widget.translated = value;
        });
      });
    }
  }

  @override
  void didUpdateWidget(covariant LocaleText oldWidget) {
    if (widget.data != oldWidget.data) {
     translate();
    }
  }

  @override
  void initState() {
     translate();
  }

  @override
  Widget build(BuildContext context) {
    translate();
      return Visibility(visible: widget.translated != "",
      child: AutoSizeText(widget.translated, minFontSize: 0, textDirection: widget.textDirection, style: widget.style, textAlign: widget.textAlign, maxLines: widget.maxLines, overflow: widget.overflow),
      replacement: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.black,
        size: 20
      ),);
  }
} 

extension StringX on String {
  Future<String> translate() async {
    return await AutoLocalization.translate(this);
  }
}