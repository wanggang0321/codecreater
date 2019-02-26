package com.common;

import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;

public class DateUtils {
	
	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}
	
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}
	
}
