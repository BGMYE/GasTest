package com.ruoyi.flowable.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.flowable.mapper.FlowInitiatorConfigMapper;
import com.ruoyi.flowable.domain.FlowInitiatorConfig;
import com.ruoyi.flowable.service.IFlowInitiatorConfigService;
import com.ruoyi.system.service.ISysUserService;

/**
 * 流程发起人配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-01-01
 */
@Service
public class FlowInitiatorConfigServiceImpl implements IFlowInitiatorConfigService 
{
    @Autowired
    private FlowInitiatorConfigMapper flowInitiatorConfigMapper;

    @Autowired
    private ISysUserService userService;

    /**
     * 查询流程发起人配置
     * 
     * @param id 流程发起人配置主键
     * @return 流程发起人配置
     */
    @Override
    public FlowInitiatorConfig selectFlowInitiatorConfigById(Long id)
    {
        return flowInitiatorConfigMapper.selectFlowInitiatorConfigById(id);
    }

    /**
     * 查询流程发起人配置列表
     * 
     * @param flowInitiatorConfig 流程发起人配置
     * @return 流程发起人配置
     */
    @Override
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigList(FlowInitiatorConfig flowInitiatorConfig)
    {
        return flowInitiatorConfigMapper.selectFlowInitiatorConfigList(flowInitiatorConfig);
    }

    /**
     * 根据流程定义ID查询发起人配置列表
     * 
     * @param procDefId 流程定义ID
     * @return 流程发起人配置集合
     */
    @Override
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigByProcDefId(String procDefId)
    {
        return flowInitiatorConfigMapper.selectFlowInitiatorConfigByProcDefId(procDefId);
    }

    /**
     * 根据流程定义Key查询发起人配置列表
     * 
     * @param procDefKey 流程定义Key
     * @return 流程发起人配置集合
     */
    @Override
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigByProcDefKey(String procDefKey)
    {
        return flowInitiatorConfigMapper.selectFlowInitiatorConfigByProcDefKey(procDefKey);
    }

    /**
     * 根据部署ID查询发起人配置列表
     * 
     * @param deployId 部署ID
     * @return 流程发起人配置集合
     */
    @Override
    public List<FlowInitiatorConfig> selectFlowInitiatorConfigByDeployId(String deployId)
    {
        return flowInitiatorConfigMapper.selectFlowInitiatorConfigByDeployId(deployId);
    }

    /**
     * 新增流程发起人配置
     * 
     * @param flowInitiatorConfig 流程发起人配置
     * @return 结果
     */
    @Override
    public int insertFlowInitiatorConfig(FlowInitiatorConfig flowInitiatorConfig)
    {
        flowInitiatorConfig.setCreateTime(DateUtils.getNowDate());
        flowInitiatorConfig.setCreateBy(SecurityUtils.getUsername());
        return flowInitiatorConfigMapper.insertFlowInitiatorConfig(flowInitiatorConfig);
    }

    /**
     * 修改流程发起人配置
     * 
     * @param flowInitiatorConfig 流程发起人配置
     * @return 结果
     */
    @Override
    public int updateFlowInitiatorConfig(FlowInitiatorConfig flowInitiatorConfig)
    {
        flowInitiatorConfig.setUpdateTime(DateUtils.getNowDate());
        flowInitiatorConfig.setUpdateBy(SecurityUtils.getUsername());
        return flowInitiatorConfigMapper.updateFlowInitiatorConfig(flowInitiatorConfig);
    }

    /**
     * 批量删除流程发起人配置
     * 
     * @param ids 需要删除的流程发起人配置主键
     * @return 结果
     */
    @Override
    public int deleteFlowInitiatorConfigByIds(Long[] ids)
    {
        return flowInitiatorConfigMapper.deleteFlowInitiatorConfigByIds(ids);
    }

    /**
     * 删除流程发起人配置信息
     * 
     * @param id 流程发起人配置主键
     * @return 结果
     */
    @Override
    public int deleteFlowInitiatorConfigById(Long id)
    {
        return flowInitiatorConfigMapper.deleteFlowInitiatorConfigById(id);
    }

    /**
     * 根据流程定义ID删除发起人配置
     * 
     * @param procDefId 流程定义ID
     * @return 结果
     */
    @Override
    public int deleteFlowInitiatorConfigByProcDefId(String procDefId)
    {
        return flowInitiatorConfigMapper.deleteFlowInitiatorConfigByProcDefId(procDefId);
    }

    /**
     * 根据部署ID删除发起人配置
     * 
     * @param deployId 部署ID
     * @return 结果
     */
    @Override
    public int deleteFlowInitiatorConfigByDeployId(String deployId)
    {
        return flowInitiatorConfigMapper.deleteFlowInitiatorConfigByDeployId(deployId);
    }

    /**
     * 保存流程发起人配置（批量保存）
     * 
     * @param procDefId 流程定义ID
     * @param procDefKey 流程定义Key
     * @param deployId 部署ID
     * @param configList 发起人配置列表
     * @return 结果
     */
    @Override
    @Transactional
    public int saveFlowInitiatorConfig(String procDefId, String procDefKey, String deployId, List<FlowInitiatorConfig> configList)
    {
        // 先删除原有配置
        flowInitiatorConfigMapper.deleteFlowInitiatorConfigByProcDefId(procDefId);
        
        // 批量插入新配置
        int result = 0;
        if (configList != null && !configList.isEmpty()) {
            for (FlowInitiatorConfig config : configList) {
                config.setProcDefId(procDefId);
                config.setProcDefKey(procDefKey);
                config.setDeployId(deployId);
                config.setCreateTime(DateUtils.getNowDate());
                config.setCreateBy(SecurityUtils.getUsername());
                result += flowInitiatorConfigMapper.insertFlowInitiatorConfig(config);
            }
        }
        return result;
    }

    /**
     * 检查用户是否有权限发起指定流程
     * 
     * @param procDefId 流程定义ID
     * @param userId 用户ID
     * @return 是否有权限
     */
    @Override
    public boolean checkUserCanStartProcess(String procDefId, Long userId)
    {
        // 查询该流程的发起人配置
        List<FlowInitiatorConfig> configList = selectFlowInitiatorConfigByProcDefId(procDefId);
        
        // 如果没有配置发起人限制，则所有人都可以发起
        if (configList == null || configList.isEmpty()) {
            return true;
        }
        
        // 获取用户信息
        SysUser user = userService.selectUserById(userId);
        if (user == null) {
            return false;
        }
        
        // 检查发起人配置
        for (FlowInitiatorConfig config : configList) {
            switch (config.getInitiatorType()) {
                case 1: // 用户
                    if (userId.toString().equals(config.getInitiatorId())) {
                        return true;
                    }
                    break;
                case 2: // 部门
                    if (user.getDeptId() != null && user.getDeptId().toString().equals(config.getInitiatorId())) {
                        return true;
                    }
                    break;
                case 3: // 角色
                    if (user.getRoles() != null) {
                        for (SysRole role : user.getRoles()) {
                            if (role.getRoleId().toString().equals(config.getInitiatorId())) {
                                return true;
                            }
                        }
                    }
                    break;
            }
        }
        
        return false;
    }
}