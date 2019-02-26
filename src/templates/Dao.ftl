package ${package_name}.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.collegepre.aspen.common.dao.BaseDao;
import ${package_name}.entity.${table_name};
import ${package_name}.entity.${table_name}Json;

@Repository
public class ${table_name}Dao extends BaseDao {
	
	public void insert${table_name}(${table_name} ${table_name?uncap_first}) {
		super.getSqlSession().insert("${table_name}.insert${table_name}", ${table_name?uncap_first});
	}
	
	public ${table_name} get${table_name}(Map<String, Object> sqlMap) {
		return super.getSqlSession().selectOne("${table_name}.get${table_name}", sqlMap);
	}
	
	public String selectManageOrgNodesOfAdmin(Map<String, Object> sqlMap) {
		return super.getSqlSession().selectOne("${table_name}.selectManageOrgNodesOfAdmin", sqlMap);
	}

	public int select${table_name}Count(Map<String, Object> sqlMap) {
		return super.getSqlSession().selectOne("${table_name}.select${table_name}Count", sqlMap);
	}
	
	public List<${table_name}Json> select${table_name}list(Map<String, Object> sqlMap) {
		return super.getSqlSession().selectList("${table_name}.select${table_name}list", sqlMap);
	}
	
}
