package shopping_site.Util;

import java.text.DecimalFormat;
import java.time.LocalDate;

public class Util {
	public static String comma(int num) {
		DecimalFormat df = new DecimalFormat("#,###");
		String str = df.format(num);
		return str;
	}
	
	public static LocalDate datefx(String now_date, int ymd, int bf, int interval) {
		// 기준날짜, 년월일, 이전이후, 간격{
		// ymd : 1년, 2월, 3일 || bf : 1이전, 2이후
		// LocalDate의 기준날짜의 객체를 만들기위해 int형의 년,월,일
		String[] str = now_date.split("-");
		int y = Integer.parseInt(str[0]); // 년,월,일을 int형으로 변환
		int m = Integer.parseInt(str[1]);
		int d = Integer.parseInt(str[2]);
		LocalDate dday = LocalDate.of(y, m, d); // now():현재시간, of()매개변수로 들어오는 시간
		LocalDate result = null;
		
		switch (ymd) {
		case 1: // 년도
			if (bf == 1) { // 이전 minus
				result = dday.minusYears(interval);
			} 
			else { // 이후 plus
				result = dday.plusYears(interval);
			}
			break;
		case 2: // 월
			if (bf == 1) { // 이전 minus
				result = dday.minusMonths(interval);
			} 
			else { // 이후 plus
				result = dday.plusMonths(interval);
			}
			break;
		case 3: // 일
			if (bf == 1) { // 이전 minus
				result = dday.minusDays(interval);
			} 
			else { // 이후 plus
				result = dday.plusDays(interval);
			}
		}
		return result;
	}
}
