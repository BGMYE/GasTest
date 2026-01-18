package com.sxgpra.mapper;

import java.util.List;
import com.sxgpra.domain.GasProjectNdt;

/**
 * 项目检测单位Mapper接口
 * 
 * @author xatu
 * @date 2026-01-18
 */
public interface GasProjectNdtMapper 
{
    /**
     * 查询项目检测单位
     * 
     * @param projectNdtId 项目检测单位主键
     * @return 项目检测单位
     */
    public GasProjectNdt selectGasProjectNdtByProjectNdtId(Long projectNdtId);

    /**
     * 查询项目检测单位列表
     * 
     * @param gasProjectNdt 项目检测单位
     * @return 项目检测单位集合
     */
    public List<GasProjectNdt> selectGasProjectNdtList(GasProjectNdt gasProjectNdt);

    /**
     * 新增项目检测单位
     * 
     * @param gasProjectNdt 项目检测单位
     * @return 结果
     */
    public int insertGasProjectNdt(GasProjectNdt gasProjectNdt);

    /**
     * 修改项目检测单位
     * 
     * @param gasProjectNdt 项目检测单位
     * @return 结果
     */
    public int updateGasProjectNdt(GasProjectNdt gasProjectNdt);

    /**
     * 删除项目检测单位
     * 
     * @param projectNdtId 项目检测单位主键
     * @return 结果
     */
    public int deleteGasProjectNdtByProjectNdtId(Long projectNdtId);

    /**
     * 批量删除项目检测单位
     * 
     * @param projectNdtIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGasProjectNdtByProjectNdtIds(Long[] projectNdtIds);
}
