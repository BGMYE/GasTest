<template>
  <div class="app-container">
    <el-card class="box-card">
      <template #header>
        <div class="clearfix">
          <span class="el-icon-document">已发任务</span>
          <el-button style="float: right;" type="danger" @click="goBack">关闭</el-button>
        </div>
      </template>

      <el-tabs tab-position="top" v-model="activeName" @tab-click="handleClick">
        <!--表单信息-->
        <el-tab-pane label="表单信息" name="1">
          <!-- 流程表单展示 -->
          <el-col :span="16" :offset="4" v-if="!isBusinessForm">
            <v-form-render ref="vFormRef" />
          </el-col>
          <!-- 业务表单展示 -->
          <div v-if="isBusinessForm" style="width: 100%; height: 600px;">
            <iframe 
              ref="businessFormIframe"
              :src="businessFormUrl" 
              style="width: 100%; height: 100%; border: none;"
            ></iframe>
          </div>
        </el-tab-pane>
        <!--流程流转记录-->
        <el-tab-pane label="流转记录" name="2">
          <FlowRecord 
            :proc-ins-id="taskForm.procInsId" 
            :deploy-id="taskForm.deployId"
          />
        </el-tab-pane>
        <!--流程图-->
        <el-tab-pane label="流程图" name="3">
          <bpmn-viewer :flowData="flowData" :procInsId="taskForm.procInsId" />
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import { getProcessVariables, flowXmlAndNode } from "@/api/flowable/definition";
import BpmnViewer from '@/components/Process/viewer';
import FlowRecord from '@/components/FlowRecord';

export default {
  name: "Record",
  components: {
    BpmnViewer,
    FlowRecord
  },
  props: {},
  data() {
    return {
      // 模型xml数据
      flowData: {},
      activeName: '1',
      // 查询参数
      queryParams: {},
      // 遮罩层
      loading: true,
      // 是否为业务表单
      isBusinessForm: false,
      // 业务表单URL
      businessFormUrl: '',
      // 业务表单数据
      businessFormData: null,

      taskForm: {
        multiple: false,
        comment: "", // 意见内容
        procInsId: "", // 流程实例编号
        instanceId: "", // 流程实例编号
        deployId: "",  // 流程定义编号
        taskId: "",// 流程任务编号
        procDefId: "",  // 流程编号
      },
    };
  },
  created() {
    this.taskForm.deployId = this.$route.query && this.$route.query.deployId;
    this.taskForm.taskId = this.$route.query && this.$route.query.taskId;
    this.taskForm.procInsId = this.$route.query && this.$route.query.procInsId;
    // 流程任务重获取变量表单
    this.processVariables(this.taskForm.taskId,this.taskForm.deployId)

  },
  methods: {
    handleClick(tab, event) {
      if (tab.paneName === '3') {
        flowXmlAndNode({ procInsId: this.taskForm.procInsId, deployId: this.taskForm.deployId }).then(res => {
          this.flowData = res.data;
        })
      }
    },

    /** 获取流程变量内容 */
    processVariables(taskId,deployId) {
      if (taskId) {
        // 提交流程申请时填写的表单存入了流程变量中后续任务处理时需要展示
        getProcessVariables(taskId,deployId).then(res => {
          // 判断表单类型：如果包含formData字段则为业务表单，否则为流程表单
          if (res.data.form !== undefined) {
            // 业务表单处理
            this.isBusinessForm = true;

            // 从form.formRouter获取业务表单路由
            if (res.data.form && res.data.form.formRouter) {
              // 构建业务表单URL，添加只读模式参数
              const baseUrl = res.data.form.formRouter;
              const separator = baseUrl.includes('?') ? '&' : '?';
              this.businessFormUrl = `${baseUrl}${separator}readonly=true&taskId=${taskId}`;
            } else {
              this.$message.error('业务表单路由信息不完整');
            }
          } else {
            // 流程表单处理
            this.isBusinessForm = false;
            this.$nextTick(() => {
              // 回显表单
              if (res.data.formJson.formContent !== undefined) {
                this.$refs.vFormRef.setFormJson(res.data.formJson.formContent);
              }else{
                let formJson = res.data.formJson;
                //转成String
                formJson.formContent = JSON.stringify(res.data.formJson);
                this.$refs.vFormRef.setFormJson(formJson);
              }
              this.$nextTick(() => {
                // 加载表单填写的数据
                this.$refs.vFormRef.setFormData(res.data);
                this.$nextTick(() => {
                  // 表单禁用
                  this.$refs.vFormRef.disableForm();
                })
              })
            })
          }
        });
      }
    },
    /** 返回页面 */
    goBack() {
      // 关闭当前标签页并返回上个页面
      const obj = { path: "/task/process", query: { t: Date.now() } };
      this.$tab.closeOpenPage(obj);
    },
  }
};
</script>
<style lang="scss" scoped>
.test-form {
  margin: 15px auto;
  width: 800px;
  padding: 15px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}

.box-card {
  width: 100%;
  margin-bottom: 20px;
}

.el-tag+.el-tag {
  margin-left: 10px;
}

.my-label {
  background: #E1F3D8;
}
</style>
