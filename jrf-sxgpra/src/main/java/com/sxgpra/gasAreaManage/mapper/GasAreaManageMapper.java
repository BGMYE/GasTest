package com.sxgpra.gasAreaManage.mapper;

import java.util.List;
import com.sxgpra.gasAreaManage.domain.GasAreaManage;

/**
 * 监检区域分配Mapper接口
 * 
 * @author 岳鑫
 * @date 2026-01-01
 */
public interface GasAreaManageMapper 
{
    /**
     * 查询监检区域分配
     * 
     * @param areaManageId 监检区域分配主键
     * @return 监检区域分配
     */
    public GasAreaManage selectGasAreaManageByAreaManageId(Long areaManageId);

    /**
     * 查询监检区域分配列表
     * 
     * @param gasAreaManage 监检区域分配
     * @return 监检区域分配集合
     */
    public List<GasAreaManage> selectGasAreaManageList(GasAreaManage gasAreaManage);

    /**
     * 新增监检区域分配
     * 
     * @param gasAreaManage 监检区域分配
     * @return 结果
     */
    public int insertGasAreaManage(GasAreaManage gasAreaManage);

    /**
     * 修改监检区域分配
     * 
     * @param gasAreaManage 监检区域分配
     * @return 结果
     */
    public int updateGasAreaManage(GasAreaManage gasAreaManage);

    /**
     * 删除监检区域分配
     * 
     * @param areaManageId 监检区域分配主键
     * @return 结果
     */
    public int deleteGasAreaManageByAreaManageId(Long areaManageId);

    /**
     * 批量删除监检区域分配
     * 
     * @param areaManageIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGasAreaManageByAreaManageIds(Long[] areaManageIds);
}
