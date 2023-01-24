abstract class CubitAssets {}
class ArchiveInitStatus extends CubitAssets{}
class SignInWithEmailLoadingStatus extends CubitAssets{}
class SignInWithEmailSuccessStatus extends CubitAssets{}



class ThemeSwitchStatus extends CubitAssets{}

class OnBoardingStatus extends CubitAssets{}

class PageChangeStatues extends CubitAssets{}

class PageRefresh extends CubitAssets{}

class ShowStudentDataLoadingStatus extends CubitAssets{}
class ShowStudentDataSuccessStatus extends CubitAssets{}

class ShowCurrentStudentDataLoadingStatus extends CubitAssets{}

class ShowCurrentStudentDataSuccessStatus extends CubitAssets{}


class AddNewStudentDataLoadingStatus extends CubitAssets{}
class AddNewStudentDataSuccessStatus extends CubitAssets{}
class AddNewStudentDataErrorStatus extends CubitAssets{}


class GetStudentDataLoadingStatus extends CubitAssets{}
class GetStudentDataSuccessStatus extends CubitAssets{}
class GetStudentDataErrorStatus extends CubitAssets{
  late final String error;

  GetStudentDataErrorStatus(this.error);
}

//add new class
class AddNewClassLoadingStatus extends CubitAssets{}
class AddNewClassSuccessStatus extends CubitAssets{}
class AddNewClassErrorStatus extends CubitAssets{}