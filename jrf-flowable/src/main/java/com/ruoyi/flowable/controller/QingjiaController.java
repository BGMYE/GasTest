package com.ruoyi.flowable.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.flowable.service.QingjiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ：byH
 * @date ：Created 2025/8/18 16:53
 * @description：
 */
@RestController
@RequestMapping("/flowable/qingjia")
public class QingjiaController {

    @Autowired
    private QingjiaService qingjiaService;

    @GetMapping("/selectByTaskId")
    public AjaxResult selectByTaskId(String taskId) {
        return AjaxResult.success(qingjiaService.selectByTaskId(taskId));
    }
}
