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
	
}
