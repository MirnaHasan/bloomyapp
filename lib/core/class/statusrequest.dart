
// هذا الكلاس يعبر عن حالات الريكويست 
enum StatusRequest{
// حالة التحميل للريكويست 
loading ,
 
success ,
// حالة الفشل هون اذا مثلا عم انشئ بنفس البريد حسابين 
failure, 
// فشل في الاتصال ب السيرفر 
serverfailure , 
// فشل بسبب عدم الاتصال بالانترنت 
offlineFailure ,
serverException ; 



}