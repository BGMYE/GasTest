package com.sxgpra.gasAreaManage.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxgpra.gasAreaManage.mapper.GasAreaManageMapper;
import com.sxgpra.gasAreaManage.domain.GasAreaManage;
import com.sxgpra.gasAreaManage.service.IGasAreaManageService;

/**
 * 监检区域分配Service业务层处理
 * 
 * @author 岳鑫
 * @date 2026-01-01
 */
@Service
public class GasAreaManageServiceImpl implements IGasAreaManageService 
{
    @Autowired
    private GasAreaManageMapper gasAreaManageMapper;

    /**
     * 查询监检区域分配
     * 
     * @param areaManageId 监检区域分配主键
     * @return 监检区域分配
     */
    @Override
    public GasAreaManage selectGasAreaManageByAreaManageId(Long areaManageId)
    {
        return gasAreaManageMapper.selectGasAreaManageByAreaManageId(areaManageId);
    }

    /**
     * 查询监检区域分配列表
     * 
     * @param gasAreaManage 监检区域分配
     * @return 监检区域分配
     */
    @Override
    public List<GasAreaManage> selectGasAreaManageList(GasAreaManage gasAreaManage)
    {
        return gasAreaManageMapper.selectGasAreaManageList(gasAreaManage);
    }

    /**
     * 新增监检区域分配
     * 
     * @param gasAreaManage 监检区域分配
     * @return 结果
     */
    @Override
    public int insertGasAreaManage(GasAreaManage gasAreaManage)
    {
        gasAreaManage.setCreateTime(DateUtils.getNowDate());
        SysUser user = SecurityUtils.getLoginUser().getUser();
        gasAreaManage.setCreateBy(user.getUserName());
        return gasAreaManageMapper.insertGasAreaManage(gasAreaManage);
    }

    /**
     * 修改监检区域分配
     * 
     * @param gasAreaManage 监检区域分配
     * @return 结果
     */
    @Override
    public int updateGasAreaManage(GasAreaManage gasAreaManage)
    {
        gasAreaManage.setUpdateTime(DateUtils.getNowDate());
        return gasAreaManageMapper.updateGasAreaManage(gasAreaManage);
    }

    /**
     * 批量删除监检区域分配
     * 
     * @param areaManageIds 需要删除的监检区域分配主键
     * @return 结果
     */
    @Override
    public int deleteGasAreaManageByAreaManageIds(Long[] areaManageIds)
    {
        return gasAreaManageMapper.deleteGasAreaManageByAreaManageIds(areaManageIds);
    }

    /**
     * 删除监检区域分配信息
     * 
     * @param areaManageId 监检区域分配主键
     * @return 结果
     */
    @Override
    public int deleteGasAreaManageByAreaManageId(Long areaManageId)
    {
        return gasAreaManageMapper.deleteGasAreaManageByAreaManageId(areaManageId);
    }
}
