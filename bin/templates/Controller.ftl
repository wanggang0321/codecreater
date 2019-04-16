package ${package_name}.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.collegepre.aspen.common.page.PageInfo;
import com.collegepre.aspen.common.utils.CookieUtils;
import ${package_name}.service.${table_name}Service;
import ${package_name}.entity.${table_name};
import ${package_name}.entity.${table_name}Json;
import ${package_name}.entity.${table_name}Title;

/**
* 描述：${table_annotation}控制层
* @author ${author}
* @date ${date}
*/
@Controller
@RequestMapping(value = "/${table_name?lower_case}/")
public class ${table_name}Controller {
	
	private Logger log = LoggerFactory.getLogger(${table_name}Controller.class);
	
    @Autowired
    private ${table_name}Service ${table_name?uncap_first}Service;

	@RequestMapping(value="/select${table_name?lower_case}list")
	public String select${table_name}List(HttpServletRequest request, HttpServletResponse response, Model model,
			String searchFlag, String pn, String searchContext) {
		
		String userId = CookieUtils.getCookie(request, "userid");
		String tenantId = CookieUtils.getCookie(request, "tenantid");
		
		searchContext = StringUtils.isNotBlank(searchContext) ? searchContext.trim() : "";
		
		Integer pagenum = 1;
		if(StringUtils.isNotBlank(pn)){
			pagenum = Integer.parseInt(pn);
		}
		model.addAttribute("pn", pagenum);
		
		if(StringUtils.isBlank(searchFlag)){
			searchFlag = "0";
		}
		model.addAttribute("searchFlag", searchFlag);
		
		return "modules/${table_name?uncap_first}_browse";
	}

    @RequestMapping(value="/select${table_name?lower_case}data")
	public void select${table_name}Data(HttpServletRequest request,HttpServletResponse response, Model model,
			String searchFlag, String pns, String searchContext) {
		
		String tenantId = CookieUtils.getCookie(request, "tenantid");
		String userId = CookieUtils.getCookie(request, "userid");
		
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		
		/*------ start:查询条件 ------*/
		sqlMap.put("tenantId", tenantId);
		sqlMap.put("crmUserId", userId);
		if(StringUtils.isNotBlank(searchStr)) {
			sqlMap.put("searchContext", com.collegepre.aspen.common.utils.StringUtils.sqlFormalSpecialCharacter(searchContext.trim()));
		}
		/*------ end:查询条件 ------*/
		
		/*------ start:数据范围 ------*/
		
		/*------ end:数据范围 -------*/
		
		Integer pagenum = 1;
		if(StringUtils.isNotBlank(pns)){
			pagenum = Integer.parseInt(pns);
		}
		
		int count = ${table_name?uncap_first}Service.select${table_name}Count(sqlMap);
		PageInfo paging = new PageInfo(pagenum, count);
		int start = (pagenum-1) * paging.getPageSize();
		int rows = paging.getPageSize();
		sqlMap.put("start", start);
		sqlMap.put("rows", rows);
		List<${table_name}Title> title = getTitle();
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		List<${table_name}Json> clist = ${table_name?uncap_first}Service.select${table_name}list(sqlMap);
		hMap.put("bContent", clist);
		
		if(StringUtils.isBlank(searchFlag)){
			searchFlag = "0";
		}
		hMap.put("isSearched", searchFlag);//0--没有查询时无数据，1--查询后无数据
		hMap.put("hContent", title);
		hMap.put("pContent", paging);
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		rMap.put("tableList", hMap);
		
		PrintWriter pw = null;
   		try {
   			pw = response.getWriter();
   			String json = JSON.toJSONString(rMap);
   			pw.print(json); 
   		} catch (IOException e) {
   			e.printStackTrace();
   		} finally {
   			if(pw!=null){
   				pw.flush(); 
   				pw.close(); 
   				pw = null;
   			}
   		}
	}
	
	private List<${table_name}Title> getTitle() {
		List<${table_name}Title> title = new ArrayList<${table_name}Title>();
		for(int i = 0; i < 11; i++){
			${table_name}Title t = new ${table_name}Title();
			t.setCheckType("");
			t.setId("");
			if(i==0){
				t.setH_column("合同编号");
			}else if(i==1){
				t.setH_column("中心名称");
			}else if(i==2){
				t.setH_column("合同签约日期");
			}else if(i==3){
				t.setH_column("合同生效日期");
			}else if(i==4){
				t.setH_column("入门费（￥）");
			}else if(i==5){
				t.setH_column("保证金（￥）");
			}else if(i==6){
				t.setH_column("退费金额（￥）");
			}else if(i==7){
				t.setH_column("合同解约日期");
			}else if(i==8){
				t.setH_column("申请日期");
			}else if(i==9){
				t.setH_column("审批状态");
			}else {
				t.setH_column("操作");
			}
			title.add(t);
		}
		return title;
	}

}
