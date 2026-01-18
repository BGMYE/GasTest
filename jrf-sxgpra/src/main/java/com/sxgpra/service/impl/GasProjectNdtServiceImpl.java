package com.sxgpra.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxgpra.mapper.GasProjectNdtMapper;
import com.sxgpra.domain.GasProjectNdt;
import com.sxgpra.service.IGasProjectNdtService;

/**
 * 项目检测单位Service业务层处理
 * 
 * @author xatu
 * @date 2026-01-18
 */
@Service
public class GasProjectNdtServiceImpl implements IGasProjectNdtService 
{
    @Autowired
    private GasProjectNdtMapper gasProjectNdtMapper;

    /**
     * 查询项目检测单位
     * 
     * @param projectNdtId 项目检测单位主键
     * @return 项目检测单位
     */
    @Override
    public GasProjectNdt selectGasProjectNdtByProjectNdtId(String projectNdtId)
    {
        return gasProjectNdtMapper.selectGasProjectNdtByProjectNdtId(projectNdtId);
    }

    /**
     * 查询项目检测单位列表
     * 
     * @param gasProjectNdt 项目检测单位
     * @return 项目检测单位
     */
    @Override
    public List<GasProjectNdt> selectGasProjectNdtList(GasProjectNdt gasProjectNdt)
    {
        return gasProjectNdtMapper.selectGasProjectNdtList(gasProjectNdt);
    }

    /**
     * 新增项目检测单位
     * 
     * @param gasProjectNdt 项目检测单位
     * @return 结果
     */
    @Override
    public int insertGasProjectNdt(GasProjectNdt gasProjectNdt)
    {
        gasProjectNdt.setCreateTime(DateUtils.getNowDate());
        return gasProjectNdtMapper.insertGasProjectNdt(gasProjectNdt);
    }

    /**
     * 修改项目检测单位
     * 
     * @param gasProjectNdt 项目检测单位
     * @return 结果
     */
    @Override
    public int updateGasProjectNdt(GasProjectNdt gasProjectNdt)
    {
        gasProjectNdt.setUpdateTime(DateUtils.getNowDate());
        return gasProjectNdtMapper.updateGasProjectNdt(gasProjectNdt);
    }

    /**
     * 批量删除项目检测单位
     * 
     * @param projectNdtIds 需要删除的项目检测单位主键
     * @return 结果
     */
    @Override
    public int deleteGasProjectNdtByProjectNdtIds(String[] projectNdtIds)
    {
        return gasProjectNdtMapper.deleteGasProjectNdtByProjectNdtIds(projectNdtIds);
    }

    /**
     * 删除项目检测单位信息
     * 
     * @param projectNdtId 项目检测单位主键
     * @return 结果
     */
    @Override
    public int deleteGasProjectNdtByProjectNdtId(String projectNdtId)
    {
        return gasProjectNdtMapper.deleteGasProjectNdtByProjectNdtId(projectNdtId);
    }
}
