abstract class Newsstates {}
class initial extends Newsstates{}
class bottom extends Newsstates{}
class NewsLoadingState extends Newsstates{}
class NewsgetBusinessSuccesState extends Newsstates{}
class NewsgetBusinessErrorState extends Newsstates{
  late final String error ;
  NewsgetBusinessErrorState(this.error);
}
class NewsgetsportsSuccesState extends Newsstates{}
class NewsgetsportsErrorState extends Newsstates{
  late final String error ;
  NewsgetsportsErrorState(this.error);
}
class NewsgetscienceSuccesState extends Newsstates{}
class NewsgetscienceErrorState extends Newsstates{
  late final String error ;
  NewsgetscienceErrorState(this.error);
}
class dark extends Newsstates{}
class light extends Newsstates{}
class NewsgetsearchSuccesState extends Newsstates{}
class NewsgetsearchErrorState extends Newsstates{
  late final String error ;
  NewsgetsearchErrorState(this.error);
}
