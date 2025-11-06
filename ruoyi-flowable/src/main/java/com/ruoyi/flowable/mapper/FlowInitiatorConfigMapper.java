package com.ruoyi.flowable.mapper;

import java.util.List;
import com.ruoyi.flowable.domain.FlowInitiatorConfig;

/**
 * 流程发起人配置Mapper接口
 * 
 * @author ruoyi
 * @date 2024-01-01
 */
public interface FlowInitiatorConfigMapper 
{
    /**
     * 查询流程发起人配置
     * 
     * @param id 流程发起人配置主键
     * @return 流程发起人配置
     */
    public FlowInitiatorConfig selectFlowInitiatorConfigById(Long id);

    /**
     * 查询流程发起人配置列表
     * 
     * @param flowInitiatorConfig 流程发起人配置
     * @return 流程发起人配置集合
     */
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigList(FlowInitiatorConfig flowInitiatorConfig);

    /**
     * 根据流程定义ID查询发起人配置列表
     * 
     * @param procDefId 流程定义ID
     * @return 流程发起人配置集合
     */
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigByProcDefId(String procDefId);

    /**
     * 根据流程定义Key查询发起人配置列表
     * 
     * @param procDefKey 流程定义Key
     * @return 流程发起人配置集合
     */
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigByProcDefKey(String procDefKey);

    /**
     * 根据部署ID查询发起人配置列表
     * 
     * @param deployId 部署ID
     * @return 流程发起人配置集合
     */
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigByDeployId(String deployId);

    /**
     * 新增流程发起人配置
     * 
     * @param flowInitiatorConfig 流程发起人配置
     * @return 结果
     */
    public int insertFlowInitiatorConfig(FlowInitiatorConfig flowInitiatorConfig);

    /**
     * 修改流程发起人配置
     * 
     * @param flowInitiatorConfig 流程发起人配置
     * @return 结果
     */
    public int updateFlowInitiatorConfig(FlowInitiatorConfig flowInitiatorConfig);

    /**
     * 删除流程发起人配置
     * 
     * @param id 流程发起人配置主键
     * @return 结果
     */
    public int deleteFlowInitiatorConfigById(Long id);

    /**
     * 批量删除流程发起人配置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFlowInitiatorConfigByIds(Long[] ids);

    /**
     * 根据流程定义ID删除发起人配置
     * 
     * @param procDefId 流程定义ID
     * @return 结果
     */
    public int deleteFlowInitiatorConfigByProcDefId(String procDefId);

    /**
     * 根据部署ID删除发起人配置
     * 
     * @param deployId 部署ID
     * @return 结果
     */
    public int deleteFlowInitiatorConfigByDeployId(String deployId);
}