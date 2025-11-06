package com.ruoyi.flowable.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.flowable.common.constant.ProcessConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.flowable.common.enums.FlowComment;
import com.ruoyi.flowable.service.IFlowInitiatorConfigService;
import com.ruoyi.system.domain.FlowProcDefDto;
import com.ruoyi.flowable.factory.FlowServiceFactory;
import com.ruoyi.flowable.service.IFlowDefinitionService;
import com.ruoyi.flowable.service.ISysDeployFormService;
import com.ruoyi.system.domain.SysForm;
import com.ruoyi.system.mapper.FlowDeployMapper;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.system.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.repository.ProcessDefinitionQuery;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.image.impl.DefaultProcessDiagramGenerator;
import org.flowable.task.api.Task;
import org.springframework.beans.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * 流程定义
 *
 * @author Tony
 * @date 2021-04-03
 */
@Service
@Slf4j
public class FlowDefinitionServiceImpl extends FlowServiceFactory implements IFlowDefinitionService {

    @Resource
    private ISysDeployFormService sysDeployFormService;

    @Resource
    private ISysUserService sysUserService;

    @Resource
    private ISysDeptService sysDeptService;

    @Resource
    private FlowDeployMapper flowDeployMapper;

    @Resource
    private IFlowInitiatorConfigService flowInitiatorConfigService;

    @Resource
    private ApplicationContext applicationContext;

    private static final String BPMN_FILE_SUFFIX = ".bpmn";

    @Override
    public boolean exist(String processDefinitionKey) {
        ProcessDefinitionQuery processDefinitionQuery
                = repositoryService.createProcessDefinitionQuery().processDefinitionKey(processDefinitionKey);
        long count = processDefinitionQuery.count();
        return count > 0 ? true : false;
    }


    /**
     * 流程定义列表
     *
     * @param pageNum  当前页码
     * @param pageSize 每页条数
     * @return 流程定义分页列表数据
     */
    @Override
    public Page<FlowProcDefDto> list(String name, Integer pageNum, Integer pageSize) {
        Page<FlowProcDefDto> page = new Page<>();
//        // 流程定义列表数据查询
//        final ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
//        if (StringUtils.isNotEmpty(name)) {
//            processDefinitionQuery.processDefinitionNameLike(name);
//        }
////        processDefinitionQuery.orderByProcessDefinitionKey().asc();
//        page.setTotal(processDefinitionQuery.count());
//        List<ProcessDefinition> processDefinitionList = processDefinitionQuery.listPage(pageSize * (pageNum - 1), pageSize);
//
//        List<FlowProcDefDto> dataList = new ArrayList<>();
//        for (ProcessDefinition processDefinition : processDefinitionList) {
//            String deploymentId = processDefinition.getDeploymentId();
//            Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(deploymentId).singleResult();
//            FlowProcDefDto reProcDef = new FlowProcDefDto();
//            BeanUtils.copyProperties(processDefinition, reProcDef);
//            SysForm sysForm = sysDeployFormService.selectSysDeployFormByDeployId(deploymentId);
//            if (Objects.nonNull(sysForm)) {
//                reProcDef.setFormName(sysForm.getFormName());
//                reProcDef.setFormId(sysForm.getFormId());
//            }
//            // 流程定义时间
//            reProcDef.setDeploymentTime(deployment.getDeploymentTime());
//            dataList.add(reProcDef);
//        }
        PageHelper.startPage(pageNum, pageSize);
        final List<FlowProcDefDto> dataList = flowDeployMapper.selectDeployList(name);
        // 加载挂表单
        for (FlowProcDefDto procDef : dataList) {
            SysForm sysForm = sysDeployFormService.selectSysDeployFormByDeployId(procDef.getDeploymentId());
            if (Objects.nonNull(sysForm)) {
                procDef.setFormName(sysForm.getFormName());
                procDef.setFormId(sysForm.getFormId());
            }
        }
        page.setTotal(new PageInfo(dataList).getTotal());
        page.setRecords(dataList);
        return page;
    }

    @Override
    public List<FlowProcDefDto> getProcessHistory(String processKey) {
        List<FlowProcDefDto> flowList = flowDeployMapper.selectDeployListByKey(processKey);
        // 加载挂载的表单信息
        for (FlowProcDefDto procDef : flowList) {
            SysForm sysForm = sysDeployFormService.selectSysDeployFormByDeployId(procDef.getDeploymentId());
            if (Objects.nonNull(sysForm)) {
                procDef.setFormName(sysForm.getFormName());
                procDef.setFormId(sysForm.getFormId());
            }
        }
        return flowList;
    }

    @Override
    public void deleteProcessHistory(String deploymentId) {
        // 删除流程部署
        repositoryService.deleteDeployment(deploymentId, true);
    }

    @Override
    public FlowProcDefDto rollbackToVersion(String sourceDeploymentId, String processKey, String processName) {
        try {
            // 获取源版本的BPMN XML
            String xmlContent = null;
            List<String> resourceNames = repositoryService.getDeploymentResourceNames(sourceDeploymentId);
            for (String resourceName : resourceNames) {
                if (resourceName.endsWith(".bpmn") || resourceName.endsWith(".xml")) {
                    InputStream inputStream = repositoryService.getResourceAsStream(sourceDeploymentId, resourceName);
                    xmlContent = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
                    break;
                }
            }
            
            if (StringUtils.isEmpty(xmlContent)) {
                throw new RuntimeException("无法获取源版本的BPMN内容");
            }
            
            // 创建新的部署
            String deploymentName = processName + "_回退版本_" + System.currentTimeMillis();
            Deployment deployment = repositoryService.createDeployment()
                    .addString(processKey + ".bpmn", xmlContent)
                    .name(deploymentName)
                    .category("rollback")
                    .deploy();
            
            // 获取新创建的流程定义
            ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                    .deploymentId(deployment.getId())
                    .singleResult();
            
            // 构造返回对象
            FlowProcDefDto flowProcDefDto = new FlowProcDefDto();
            BeanUtils.copyProperties(processDefinition, flowProcDefDto);
            flowProcDefDto.setDeploymentTime(deployment.getDeploymentTime());
            flowProcDefDto.setFlowKey(processDefinition.getKey());
            
            return flowProcDefDto;
            
        } catch (Exception e) {
            log.error("流程版本回退失败：", e);
            throw new RuntimeException("流程版本回退失败：" + e.getMessage());
        }
    }

    /**
     * 导入流程文件
     *
     * 当每个key的流程第一次部署时，指定版本为1。对其后所有使用相同key的流程定义，
     * 部署时版本会在该key当前已部署的最高版本号基础上加1。key参数用于区分流程定义
     * @param name
     * @param category
     * @param in
     * @return 部署信息，包含deployId和procDefId
     */
    @Override
    public Map<String, String> importFile(String name, String category, InputStream in) {
        Deployment deploy = repositoryService.createDeployment().addInputStream(name + BPMN_FILE_SUFFIX, in).name(name).category(category).deploy();
        ProcessDefinition definition = repositoryService.createProcessDefinitionQuery().deploymentId(deploy.getId()).singleResult();
        repositoryService.setProcessDefinitionCategory(definition.getId(), category);
        
        // 返回部署信息
        Map<String, String> result = new HashMap<>();
        result.put("deployId", deploy.getId());
        result.put("procDefId", definition.getId());
        result.put("procDefKey", definition.getKey());
        return result;
    }

    /**
     * 执行表单提交方法
     * 解析formSubmit字符串并调用对应的service方法
     * 
     * @param formSubmit 表单提交方法字符串，格式如：qingjiaServiceImpl.insert(Qingjia qingjia)
     * @param variables 流程变量，包含表单数据
     * @throws Exception 执行异常
     */
    private void executeFormSubmit(String formSubmit, Map<String, Object> variables) throws Exception {
        // 解析formSubmit字符串
        // 格式：serviceName.methodName(EntityClass entityParam)
        if (!formSubmit.contains(".") || !formSubmit.contains("(")) {
            throw new IllegalArgumentException("formSubmit格式错误，应为：serviceName.methodName(EntityClass entityParam)");
        }
        
        // 提取service名称
        String serviceName = formSubmit.substring(0, formSubmit.indexOf("."));
        
        // 提取方法名
        String methodPart = formSubmit.substring(formSubmit.indexOf(".") + 1);
        String methodName = methodPart.substring(0, methodPart.indexOf("("));
        
        // 提取参数类型
        String paramPart = methodPart.substring(methodPart.indexOf("(") + 1, methodPart.lastIndexOf(")"));
        String[] paramParts = paramPart.trim().split("\\s+");
        
        if (paramParts.length < 2) {
            throw new IllegalArgumentException("参数格式错误，应为：EntityClass entityParam");
        }
        
        String entityClassName = paramParts[0];
        
        // 获取service bean
        Object serviceBean = applicationContext.getBean(serviceName);
        if (serviceBean == null) {
            throw new RuntimeException("未找到service bean: " + serviceName);
        }
        
        // 获取实体类
        Class<?> entityClass;
        try {
            // 尝试从常见包路径查找实体类
            entityClass = findEntityClass(entityClassName);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("未找到实体类: " + entityClassName, e);
        }
        
        // 将variables转换为实体对象
        Object entityObject = convertVariablesToEntity(variables, entityClass);
        
        // 获取方法并调用
        Method method = serviceBean.getClass().getMethod(methodName, entityClass);
        method.invoke(serviceBean, entityObject);
        
        log.info("成功调用方法: {}.{}，参数类型: {}", serviceName, methodName, entityClassName);
    }
    
    /**
     * 查找实体类
     * 
     * @param entityClassName 实体类名
     * @return 实体类Class对象
     * @throws ClassNotFoundException 类未找到异常
     */
    private Class<?> findEntityClass(String entityClassName) throws ClassNotFoundException {
        // 常见的实体类包路径
        String[] packagePaths = {
            "com.ruoyi.system.domain.",
            "com.ruoyi.flowable.domain.",
            "com.ruoyi.common.core.domain.",
            "com.ruoyi.domain.",
            ""
        };
        
        for (String packagePath : packagePaths) {
            try {
                return Class.forName(packagePath + entityClassName);
            } catch (ClassNotFoundException e) {
                // 继续尝试下一个包路径
            }
        }
        
        // 如果都找不到，抛出异常
        throw new ClassNotFoundException("在常见包路径中未找到实体类: " + entityClassName);
    }
    
    /**
     * 将variables转换为实体对象
     * 
     * @param variables 流程变量
     * @param entityClass 实体类
     * @return 实体对象
     * @throws Exception 转换异常
     */
    private Object convertVariablesToEntity(Map<String, Object> variables, Class<?> entityClass) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        
        // 创建实体对象实例
        Object entityObject = entityClass.getDeclaredConstructor().newInstance();
        
        // 使用反射设置属性值
        java.lang.reflect.Field[] fields = entityClass.getDeclaredFields();
        for (java.lang.reflect.Field field : fields) {
            field.setAccessible(true);
            String fieldName = field.getName();
            
            // 跳过静态字段和序列化字段
            if (java.lang.reflect.Modifier.isStatic(field.getModifiers()) || 
                "serialVersionUID".equals(fieldName)) {
                continue;
            }
            
            // 如果variables中有对应的值，则设置
            if (variables.containsKey(fieldName)) {
                Object value = variables.get(fieldName);
                if (value != null) {
                    // 类型转换
                    Object convertedValue = convertValue(value, field.getType());
                    field.set(entityObject, convertedValue);
                }
            }
        }
        
        log.debug("转换后的实体对象: {}", entityObject);
        return entityObject;
    }
    
    /**
     * 值类型转换
     * 
     * @param value 原始值
     * @param targetType 目标类型
     * @return 转换后的值
     */
    private Object convertValue(Object value, Class<?> targetType) {
        if (value == null || targetType.isAssignableFrom(value.getClass())) {
            return value;
        }
        
        // 字符串转换
        if (targetType == String.class) {
            return value.toString();
        }
        
        // 数字类型转换
        if (value instanceof String) {
            String strValue = (String) value;
            if (targetType == Integer.class || targetType == int.class) {
                return StringUtils.isNotEmpty(strValue) ? Integer.valueOf(strValue) : null;
            } else if (targetType == Long.class || targetType == long.class) {
                return StringUtils.isNotEmpty(strValue) ? Long.valueOf(strValue) : null;
            } else if (targetType == Double.class || targetType == double.class) {
                return StringUtils.isNotEmpty(strValue) ? Double.valueOf(strValue) : null;
            } else if (targetType == Boolean.class || targetType == boolean.class) {
                return Boolean.valueOf(strValue);
            }
        }
        
        // 数字之间的转换
        if (value instanceof Number) {
            Number numValue = (Number) value;
            if (targetType == Integer.class || targetType == int.class) {
                return numValue.intValue();
            } else if (targetType == Long.class || targetType == long.class) {
                return numValue.longValue();
            } else if (targetType == Double.class || targetType == double.class) {
                return numValue.doubleValue();
            }
        }
        
        return value;
    }

    /**
     * 读取xml
     *
     * @param deployId
     * @return
     */
    @Override
    public AjaxResult readXml(String deployId) throws IOException {
        ProcessDefinition definition = repositoryService.createProcessDefinitionQuery().deploymentId(deployId).singleResult();
        InputStream inputStream = repositoryService.getResourceAsStream(definition.getDeploymentId(), definition.getResourceName());
        String result = IOUtils.toString(inputStream, StandardCharsets.UTF_8.name());
        return AjaxResult.success("", result);
    }

    /**
     * 读取xml
     *
     * @param deployId
     * @return
     */
    @Override
    public InputStream readImage(String deployId) {
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().deploymentId(deployId).singleResult();
        //获得图片流
        DefaultProcessDiagramGenerator diagramGenerator = new DefaultProcessDiagramGenerator();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinition.getId());
        //输出为图片
        return diagramGenerator.generateDiagram(
                bpmnModel,
                "png",
                Collections.emptyList(),
                Collections.emptyList(),
                "宋体",
                "宋体",
                "宋体",
                null,
                1.0,
                false);

    }

    /**
     * 根据流程定义ID启动流程实例
     *
     * @param procDefId 流程模板ID
     * @param variables 流程变量
     * @return
     */
    @Override
    public AjaxResult startProcessInstanceById(String procDefId, Map<String, Object> variables) {
        try {
            ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(procDefId)
                    .latestVersion().singleResult();
            if (Objects.nonNull(processDefinition) && processDefinition.isSuspended()) {
                return AjaxResult.error("流程已被挂起,请先激活流程");
            }
            // 设置流程发起人Id到流程中
            SysUser sysUser = SecurityUtils.getLoginUser().getUser();
            identityService.setAuthenticatedUserId(sysUser.getUserId().toString());
            variables.put(ProcessConstants.PROCESS_INITIATOR, sysUser.getUserId());

            // 启动流程实例，不自动跳过发起人节点
            ProcessInstance processInstance = runtimeService.startProcessInstanceById(procDefId, variables);

            // 查询流程启动后的第一个任务
            List<Task> taskList = taskService.createTaskQuery()
                    .processInstanceId(processInstance.getProcessInstanceId())
                    .active()
                    .list();

            if (variables.containsKey("deployId")) {
                //业务表单
                variables.put("taskId",taskList.get(0).getId());
                // 查询form
                SysForm sysForm = sysDeployFormService.selectSysDeployFormByDeployId((String) variables.get("deployId"));
                String formSubmit = sysForm.getFormSubmit();
                
                // 处理formSubmit调用
                if (StringUtils.isNotEmpty(formSubmit)) {
                    try {
                        executeFormSubmit(formSubmit, variables);
                        log.info("业务表单提交成功: {}", formSubmit);
                    } catch (Exception e) {
                        log.error("业务表单提交失败: {}", formSubmit, e);
                        return AjaxResult.error("业务表单提交失败: " + e.getMessage());
                    }
                }
            }

            // 只添加流程启动的注释，不自动完成第一个任务
            // 这样流程会正常从开始节点开始，而不是跳过第一个节点
            log.info("流程实例启动成功，流程实例ID: {}, 发起人: {}", processInstance.getProcessInstanceId(), sysUser.getNickName());
            
            return AjaxResult.success("流程启动成功");
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("流程启动错误");
        }
    }


    /**
     * 激活或挂起流程定义
     *
     * @param state    状态
     * @param deployId 流程部署ID
     */
    @Override
    public void updateState(Integer state, String deployId) {
        ProcessDefinition procDef = repositoryService.createProcessDefinitionQuery().deploymentId(deployId).singleResult();
        // 激活
        if (state == 1) {
            repositoryService.activateProcessDefinitionById(procDef.getId(), true, null);
        }
        // 挂起
        if (state == 2) {
            repositoryService.suspendProcessDefinitionById(procDef.getId(), true, null);
        }
    }


    /**
     * 删除流程定义
     *
     * @param deployId 流程部署ID act_ge_bytearray 表中 deployment_id值
     */
    @Override
    public void delete(String deployId) {
        // true 允许级联删除 ,不设置会导致数据库外键关联异常
        repositoryService.deleteDeployment(deployId, true);
    }

    /**
     * 获取用户有权限发起的流程定义列表
     *
     * @param name     流程名称
     * @param pageNum  当前页码
     * @param pageSize 每页条数
     * @param userId   用户ID
     * @return 流程定义分页列表数据
     */
    @Override
    public Page<FlowProcDefDto> listWithPermission(String name, Integer pageNum, Integer pageSize, Long userId) {
        // 先获取所有流程定义
        Page<FlowProcDefDto> allDefinitions = list(name, pageNum, pageSize);
        
        // 过滤有权限的流程定义
        List<FlowProcDefDto> filteredList = new ArrayList<>();
        for (FlowProcDefDto definition : allDefinitions.getRecords()) {
            // 检查用户是否有权限发起该流程
            boolean canStart = flowInitiatorConfigService.checkUserCanStartProcess(definition.getId(), userId);
            if (canStart) {
                filteredList.add(definition);
            }
        }
        
        Page<FlowProcDefDto> result = new Page<>();
        result.setRecords(filteredList);
        result.setTotal(filteredList.size());
        result.setCurrent(pageNum);
        result.setSize(pageSize);
        
        return result;
    }

}
