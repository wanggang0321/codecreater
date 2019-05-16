package ${package_name}.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${package_name}.dao.${table_name}Dao;
import ${package_name}.entity.${table_name};
import ${package_name}.entity.${table_name}Json;

@Service
public class ${table_name}Service {
	
    @Autowired
    private ${table_name}Dao ${table_name?uncap_first}Dao;
	
	public void insert${table_name}(${table_name} ${table_name?uncap_first}) {
		${table_name?uncap_first}Dao.insert${table_name}(${table_name?uncap_first});
	}
	
	public ${table_name} get${table_name}(Map<String, Object> sqlMap) {
		return ${table_name?uncap_first}Dao.get${table_name}(sqlMap);
	}
	
	public String selectManageOrgNodesOfAdmin(Map<String, Object> sqlMap) {
		return ${table_name?uncap_first}Dao.selectManageOrgNodesOfAdmin(sqlMap);
	}
	
	public int select${table_name}Count(Map<String, Object> sqlMap) {
		return ${table_name?uncap_first}Dao.select${table_name}Count(sqlMap);
	}
	
	public List<${table_name}Json> select${table_name}list(Map<String, Object> sqlMap) {
		return ${table_name?uncap_first}Dao.select${table_name}list(sqlMap);
	}
	
	public List<${table_name}Org> getOrganizationTree(Map<String, Object> sqlMap) {
		return ${table_name?uncap_first}Dao.getOrganizationTree(sqlMap);
	}

	public List<String> selectChildOrgByOrgId(String userId , String selectedSchoolId) {
		
		List<String> orgList = new ArrayList<String>();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("selectedSchoolId", selectedSchoolId);
		map.put("userId", userId);
		String orgstr = ${table_name?uncap_first}Dao.selectChildOrgByOrgId(map);
		
		String[] split = orgstr.split(","); 
		for (int i = 0; i < split.length; i++) {
			String orgId = split[i];
			if(!"$".equals(orgId) && (!orgList.contains(orgId))){
				orgList.add(orgId);
			}
		}
		return orgList;
	}

	public List<String> getManageOrgNodes(String userId) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("userId", userId);
		String manageOrgNodes = ${table_name?uncap_first}Dao.getManageOrgNodes(map);
		
		List<String> orgIdList = new ArrayList<String>();
		String[] split = manageOrgNodes.split(",");
		for (int i = 0; i < split.length; i++) {
			String orgId = split[i];
			if(!"$".equals(orgId) && (!orgIdList.contains(orgId))){
				orgIdList.add(orgId);
			}
		}
		return orgIdList;
	}

	public List<String> getManageOrgNodesOfAdmin(String tenantId) {
		Map<String, String> sqlMap = new HashMap<String, String>();
		sqlMap.put("tenantId", tenantId);
		return ${table_name?uncap_first}Dao.getManageOrgNodesOfAdmin(sqlMap);
	}
	
}
