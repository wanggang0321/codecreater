package com.file;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;

public class FileUtil {
	
	public static String readTxt(String filePath) {
		
		StringBuffer sql = new StringBuffer("");
		
		try {
			File file = new File(filePath);
			if(file.isFile() && file.exists()) {
				InputStreamReader isr = new InputStreamReader(new FileInputStream(file), "gbk");
				BufferedReader br = new BufferedReader(isr);
				String lineTxt = null;
				while ((lineTxt = br.readLine()) != null) {
					System.out.println(lineTxt);
					sql.append(lineTxt);
				}
				br.close();
			} else {
				System.out.println("文件不存在!");
			}
		} catch (Exception e) {
			System.out.println("文件读取错误!");
		}
		
		return sql.toString();
	}
	
	public static void writeTxt() {
		try {
			/* 写入Txt文件 */  
			File writename = new File("D:/sqlFormat.txt"); // 相对路径，如果没有则要建立一个新的output。txt文件  
			writename.createNewFile(); // 创建新文件  
			BufferedWriter out = new BufferedWriter(new FileWriter(writename));  
			out.write("我会写入文件啦\r\n"); // \r\n即为换行  
			out.flush(); // 把缓存区内容压入文件  
			out.close(); // 最后记得关闭文件  
		} catch (Exception e) {
			System.out.println("文件写入错误!");
		}
	}
	
}
