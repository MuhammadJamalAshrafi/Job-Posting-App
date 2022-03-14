class JobPost {
  String title,description;

  JobPost(this.title, this.description);

  String get _title => title;

   set _title(String value) {
    title = value;
  }

  String get _description => description;

  set _description(String value){
    description = value;
  }
}