package ${package_name}.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
* 描述：${table_annotation}
* @author ${author}
* @date ${date}
*/
public class ${table_name}Org {
	
	private String corgId;
	private String parentId;
	private String level;
	private String orgName;
	private String orgNo;
	private String timeZone;
	private String createUserId;
	private Date createTime;
	private String revo;
	private String tenantId;
	private String parentIds;
	private String belongto;
	private String hasWholeSale;
	private String schStage;
	private String schMode;
	
	public String getcorgId() {
		return corgId;
	}
	public void setcorgId(String corgId) {
		this.corgId = corgId;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgNo() {
		return orgNo;
	}
	public void setOrgNo(String orgNo) {
		this.orgNo = orgNo;
	}
	public String getTimeZone() {
		return timeZone;
	}
	public void setTimeZone(String timeZone) {
		this.timeZone = timeZone;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getRevo() {
		return revo;
	}
	public void setRevo(String revo) {
		this.revo = revo;
	}
	public String getTenantId() {
		return tenantId;
	}
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}
	public String getParentIds() {
		return parentIds;
	}
	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	public String getBelongto() {
		return belongto;
	}
	public void setBelongto(String belongto) {
		this.belongto = belongto;
	}
	public String getHasWholeSale() {
		return hasWholeSale;
	}
	public void setHasWholeSale(String hasWholeSale) {
		this.hasWholeSale = hasWholeSale;
	}
	public String getSchStage() {
		return schStage;
	}
	public void setSchStage(String schStage) {
		this.schStage = schStage;
	}
	public String getSchMode() {
		return schMode;
	}
	public void setSchMode(String schMode) {
		this.schMode = schMode;
	}
	
}
