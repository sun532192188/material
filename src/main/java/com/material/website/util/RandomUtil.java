/*
 * Copyright (c) 2015.
 * 北京云腾致用科技有限公司
 */

package com.material.website.util;

import java.util.Date;
import java.util.Random;

/**
 * 
* @Description: 生成随机数 
* @author 张明虎 zhangminghu@yuntengzhiyong.com  
* @date 2015年5月25日 下午2:08:06
 */
public class RandomUtil {
    private RandomUtil() {

    }

    private static final RandomUtil instance = new RandomUtil();

    public static RandomUtil newInstance() {
        return instance;
    }

    /**
     * 获取随机字符串
     *
     * @param start  一个ANSCII码值，随机字符串中所包含字符范围的开始值
     * @param end    一个ANSCII码值，随机字符串中所包含字符范围的结束值
     * @param length 随机字符串长度
     * @return 生成的随机字符串
     */
    public String getRandomStr(Integer start, Integer end, Integer length) {
        StringBuffer randomStr = new StringBuffer();
        Random random = new Random((long) (System.currentTimeMillis() * Math.random()));
        for (int i = 0; i < length; i++) {
            int rs = random.nextInt(end - start + 1) + start;
            randomStr.append((char) rs);
        }
        return randomStr.toString();
    }

    /**
     * 从给定的字符数组中生成一个指定长度的随机字符串
     *
     * @param chars  字符数组，生成的随机字符串中所能包含的字符范围
     * @param length 生成的随机字符串的长度
     * @return 生成的随机字符串
     */
    public String getRandomStr(char[] chars, Integer length) {
        StringBuffer randomStr = new StringBuffer();
        Random random = new Random((long) (System.currentTimeMillis() * Math.random()));
        for (int i = 0; i < length; i++) {
            int rs = random.nextInt(chars.length);
            randomStr.append(chars[rs]);
        }
        return randomStr.toString();
    }

    /**
     * 获取只包含数字的随机字符串
     *
     * @param length 字符串长度
     * @return 生成的随机字符串
     */
    public String getRandomNumberStr(Integer length) {
        return getRandomStr(0x30, 0x39, length);
    }

    /**
     * 生成一个指定范围内的随机整数
     *
     * @param start 随机数最小值
     * @param end   随机数最大值
     * @return 生成的随机数
     */
    public Integer getRandomInt(Integer start, Integer end) {
        Random random = new Random((long) (System.currentTimeMillis() * Math.random()));
        if (start <= end) {
            return random.nextInt(end - start + 1) + start;
        } else {
            return random.nextInt(start - end + 1) + end;
        }
    }

    /**
     * 生成一个时间戳+6位随机数的序列号
     *
     * @return
     */
    public String getRandomOrder() {
        return DateFormatUtils.date2str(new Date(), "yyyyMMddHHmmss") + getRandomNumberStr(6);
    }
}
