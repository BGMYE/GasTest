package com.sxgpra.service;

import java.util.List;
import com.sxgpra.domain.GasLocationCheck;

/**
 * 定位校验Service接口
 * 
 * @author xatu
 * @date 2026-01-19
 */
public interface IGasLocationCheckService 
{
    /**
     * 查询定位校验
     * 
     * @param locationCheckId 定位校验主键
     * @return 定位校验
     */
    public GasLocationCheck selectGasLocationCheckByLocationCheckId(String locationCheckId);

    /**
     * 查询定位校验列表
     * 
     * @param gasLocationCheck 定位校验
     * @return 定位校验集合
     */
    public List<GasLocationCheck> selectGasLocationCheckList(GasLocationCheck gasLocationCheck);

    /**
     * 新增定位校验
     * 
     * @param gasLocationCheck 定位校验
     * @return 结果
     */
    public int insertGasLocationCheck(GasLocationCheck gasLocationCheck);

    /**
     * 修改定位校验
     * 
     * @param gasLocationCheck 定位校验
     * @return 结果
     */
    public int updateGasLocationCheck(GasLocationCheck gasLocationCheck);

    /**
     * 批量删除定位校验
     * 
     * @param locationCheckIds 需要删除的定位校验主键集合
     * @return 结果
     */
    public int deleteGasLocationCheckByLocationCheckIds(String[] locationCheckIds);

    /**
     * 删除定位校验信息
     * 
     * @param locationCheckId 定位校验主键
     * @return 结果
     */
    public int deleteGasLocationCheckByLocationCheckId(String locationCheckId);
}
