package com.sxgpra.mapper;

import java.util.List;
import com.sxgpra.domain.GasDemo;

/**
 * 示例树Mapper接口
 * 
 * @author xatu
 * @date 2026-01-20
 */
public interface GasDemoMapper 
{
    /**
     * 查询示例树
     * 
     * @param demoId 示例树主键
     * @return 示例树
     */
    public GasDemo selectGasDemoByDemoId(String demoId);

    /**
     * 查询示例树列表
     * 
     * @param gasDemo 示例树
     * @return 示例树集合
     */
    public List<GasDemo> selectGasDemoList(GasDemo gasDemo);

    /**
     * 新增示例树
     * 
     * @param gasDemo 示例树
     * @return 结果
     */
    public int insertGasDemo(GasDemo gasDemo);

    /**
     * 修改示例树
     * 
     * @param gasDemo 示例树
     * @return 结果
     */
    public int updateGasDemo(GasDemo gasDemo);

    /**
     * 删除示例树
     * 
     * @param demoId 示例树主键
     * @return 结果
     */
    public int deleteGasDemoByDemoId(String demoId);

    /**
     * 批量删除示例树
     * 
     * @param demoIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGasDemoByDemoIds(String[] demoIds);
}
