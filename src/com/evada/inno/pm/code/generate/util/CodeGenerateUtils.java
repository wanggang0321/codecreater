package com.evada.inno.pm.code.generate.util;

import com.common.DateUtils;
import com.evada.inno.pm.code.generate.model.ColumnClass;

import freemarker.template.Template;

import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CodeGenerateUtils {
	
	private String AUTHOR = "";
    private String CURRENT_DATE = "";
    private String tableName = "crm_school_contract_apply";
    private String packageName = "com.collegepre.aspen.crm.tenantadmin.franch";
    private String tableAnnotation = "质量问题";
    private String URL = "jdbc:mysql://60.205.201.67:3306/zhuozhou-fangchan";
    private String USER = "root";
    private String PASSWORD = "PpdWang@0121";
    private String DRIVER = "com.mysql.jdbc.Driver";
    private String diskPath = "E://codegenerator//";
    private String changeTableName = replaceUnderLineAndUpperCase(tableName);
    
    public CodeGenerateUtils() {
    	this.AUTHOR = "wanggang";
    	this.CURRENT_DATE = DateUtils.getDate();
    }
    
    public Connection getConnection() throws Exception{
        Class.forName(DRIVER);
        Connection connection= DriverManager.getConnection(URL, USER, PASSWORD);
        return connection;
    }

    public static void main(String[] args) {
        CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
        try {
			codeGenerateUtils.generate();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    public void generate() throws Exception {
        try {
        	
        	File file = new File(diskPath);
        	deleteFile(file);
        	
            Connection connection = getConnection();
            DatabaseMetaData databaseMetaData = connection.getMetaData();
            ResultSet resultSet = databaseMetaData.getColumns(null,"%", tableName,"%");

			//生成Entity文件
			generateEntityFile(resultSet);
			//生成Mapper文件
            generateMapperFile(resultSet);
			//生成Dao文件
			generateDaoFile(resultSet);
			//生成Json文件
			generateJsonFile(resultSet);
			//生成Title文件
			generateTitleFile(resultSet);
			//生成服务实现层文件
			generateServiceImplFile(resultSet);
			//生成Controller层文件
			generateControllerFile(resultSet);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally{

        }
    }
    
    private void generateEntityFile(ResultSet resultSet) throws Exception {
    	
        final String suffix = ".java";
        
        final String folderPath = diskPath + "entity";
        File folder = new File(folderPath);
        if(!folder.exists()) {
        	folder.mkdir();
        }
        final String path = folderPath + "/" + changeTableName + suffix;
        
        final String templateName = "Entity.ftl";
        File mapperFile = new File(path);
        List<ColumnClass> columnClassList = new ArrayList<>();
        ColumnClass columnClass = null;
        
        while(resultSet.next()) {
        	
        	String columnName = resultSet.getString("COLUMN_NAME");
        	String changeColumnName = replaceUnderLineAndUpperCase(columnName);
        	String columnType = resultSet.getString("TYPE_NAME");
        	String remarks = resultSet.getString("REMARKS");
        	
            columnClass = new ColumnClass();
            
            //获取字段名称
            columnClass.setColumnName(columnName);
            //获取字段类型
            columnClass.setColumnType(columnType);
            //转换字段名称，如 sys_name 变成 SysName
            columnClass.setChangeColumnName(changeColumnName);
            //字段在数据库的注释
            columnClass.setColumnComment(remarks);
            
            columnClassList.add(columnClass);
        }
        
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("model_column", columnClassList);
        
        generateFileByTemplate(templateName, mapperFile, dataMap);
    }
    
    private void generateJsonFile(ResultSet resultSet) throws Exception{
        final String suffix = "Json.java";
        
        final String folderPath = diskPath + "entity";
        File folder = new File(folderPath);
        if(!folder.exists()) {
        	folder.mkdir();
        }
        final String path = folderPath + "/" + changeTableName + suffix;
        
        final String templateName = "Json.ftl";
        File mapperFile = new File(path);
        List<ColumnClass> columnClassList = new ArrayList<>();
        ColumnClass columnClass = null;
        
        resultSet.beforeFirst();
        while(resultSet.next()) {
        	
        	String columnName = resultSet.getString("COLUMN_NAME");
        	String changeColumnName = replaceUnderLineAndUpperCase(columnName);
        	String columnType = resultSet.getString("TYPE_NAME");
        	String remarks = resultSet.getString("REMARKS");
        	
            columnClass = new ColumnClass();
            
            //获取字段名称
            columnClass.setColumnName(columnName);
            //获取字段类型
            columnClass.setColumnType(columnType);
            //转换字段名称，如 sys_name 变成 SysName
            columnClass.setChangeColumnName(changeColumnName);
            //字段在数据库的注释
            columnClass.setColumnComment(remarks);
            
            columnClassList.add(columnClass);
        }
        
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("model_column", columnClassList);
        generateFileByTemplate(templateName,mapperFile,dataMap);
    }
    
    private void generateTitleFile(ResultSet resultSet) throws Exception{
    	final String suffix = "Title.java";
    	
        final String folderPath = diskPath + "entity";
        File folder = new File(folderPath);
        if(!folder.exists()) {
        	folder.mkdir();
        }
        final String path = folderPath + "/" + changeTableName + suffix;
    	
    	final String templateName = "Title.ftl";
    	File mapperFile = new File(path);
    	Map<String,Object> dataMap = new HashMap<>();
    	generateFileByTemplate(templateName,mapperFile,dataMap);
    }
    
    private void generateControllerFile(ResultSet resultSet) throws Exception{
        final String suffix = "Controller.java";
        
        final String folderPath = diskPath + "web";
        File folder = new File(folderPath);
        if(!folder.exists()) {
        	folder.mkdir();
        }
        final String path = folderPath + "/" + changeTableName + suffix;
        
        final String templateName = "Controller.ftl";
        File mapperFile = new File(path);
        Map<String,Object> dataMap = new HashMap<>();
        generateFileByTemplate(templateName,mapperFile,dataMap);
    }
    
    private void generateServiceImplFile(ResultSet resultSet) throws Exception{
        final String suffix = "Service.java";
        
        final String folderPath = diskPath + "service";
        File folder = new File(folderPath);
        if(!folder.exists()) {
        	folder.mkdir();
        }
        final String path = folderPath + "/" + changeTableName + suffix;
        
        final String templateName = "Service.ftl";
        File mapperFile = new File(path);
        Map<String,Object> dataMap = new HashMap<>();
        generateFileByTemplate(templateName,mapperFile,dataMap);
    }
    
    private void generateDaoFile(ResultSet resultSet) throws Exception{
        final String suffix = "Dao.java";
        final String folderPath = diskPath + "dao";
        File folder = new File(folderPath);
        if(!folder.exists()) {
        	folder.mkdir();
        }
        final String path = folderPath + "/" + changeTableName + suffix;
        final String templateName = "Dao.ftl";
        File mapperFile = new File(path);
        Map<String,Object> dataMap = new HashMap<>();
        generateFileByTemplate(templateName,mapperFile,dataMap);

    }
    
    private void generateMapperFile(ResultSet resultSet) throws Exception{
        final String suffix = "Mapper.xml";
        final String path = diskPath + changeTableName + suffix;
        final String templateName = "Mapper.ftl";
        File mapperFile = new File(path);
        Map<String,Object> dataMap = new HashMap<>();
        generateFileByTemplate(templateName,mapperFile,dataMap);

    }
    
    private void generateFileByTemplate(final String templateName,File file,Map<String,Object> dataMap) throws Exception{
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName);
        FileOutputStream fos = new FileOutputStream(file);
        dataMap.put("table_name_small",tableName);
        dataMap.put("table_name",changeTableName);
        dataMap.put("author",AUTHOR);
        dataMap.put("date",CURRENT_DATE);
        dataMap.put("package_name",packageName);
        dataMap.put("table_annotation",tableAnnotation);
        Writer out = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"),10240);
        template.process(dataMap,out);
    }
    
    public String replaceUnderLineAndUpperCase(String str){
        StringBuffer sb = new StringBuffer();
        sb.append(str);
        int count = sb.indexOf("_");
        while(count!=0){
            int num = sb.indexOf("_",count);
            count = num + 1;
            if(num != -1){
                char ss = sb.charAt(count);
                char ia = (char) (ss - 32);
                sb.replace(count , count + 1,ia + "");
            }
        }
        String result = sb.toString().replaceAll("_","");
        return StringUtils.capitalize(result);
    }
	
    private void deleteFile(File file) {

    	if (file.isDirectory()) {
    		File[] files = file.listFiles();
    		for (int i = 0; i < files.length; i++) {
    			File f = files[i];
    			deleteFile(f);
    		}
    		//file.delete();//如要保留文件夹，只删除文件，请注释这行
    	} else if (file.exists()) {
    		file.delete();
    	}
    }
    
}
