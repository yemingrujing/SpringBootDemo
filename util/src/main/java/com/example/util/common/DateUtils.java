package com.example.util.common;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.util.Date;

public final class DateUtils {
    // 默认显示日期的格式
    public static final String DATAFORMAT_STR = "yyyy-MM-dd";
    // 默认显示日期时间的格式 精确到分钟
    public static final String DATATIMEF_STR_MI = "yyyy-MM-dd HH:mm";

    public static final String TIME_STAMP_PATTERN = "yyyyMMddHHmmSS";

    /**
     * 格式化时间  yyyy-MM-dd
     *
     * @return
     */
    public static String getFormatDate(Date date) {
        return DateFormatUtils.format(date, DATAFORMAT_STR);
    }

    public static String formatDate(Date date, String format) {
        return DateFormatUtils.format(date, format);
    }
}
