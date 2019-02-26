<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${table_name}">
	
    <resultMap id="${table_name}Map" type="${table_name}">
    	
    </resultMap>
    
    <sql id="sql_list">
	</sql>
	
	<insert id="insert${table_name}" parameterType="${table_name}">
		INSERT INTO ${table_name}
			(<include refid="sql_list" />)
	   	VALUES (
			
	   	)
	</insert>
	
	<select id="get${table_name}" parameterType="java.util.Map" resultType="${table_name}">
		SELECT
			${table_name}.*
		FROM
			${table_name}
		WHERE
			
	</select>
	
	<select id="selectManageOrgNodesOfAdmin" parameterType="java.util.Map" resultType="String">
		SELECT getManageOrgNodesOfAdmin(${r'#{crmUserId}'})
    </select>
	
	<select id="select${table_name}Count" parameterType="java.util.Map" resultType="java.lang.Integer">
		SELECT
			COUNT(ca.)
		FROM
			${table_name} ca
		WHERE
			ca.revo='0' AND ca.tenantid=${r'#{tenantId}'}
			<if test="ids!=null and ids != '' ">
				and FIND_IN_SET(csco.schoolid, ${r'#{ids}'})
			</if>
			<if test="createUserId!=null and createUserId != '' ">
				AND ca.createtuserid = ${r'#{createUserId}'}
			</if>
			<if test="queryStartTime != null and queryStartTime != ''">
  				<![CDATA[
					AND DATE_FORMAT(ca.createtime, '%Y-%m-%d %H:%i:%S')>=DATE_FORMAT(${r'#{queryStartTime}'}, '%Y-%m-%d %H:%i:%S') 
				]]>
	  		</if>
			<if test="queryEndTime != null and queryEndTime != ''">
  				<![CDATA[
					AND DATE_FORMAT(ca.createtime, '%Y-%m-%d %H:%i:%S')<=DATE_FORMAT(${r'#{queryEndTime}'}, '%Y-%m-%d %H:%i:%S')
				]]>
	  		</if>
	</select>
	
	<select id="select${table_name}list" parameterType="java.util.Map" resultType="${table_name}Json">
		SELECT
			ca.*
		FROM
			${table_name} ca
		WHERE
			ca.revo='0' AND ca.tenantid=${r'#{tenantId}'}
			<if test="ids!=null and ids != '' ">
				and FIND_IN_SET(csco.schoolid, ${r'#{ids}'})
			</if>
			<if test="createUserId!=null and createUserId != '' ">
				AND ca.createtuserid = ${r'#{createUserId}'}
			</if>
			<if test="queryStartTime != null and queryStartTime != ''">
  				<![CDATA[
					AND DATE_FORMAT(ca.createtime, '%Y-%m-%d %H:%i:%S')>=DATE_FORMAT(${r'#{queryStartTime}'}, '%Y-%m-%d %H:%i:%S') 
				]]>
	  		</if>
			<if test="queryEndTime != null and queryEndTime != ''">
  				<![CDATA[
					AND DATE_FORMAT(ca.createtime, '%Y-%m-%d %H:%i:%S')<=DATE_FORMAT(${r'#{queryEndTime}'}, '%Y-%m-%d %H:%i:%S')
				]]>
	  		</if>
		ORDER BY tt.createtime DESC
		LIMIT ${r'#{start}'}, ${r'#{rows}'}
	</select>
	
</mapper>
