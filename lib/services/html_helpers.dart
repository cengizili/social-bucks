

enum CSSElements {
  continueWebButton(selector: 'button[class=" K2FXnd Oz0bd oNZ3af"]'),
  gmbNameHeader(selector: 'h1[class="DUwDvf fontTitleLarge"]'),
  fiveStar(selector: 'div[data-rating="5"]'),
  reviewArea(selector: 'textarea[jsname="YPqjbf"]'),
  publishReviewButton(selector: 'button[class="VfPpkd-LgbsSe VfPpkd-LgbsSe-OWXEXe-k8QpJ VfPpkd-LgbsSe-OWXEXe-dgl2Hf nCP5yc AjY5Oe DuMIQc LQeN7 GmukRd"]'),
  scroll(selector: 'div[class="m6QErb DxyBCb kA9KIf dS8AEf XiKgde "]'),
  iframe(selector: '''document.querySelector('iframe[class="goog-reviews-write-widget"]').contentWindow.document'''),
  congrats(selector: 'div[class="qQqQre"]'),
  alreadyLocalGuide(selector: 'a[href="https://www.google.com/maps/contrib/"]'),
  makeReviewButton(selector: 'button[class="g88MCb S9kvJb "]');

  final String selector;

  const CSSElements({required this.selector});
}
