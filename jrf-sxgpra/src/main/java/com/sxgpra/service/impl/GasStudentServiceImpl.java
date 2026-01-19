package com.sxgpra.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxgpra.mapper.GasStudentMapper;
import com.sxgpra.domain.GasStudent;
import com.sxgpra.service.IGasStudentService;

/**
 * 学生信息管理Service业务层处理
 * 
 * @author 测试
 * @date 2026-01-19
 */
@Service
public class GasStudentServiceImpl implements IGasStudentService 
{
    @Autowired
    private GasStudentMapper gasStudentMapper;

    /**
     * 查询学生信息管理
     * 
     * @param id 学生信息管理主键
     * @return 学生信息管理
     */
    @Override
    public GasStudent selectGasStudentById(String id)
    {
        return gasStudentMapper.selectGasStudentById(id);
    }

    /**
     * 查询学生信息管理列表
     * 
     * @param gasStudent 学生信息管理
     * @return 学生信息管理
     */
    @Override
    public List<GasStudent> selectGasStudentList(GasStudent gasStudent)
    {
        return gasStudentMapper.selectGasStudentList(gasStudent);
    }

    /**
     * 新增学生信息管理
     * 
     * @param gasStudent 学生信息管理
     * @return 结果
     */
    @Override
    public int insertGasStudent(GasStudent gasStudent)
    {
        return gasStudentMapper.insertGasStudent(gasStudent);
    }

    /**
     * 修改学生信息管理
     * 
     * @param gasStudent 学生信息管理
     * @return 结果
     */
    @Override
    public int updateGasStudent(GasStudent gasStudent)
    {
        return gasStudentMapper.updateGasStudent(gasStudent);
    }

    /**
     * 批量删除学生信息管理
     * 
     * @param ids 需要删除的学生信息管理主键
     * @return 结果
     */
    @Override
    public int deleteGasStudentByIds(String[] ids)
    {
        return gasStudentMapper.deleteGasStudentByIds(ids);
    }

    /**
     * 删除学生信息管理信息
     * 
     * @param id 学生信息管理主键
     * @return 结果
     */
    @Override
    public int deleteGasStudentById(String id)
    {
        return gasStudentMapper.deleteGasStudentById(id);
    }
}
