package com.material.website.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class TextFilter {
	
    private static final TextFilter instance = new TextFilter();
    private boolean init = false;

    private TextFilter() {
    	
    }

    public static TextFilter newInstance() {
        return instance;
    }
    
    /**
     * 词库
     */
    private Map<Character, Map<Character, Set<Integer>>> states = new HashMap<>();
    private int maxLength; 

    /**
     * 添加敏感词
     * @param word
     */
    public void add(String word) {
        if (word == null || word.trim().length() == 0) {
            return;
        }
        char[] wordChars = word.toCharArray();
        int wordLen = wordChars.length;
        maxLength = Math.max(maxLength, wordLen);
        add(wordChars, wordChars.length, wordChars.length, null);
    }
    
    /**
     * 初始化词库
     */
	public void init() {
		if(init) {
			return;
		}
		BufferedInputStream bis = new BufferedInputStream(TextFilter.class.getResourceAsStream("/keywords"));
		try {
			byte[] readInputStream2byte = FileOutPutUtil.readInputStream2byte(bis);
			StringReader reader = new StringReader(AESEncrypt.getData(readInputStream2byte));
			BufferedReader br = new BufferedReader(reader);
			String line = "";
			while ((line = br.readLine())!=null) {
				add(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		init = true;
	}

    /**
     * 删除敏感词
     * @param word
     */
    public void del(String word) {
        if (word == null || word.trim().length() == 0) {
            return;
        }
        char[] wordChars = word.toCharArray();
        int wordLen = wordChars.length;
        Set<Integer> wordSet = null;
        if (wordLen > 1) {
            wordSet = states.get(wordChars[wordLen - 2]).get(wordChars[wordLen - 1]);
        } else {
            wordSet = states.get(null).get(wordChars[wordLen - 1]);
        }
        wordSet.remove(word.hashCode());
    }

    private void add(char[] chars, int length, int lastLength, Character key) {
        Map<Character, Set<Integer>> start = states.get(key);
        if (start == null) {
            start = new HashMap<Character, Set<Integer>>();
            states.put(key, start);
        }
        char curChar = chars[length - lastLength];
        if (lastLength > 1) {
            if (start.get(curChar) == null) {
                start.put(curChar, new HashSet<Integer>());
            }
            key = curChar;
            lastLength--;
            add(chars, length, lastLength, key);
        } else {
            String forbiddenWord = new String(chars);
            Set<Integer> wordList = start.get(curChar);
            if (wordList == null) {
                wordList = new HashSet<>();
            }
            wordList.add(forbiddenWord.hashCode());
            start.put(curChar, wordList);
        }
    }

    /**
     * @param src
     * @return 过滤后的文本路径
     */
    public Map<String,Object> filter(String src) {
    	src = "#"+src.replaceAll("\\s","")+"#";
    	Map<String,Object> re = new HashMap<>();
        if (src == null || src.trim().length() == 0) {
            return re;
        }
        int[] indexBuffer = new int[maxLength];
        int filterCount = 0;
        StringBuilder sb = new StringBuilder();
        int cur = 0;    
        boolean isInc = false;  
        int incCur = 0; 
        char[] srcChars = src.toCharArray();
        Map<Character, Set<Integer>> start = states.get(null);
        for (int i = 0; i < srcChars.length; i++) {
            if (srcChars[i] == '\n' || srcChars[i] == '\r') { 
                continue;
            }
            Set<Integer> wordSet = start.get(srcChars[i]);
            if (wordSet != null) {
                indexBuffer[cur] = i;
                start = states.get(srcChars[i]);
                cur++;
                if (wordSet.size() > 0) {   
                    if (start == null) {
                        char[] bufChars = new char[cur];
                        for (int j = 0; j < cur; j++) {
                            bufChars[j] = srcChars[indexBuffer[j]];
                        }
                        String bufStr = new String(bufChars);
                        if (wordSet.contains(bufStr.hashCode())) {
                        	++filterCount;
                            for (int j = 0; j < cur; j++) {
                            	if(j == 0) {
                            		sb.append(",");
                            	}
                            	sb.append(srcChars[indexBuffer[j]]);
                            	srcChars[indexBuffer[j]] = '*';
                            }
                        }
                        cur = 0;
                        isInc = false;
                        start = states.get(null);
                    } else {   
                        isInc = true;
                        incCur = cur;
                    }
                }
                if (start == null) {
                    start = states.get(null);
                }
            } else {
                if (start != states.get(null)) {    
                    i--;
                }
                if (isInc) {
                    char[] bufChars = new char[incCur];
                    for (int j = 0; j < incCur; j++) {
                        bufChars[j] = srcChars[indexBuffer[j]];
                    }
                    if (incCur > 1) {
                        wordSet = states.get(srcChars[indexBuffer[incCur - 2]]).get(srcChars[indexBuffer[incCur - 1]]);
                    } else {
                        wordSet = states.get(null).get(srcChars[indexBuffer[incCur - 1]]);
                    }
                    String bufStr = new String(bufChars);
                    if (wordSet.contains(bufStr.hashCode())) {
                    	++filterCount;
                        for (int j = 0; j < incCur; j++) {
                        	if(j == 0) {
                        		sb.append(",");
                        	}
                        	sb.append(srcChars[indexBuffer[j]]);
                        	srcChars[indexBuffer[j]] = '*';
                        }
                    }
                    incCur = 0;
                    isInc = false;
                }
                cur = 0;
                start = states.get(null);
            }
        }
        re.put("sensis",filterCount);
        re.put("sensitives",sb.toString().equals("")?"":sb.substring(1));
        return re;
    }
}
