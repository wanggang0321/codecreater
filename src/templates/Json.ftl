package ${package_name}.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import net.sf.json.JSONObject;

import com.alibaba.fastjson.annotation.JSONField;
import com.collegepre.aspen.common.utils.DateUtils;
import com.collegepre.aspen.crm.admissions.contract.common.JsonUtil;
import com.collegepre.aspen.crm.tenantadmin.organization.utils.JsonUtils;

public class ${table_name}Json {
	
<#if model_column?exists>
<#list model_column as model>
	@JSONField(ordinal = ${model_index+1})
	<#if (model.columnType = 'VARCHAR' || model.columnType = 'TEXT')>
	private String ${model.changeColumnName?uncap_first}; //${model.columnComment!}
	</#if>
	<#if (model.columnType = 'TIMESTAMP' || model.columnType = 'DATETIME')>
	private Date ${model.changeColumnName?uncap_first}; //${model.columnComment!}
	</#if>
	<#if (model.columnType = 'DECIMAL')>
	private BigDecimal ${model.changeColumnName?uncap_first}; //${model.columnComment!}
	</#if>
</#list>
	@JSONField(ordinal = ${model_column?size+1})
	private String operations;
</#if>

<#if model_column?exists>
<#list model_column as model>
<#if (model.columnType = 'VARCHAR' || model.columnType = 'TEXT')>
	public JSONObject get${model.changeColumnName}() {
		JSONObject json = JsonUtil.getJsonObject(${model.changeColumnName?uncap_first}, "", null, null, "0");
	    return json;
	}
	public void set${model.changeColumnName}(String ${model.changeColumnName?uncap_first}) {
	    this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	}
</#if>
<#if (model.columnType = 'TIMESTAMP' || model.columnType = 'DATETIME')>
	public JSONObject get${model.changeColumnName}() {
		JSONObject json = new JSONObject();
		String dateStr = (null!=${model.changeColumnName?uncap_first}) ? DateUtils.formatDate(${model.changeColumnName?uncap_first}, "yyyy-MM-dd") : " ";
		json = JsonUtil.getJsonObject(dateStr, "", null, null, "0");
		return json;
	}
	public void set${model.changeColumnName}(Date ${model.changeColumnName?uncap_first}) {
	    this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	}
</#if>
<#if (model.columnType = 'DECIMAL')>
	public JSONObject get${model.changeColumnName}() {
		JSONObject json = new JSONObject();
		BigDecimal number = (null!=${model.changeColumnName?uncap_first}) ? ${model.changeColumnName?uncap_first} : BigDecimal.ZERO;
		String numberStr = number.setScale(2,BigDecimal.ROUND_HALF_UP).toPlainString();
		json = JsonUtil.getJsonObject(numberStr, "", null, null, "0");
	    return json;
	}
	public void set${model.changeColumnName}(BigDecimal ${model.changeColumnName?uncap_first}) {
	    this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	}
</#if>
</#list>
</#if>

}
