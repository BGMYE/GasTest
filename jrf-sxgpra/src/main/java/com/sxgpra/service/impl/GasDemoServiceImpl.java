package com.sxgpra.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxgpra.mapper.GasDemoMapper;
import com.sxgpra.domain.GasDemo;
import com.sxgpra.service.IGasDemoService;

/**
 * 示例树Service业务层处理
 * 
 * @author xatu
 * @date 2026-01-20
 */
@Service
public class GasDemoServiceImpl implements IGasDemoService 
{
    @Autowired
    private GasDemoMapper gasDemoMapper;

    /**
     * 查询示例树
     * 
     * @param demoId 示例树主键
     * @return 示例树
     */
    @Override
    public GasDemo selectGasDemoByDemoId(String demoId)
    {
        return gasDemoMapper.selectGasDemoByDemoId(demoId);
    }

    /**
     * 查询示例树列表
     * 
     * @param gasDemo 示例树
     * @return 示例树
     */
    @Override
    public List<GasDemo> selectGasDemoList(GasDemo gasDemo)
    {
        return gasDemoMapper.selectGasDemoList(gasDemo);
    }

    /**
     * 新增示例树
     * 
     * @param gasDemo 示例树
     * @return 结果
     */
    @Override
    public int insertGasDemo(GasDemo gasDemo)
    {
        gasDemo.setCreateTime(DateUtils.getNowDate());
        return gasDemoMapper.insertGasDemo(gasDemo);
    }

    /**
     * 修改示例树
     * 
     * @param gasDemo 示例树
     * @return 结果
     */
    @Override
    public int updateGasDemo(GasDemo gasDemo)
    {
        gasDemo.setUpdateTime(DateUtils.getNowDate());
        return gasDemoMapper.updateGasDemo(gasDemo);
    }

    /**
     * 批量删除示例树
     * 
     * @param demoIds 需要删除的示例树主键
     * @return 结果
     */
    @Override
    public int deleteGasDemoByDemoIds(String[] demoIds)
    {
        return gasDemoMapper.deleteGasDemoByDemoIds(demoIds);
    }

    /**
     * 删除示例树信息
     * 
     * @param demoId 示例树主键
     * @return 结果
     */
    @Override
    public int deleteGasDemoByDemoId(String demoId)
    {
        return gasDemoMapper.deleteGasDemoByDemoId(demoId);
    }
}
