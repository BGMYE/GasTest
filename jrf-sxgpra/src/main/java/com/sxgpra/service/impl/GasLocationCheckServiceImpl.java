package com.sxgpra.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxgpra.mapper.GasLocationCheckMapper;
import com.sxgpra.domain.GasLocationCheck;
import com.sxgpra.service.IGasLocationCheckService;

/**
 * 定位校验Service业务层处理
 * 
 * @author xatu
 * @date 2026-01-19
 */
@Service
public class GasLocationCheckServiceImpl implements IGasLocationCheckService 
{
    @Autowired
    private GasLocationCheckMapper gasLocationCheckMapper;

    /**
     * 查询定位校验
     * 
     * @param locationCheckId 定位校验主键
     * @return 定位校验
     */
    @Override
    public GasLocationCheck selectGasLocationCheckByLocationCheckId(String locationCheckId)
    {
        return gasLocationCheckMapper.selectGasLocationCheckByLocationCheckId(locationCheckId);
    }

    /**
     * 查询定位校验列表
     * 
     * @param gasLocationCheck 定位校验
     * @return 定位校验
     */
    @Override
    public List<GasLocationCheck> selectGasLocationCheckList(GasLocationCheck gasLocationCheck)
    {
        return gasLocationCheckMapper.selectGasLocationCheckList(gasLocationCheck);
    }

    /**
     * 新增定位校验
     * 
     * @param gasLocationCheck 定位校验
     * @return 结果
     */
    @Override
    public int insertGasLocationCheck(GasLocationCheck gasLocationCheck)
    {
        gasLocationCheck.setCreateTime(DateUtils.getNowDate());
        return gasLocationCheckMapper.insertGasLocationCheck(gasLocationCheck);
    }

    /**
     * 修改定位校验
     * 
     * @param gasLocationCheck 定位校验
     * @return 结果
     */
    @Override
    public int updateGasLocationCheck(GasLocationCheck gasLocationCheck)
    {
        gasLocationCheck.setUpdateTime(DateUtils.getNowDate());
        return gasLocationCheckMapper.updateGasLocationCheck(gasLocationCheck);
    }

    /**
     * 批量删除定位校验
     * 
     * @param locationCheckIds 需要删除的定位校验主键
     * @return 结果
     */
    @Override
    public int deleteGasLocationCheckByLocationCheckIds(String[] locationCheckIds)
    {
        return gasLocationCheckMapper.deleteGasLocationCheckByLocationCheckIds(locationCheckIds);
    }

    /**
     * 删除定位校验信息
     * 
     * @param locationCheckId 定位校验主键
     * @return 结果
     */
    @Override
    public int deleteGasLocationCheckByLocationCheckId(String locationCheckId)
    {
        return gasLocationCheckMapper.deleteGasLocationCheckByLocationCheckId(locationCheckId);
    }
}
