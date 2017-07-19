package com.material.website.util;

import java.util.Stack;

public class MakeRandomString {
	
	public static String getOrder(){
		return _10_to_62(System.currentTimeMillis(), 7) + _10_to_62((int)(Math.random() * 238327), 3);
	}
	
	public static String makeKey(){
		return _10_to_62(System.currentTimeMillis(), 7) + _10_to_62((int)(Math.random() * 238327), 3)+ _10_to_62((int)(Math.random() * 238327), 3)+ _10_to_62((int)(Math.random() * 238327), 3);
	}
	
	public static String getUserKey(Integer id) {
		return _10_to_62(345678+id, 0);
	}
	
	public static String getShareKey(Integer id) {
		return _10_to_62(654321+id, 0);
	}
	
	private static char[] charSet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toCharArray();
	
	private static String _10_to_62(long number, int length){  
        Long rest=number;  
        Stack<Character> stack=new Stack<Character>();
        StringBuilder result=new StringBuilder(0);  
        while(rest!=0){  
            stack.add(charSet[new Long((rest-(rest/62)*62)).intValue()]);  
            rest=rest/62;  
        }  
        for(;!stack.isEmpty();){  
            result.append(stack.pop());  
        }  
        int result_length = result.length();  
        StringBuilder temp0 = new StringBuilder();  
        for(int i = 0; i < length - result_length; i++){  
            temp0.append('0');  
        }  
        return temp0.toString() + result.toString();  
   }
}
