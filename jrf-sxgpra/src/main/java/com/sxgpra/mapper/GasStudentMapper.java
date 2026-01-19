package com.sxgpra.mapper;

import java.util.List;
import com.sxgpra.domain.GasStudent;

/**
 * 学生信息管理Mapper接口
 * 
 * @author 测试
 * @date 2026-01-19
 */
public interface GasStudentMapper 
{
    /**
     * 查询学生信息管理
     * 
     * @param id 学生信息管理主键
     * @return 学生信息管理
     */
    public GasStudent selectGasStudentById(String id);

    /**
     * 查询学生信息管理列表
     * 
     * @param gasStudent 学生信息管理
     * @return 学生信息管理集合
     */
    public List<GasStudent> selectGasStudentList(GasStudent gasStudent);

    /**
     * 新增学生信息管理
     * 
     * @param gasStudent 学生信息管理
     * @return 结果
     */
    public int insertGasStudent(GasStudent gasStudent);

    /**
     * 修改学生信息管理
     * 
     * @param gasStudent 学生信息管理
     * @return 结果
     */
    public int updateGasStudent(GasStudent gasStudent);

    /**
     * 删除学生信息管理
     * 
     * @param id 学生信息管理主键
     * @return 结果
     */
    public int deleteGasStudentById(String id);

    /**
     * 批量删除学生信息管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGasStudentByIds(String[] ids);
}
