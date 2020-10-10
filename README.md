<div dir='rtl'>

# آی‌دی آلرت ویوکنترلر

## پیش‌نمایش!

<table>
  <tr>
    <td>
      <img src='./Other/05.png'>
    </td>
    <td>
      <img src='./Other/02.png'>
    </td>
    <td>
      <img src='./Other/03.png'>
    </td>
  </tr>
</table>


## مشکل
زمانیکه توی اپ‌های آی‌او‌اس بخواین از `UIAlertViewController` استفاده کنین، این ویوکنترلر از فونت‌های پیشفرض سیستم‌عامل استفاده می‌کنه. با استفاده از یه سری کد، میشه فونت و رنگ عنوان و پیام بالای کنترلر رو تغییر داد.

اما برای گزینه‌ها یا همون `UIAlertAction`ها، رویه مشخصی برای تغییر رنگ یا فونت نوشته‌ها وجود نداره (یا حداقل من پیدا نکردم!). البته اگه `tintColor` خود `alertController` رو تغییر بدین، رنگ همه گزینه‌ها تغییر می‌کنه. اما مشکل اصلی همون فونت هستش.

## راه حل
برای حل این مشکل، یه سری کلاس جدید پیاده‌سازی کردیم و همینطور یه سری کارای مهندسی‌طور کردیم!!😅 اونجوری دیگه نه تنها فونت، که رنگ و چینش و عکس‌های مربوط به هر اکشن رو میشه شخصی‌سازی کرد. 😎

## مدل‌ها و نحوه استفاده‌شون

### مدل `IDAlertAction`
این مدل در واقع مدل مورد نظر ما برای اکشن‌ها (یا همون گزینه‌های آلرت‌کنترلر) هست. 

#### نحوه ساخت
دو مدل اکشن داریم. یکی مدلی که عنوان و عکس (یا دوتا عکس) داره، و البته بهمراه فونت و رنگ و چینش متن. مدل دیگه، مدلی هست که عنوان و توضیح داره فقط. البته می‌تونیم فونت و رنگ براش در نظر بگیریم، ولی عکس نخواهد داشت. این مدل دوم، برای مواقعی هست که شما بخواین در کنار عنوان گزینه‌ها، یه توضیح کوچک هم ارائه بدین؛ تا کاربر مطمئن‌تر بتونه گزینه مورد نظرش رو انتخاب کنه.

برای ساخت مدل اول از کد زیر استفاده می‌کنیم:

<pre dir='ltr'>
static func InitializeNormalAction(
  title       : String,
  alignment   : NSTextAlignment     = .center,
  color       : UIColor?            = nil,
  font        : UIFont?             = nil,
  leftImage   : UIImage?            = nil,
  rightImage  : UIImage?            = nil,
  actionStyle : UIAlertAction.Style = .default,
  handler     : Handler?)
</pre>

پارامترها بنظرم مشخص هستن و نیازی به توضیح ندارن.

<br>

برای ساخت مدل دوم (عنوان و توضیح) از کد زیر استفاده می‌کنیم:

<pre dir='ltr'>
static func InitializeTitleAndSubtitleAction(
  title         : String,
  titleColor    : UIColor?            = nil,
  titleFont     : UIFont?             = nil,
  subtitle      : String,
  subtitleColor : UIColor?            = nil,
  subtitleFont  : UIFont?             = nil,
  actionStyle   : UIAlertAction.Style = .default,
  actionHeight  : CGFloat?            = nil,
  handler       : Handler?)
</pre>

اینجا هم پارامترها بنظرم مشخص هستن و نیازی به توضیح ندارن.

<br>

#### نکته‌ها
👈 توی نسخه‌های قبلی، اول یه اکشن می‌ساختیم و بعد با استفاده از متدها، عکس(ها) یا چینش و غیره رو تغییر می‌دادیم. توی نسخه ۳ دیگه اینجوری نیست؛ و همه‌چی همون اول گرفته میشه. پس بدونین که مدل `IDAlertAction` خودش دیگه متدی برای شخصی‌سازی نداره.

👈 با توجه به اینکه این متدهایی که بعنوان سازنده مورد استفاده قرار می‌گیرن بصورت `static` تعییر شدن، شما باید به شکل زیر فراخوانی‌شون کنین:

<pre dir='ltr'>
let action1 = IDAlertAction.InitializeNormalAction(...)
let action0 = IDAlertAction.InitializeTitleAndSubtitleAction(...)
</pre>


#### مشخصه‌های کمکی
برای راحتی بیشتر، چندتا متغیر از نوع `static` در نظر گرفته شده، تا بصورت پیشفرض، اگه فونتی برای قسمت‌های مختلف اکشن اختصاص داده نشده بود، از این مقادیر استفاده بشه. شما با یکبار مقداردهی این مشخصه‌ها، تمام آلرت‌اکشن‌ها رو با اون فونت‌ها مشاهده می‌کنین.

<pre dir='ltr'>
public static var TitleTextFont: UIFont = ...
public static var SubtitleTextFont: UIFont = ...
</pre>

یعنوان مثال می‌تونین مقداردهی این مشخصه‌ها رو توی `AppDelegate` انجام بدین.

<br>

### مدل `IDAlertHeader`
این مدل عنوان و پیام آلرت رو پیکربندی می‌کنه.
استفاده‌اش برای مشخص‌کردن `title` و `message` و همینطور مشخص‌کردن فونت و رنگ هرکدوم هست.

#### نحوه ساخت
سازنده بصورت زیر هست:

<pre dir='ltr'>
init(title: String?, message: String?)
</pre>

اصن نیازی به توضیح هست؟! 🤔

#### متدها
برای شخصی‌سازی هدر دوتا متد در نظر گرفته شده. هر دو رنگ و فونت رو تغییر میدن؛ یکی برای عنوان و یکی هم برای پیام.

<pre dir='ltr'>
setup{Title|Message}(font: UIFont?, color: UIColor?)
</pre>

#### مشخصه‌های کمکی
اینجا هم یه سری مشخصه بصورت `static` در نظر گرفته شدن، تا هربار نیازی نباشه شما فونت و رنگ عنوان و پیام رو مقداردهی کنین.

<pre dir='ltr'>
static var TitleFont: UIFont = .systemFont(ofSize: 16, weight: .bold)
static var TitleColor : UIColor = .black
static var MessageFont : UIFont = .systemFont(ofSize: 14, weight: .regular)
static var MessageColor : UIColor = .darkGray
</pre>

یعنوان مثال می‌تونین مقداردهی این مشخصه‌ها رو هم توی `AppDelegate` انجام بدین.

<br>

### مدل `IDAlertHeaderView`
با استفاده از این مدل، می‌تونیم بجای نمایش عنوان و پیام، از یه ویو اختصاصی برای هدر آلرت‌کنترلر استفاده کنیم.

#### نحوه ساخت
متدی که برای ساخت استفاده میشه، بصورت زیر تعریف میشه:

<pre dir='ltr'>
init(contentView: UIView, height: CGFloat)
</pre>

این سازنده، دوتا پارامتر ورودی داره. یکی خود اون ویویی که قرار هست نمایش داده بشه، و یکی هم ارتفاع مورد نیاز ما.  نکته‌ای که هست، اینه که این ارتفاع رو جوری در نظر بگیرین که چیزی توی ویو شما از قلم نیوفته!!


### مدل `IDAlertController`
این مدل همون مدلی هست با استفاده ازش، خود `UIAlertController` نمایش داده میشه.

#### نحوه ساخت
براساس نوع استفاده ما، دوتا سازنده داریم:

<pre dir='ltr'>
init(header: IDAlertHeader?, actions: [IDAlertAction], preferredStyle style: UIAlertController.Style)
</pre>

همونطور که مشخصه، این سازنده، یه `IDAlertHeader` می‌تونه بگیره. اینکه می‌گم میتونه، به این خاطر هست که این ورودی `Optional` هست و اگه شما آلرتی بخواین نمایش بدین که عنوان و پیام نداره، این ورودی رو `nil` قرار می‌دین.

ورودی دوم میشه اکشن‌های مورد نظر شما؛ که رویه ساخت‌شون رو قبل‌تر توضیح دادم.

ورودی سوم هم مشخص‌کننده نوع نمایش آلرت‌کنترلر هست؛ اینکه بصورت `ActionSheet` باشه یا بصورت `Alert`. 


<br>

و نوع دوم سازنده هم بصورت زیر هست:

<pre dir='ltr'>
init(headerView: IDAlertHeaderView, actions: [IDAlertAction], preferredStyle: UIAlertController.Style)
</pre>


این سازنده، یه `IDAlertHeaderView` می‌گیره. ورودی دوم میشه اکشن‌های مورد نظر شما؛ که رویه ساخت‌شون رو قبل‌تر توضیح دادم. ورودی سوم هم مشخص‌کننده نوع نمایش آلرت‌کنترلر هست؛ اینکه بصورت `ActionSheet` باشه یا بصورت `Alert`. 


#### متدها
دوتا متد در دسترس شماست:

متد برای مقداردهی `tintColor` آلرت‌کنترلر:
<pre dir='ltr'>
setTintColor(_ color: UIColor)
</pre>

متد زیر هم برای نمایش آلرت‌کنترلر در iPad کاربرد داره:
<pre dir='ltr'>
setupPopoverPresentationController(
  sourceView: UIView, 
  permittedArrowDirections: UIPopoverArrowDirection
)
</pre>
این متد دوتا ورودی داره. اولی بعنوان ویو (یا المانی) بکار میره که باعث نمایش آلرت‌کنترلر شده. و متد دوم هم برای جهت‌های مجاز نمایش فلش برای آلرت‌کنترلر در آی‌پد بکار میره.

<td>
  <tr>
    <td>
      <img src='./Other/04.png'>
    </td>
  </tr>
</td>


## در آخر
اگه توی استفاده به مشکلی برخورد کردین، بگین تا در صورت امکان رفع‌اش کنیم. 🤓

اگه هم از این خوش‌تون اومد، به بقیه هم معرفی‌اش کنین، تا بقیه هم ازش استفاده کنن؛ و اینجوری مجبور نباشیم برای یه آلرت، یا از فونت پیشفرض استفاده کنیم، یا یه کتابخانه دیگه اضافه کنیم.

## دِ اِند. 😎

</div>