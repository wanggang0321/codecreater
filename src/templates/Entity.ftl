package ${package_name}.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
* 描述：${table_annotation}模型
* @author ${author}
* @date ${date}
*/
public class ${table_name} {

<#if model_column?exists>
<#list model_column as model>
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
</#if>

<#if model_column?exists>
<#list model_column as model>
<#if (model.columnType = 'VARCHAR' || model.columnType = 'TEXT')>
	public String get${model.changeColumnName}() {
	    return this.${model.changeColumnName?uncap_first};
	}
	public void set${model.changeColumnName}(String ${model.changeColumnName?uncap_first}) {
	    this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	}
</#if>
<#if (model.columnType = 'TIMESTAMP' || model.columnType = 'DATETIME')>
	public Date get${model.changeColumnName}() {
	    return this.${model.changeColumnName?uncap_first};
	}
	public void set${model.changeColumnName}(Date ${model.changeColumnName?uncap_first}) {
	    this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	}
</#if>
<#if (model.columnType = 'DECIMAL')>
	public BigDecimal get${model.changeColumnName}() {
	    return this.${model.changeColumnName?uncap_first};
	}
	public void set${model.changeColumnName}(BigDecimal ${model.changeColumnName?uncap_first}) {
	    this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	}
</#if>
</#list>
</#if>

}
