package com.ruoyi.flowable.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 流程发起人配置对象 flow_initiator_config
 * 
 * @author ruoyi
 * @date 2024-01-01
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class FlowInitiatorConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键
     * -- GETTER --
     *  获取主键
     *
     *
     * -- SETTER --
     *  设置主键
     *
     @return 主键
      * @param id 主键
     */
    private Long id;

    /** 流程部署ID
     * -- GETTER --
     *  获取流程部署ID
     *
     *
     * -- SETTER --
     *  设置流程部署ID
     *
     @return 流程部署ID
      * @param deployId 流程部署ID
     */
    @Excel(name = "流程部署ID")
    private String deployId;

    /** 流程定义ID
     * -- GETTER --
     *  获取流程定义ID
     *
     *
     * -- SETTER --
     *  设置流程定义ID
     *
     @return 流程定义ID
      * @param procDefId 流程定义ID
     */
    @Excel(name = "流程定义ID")
    private String procDefId;

    /** 流程定义Key
     * -- GETTER --
     *  获取流程定义Key
     *
     *
     * -- SETTER --
     *  设置流程定义Key
     *
     @return 流程定义Key
      * @param procDefKey 流程定义Key
     */
    @Excel(name = "流程定义Key")
    private String procDefKey;

    /** 发起人类型：1-用户，2-部门，3-角色
     * -- GETTER --
     *  获取发起人类型
     *
     *
     * -- SETTER --
     *  设置发起人类型
     *
     @return 发起人类型：1-用户，2-部门，3-角色
      * @param initiatorType 发起人类型：1-用户，2-部门，3-角色
     */
    @Excel(name = "发起人类型", readConverterExp = "1=用户,2=部门,3=角色")
    private Integer initiatorType;

    /** 发起人ID（用户ID、部门ID或角色ID）
     * -- GETTER --
     *  获取发起人ID
     *
     *
     * -- SETTER --
     *  设置发起人ID
     *
     @return 发起人ID（用户ID、部门ID或角色ID）
      * @param initiatorId 发起人ID（用户ID、部门ID或角色ID）
     */
    @Excel(name = "发起人ID")
    private String initiatorId;

    /** 发起人名称
     * -- GETTER --
     *  获取发起人名称
     *
     *
     * -- SETTER --
     *  设置发起人名称
     *
     @return 发起人名称
      * @param initiatorName 发起人名称
     */
    @Excel(name = "发起人名称")
    private String initiatorName;

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deployId", getDeployId())
            .append("procDefId", getProcDefId())
            .append("procDefKey", getProcDefKey())
            .append("initiatorType", getInitiatorType())
            .append("initiatorId", getInitiatorId())
            .append("initiatorName", getInitiatorName())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}