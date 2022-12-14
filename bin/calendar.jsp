//テックブースト JSP 課題2
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.ZoneId" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="ja_JP" />
<%!
    private static Map eventMap = new HashMap();　//MAP データを複数持てる　keyとvalueを持つ　日付をキー、イベント名をバリューにする
  static {
    eventMap.put("20190101", "お正月");
    eventMap.put("20191225", "クリスマス");
    eventMap.put("20191231", "大晦日");
  }
%>
<%
  // リクエストのパラメーターから日付を取り出す　requestに呼ぶ
  String year = (String)request.getParameter("year");
  String month = (String)request.getParameter("month");
  String day = (String)request.getParameter("day");
  LocalDate localDate = null;
  if (year == null || month == null || day == null) {
    // 日付が送信されていないので、現在時刻を元に日付の設定を行う
    localDate = LocalDate.now();　//今の日付をとってくる　//String.valueOfでもString化できる
    year = String.valueOf(localDate.getYear());
    month = String.valueOf(localDate.getMonthValue());
    day = String.valueOf(localDate.getDayOfMonth());
  } else {
    // 送信された日付を元に、LocalDateのインスタンスを生成する
    localDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
  }
  //String型の配列のdates[]
  String[] dates = { year, month, day };

  // 画面で利用するための日付、イベント情報を保存
  session.setAttribute("dates", dates);  
  Date date = Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
  session.setAttribute("date", date);
  
  String event = (String)eventMap.get(year + month + day);
  //session:1回の接続　//sessionにイベントを持たせとく　46行目のところはpegecontentsの方が◎ 暗黙のオブジェクト
  session.setAttribute("event", event);
%>
//処理部分
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<style>
ul {
  list-style: none;
}
</style>
</head>
<body>
  <form method="POST" action="/jsp/calendar.jsp">
    <ul>
      <li><input type="text" name="year" value="${param['year']}" /><label for="year">年
      </label><input type="text" name="month" value="${param['month']}" /><label for="month">月</label><input type="text" name="day" value="${param['day']}" /><label for="day">日</label></li>
      <li><input type="submit" value="送信" />
      // スラッシュつなぎで年月日を入れたい　// fn:ｊoin? 10行目、11行目付近　ｊｓｐにもともとある機能　// patternE:jstlの曜日を取得する
      <li> <fmt:formatDate value="${date}" pattern="yyyy年MM月dd日（E）" /> </li>
      <li><c:out value="${event}" /></li>
    </ul>
  </form>
</body>
</html>
