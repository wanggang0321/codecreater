package ${package_name}.entity;

import com.alibaba.fastjson.annotation.JSONField;

public class ${table_name}Title {
	
	@JSONField(ordinal = 1)
	private String id;
	@JSONField(ordinal = 2)
	private String h_column;
	@JSONField(ordinal = 3)
	private String checkType;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getH_column() {
		return h_column;
	}
	public void setH_column(String h_column) {
		this.h_column = h_column;
	}
	public String getCheckType() {
		return checkType;
	}
	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}
	
}
