<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="名称" prop="applicantName">
        <el-input
          v-model="queryParams.applicantName"
          placeholder="请输入名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="请假类型" prop="leaveType">
        <el-select v-model="queryParams.leaveType" placeholder="请选择请假类型" clearable>
          <el-option
            v-for="dict in sys_process_category"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['system:qingjia:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:qingjia:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:qingjia:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['system:qingjia:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="qingjiaList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="" align="center" prop="id" />
      <el-table-column label="流程id" align="center" prop="taskId" />
      <el-table-column label="名称" align="center" prop="applicantName" />
      <el-table-column label="请假类型" align="center" prop="leaveType">
        <template #default="scope">
          <dict-tag :options="sys_process_category" :value="scope.row.leaveType"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="220">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}  {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建人" align="center" prop="createBy" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:qingjia:edit']">修改</el-button>
          <el-button link type="primary" icon="Edit" @click="handleView(scope.row)" v-hasPermi="['system:qingjia:edit']">详情</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['system:qingjia:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改qingjia对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="qingjiaRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="名称" prop="applicantName">
          <el-input v-model="form.applicantName" placeholder="请输入名称" :readonly="!ifUpdate"/>
        </el-form-item>
        <el-form-item label="请假类型" prop="leaveType">
          <el-select v-model="form.leaveType" placeholder="请选择请假类型" :disabled="!ifUpdate">
            <el-option
              v-for="dict in sys_process_category"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm" v-if="ifUpdate">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Qingjia">
import { listQingjia, getQingjia, delQingjia, addQingjia, updateQingjia } from "@/api/system/qingjia";

const { proxy } = getCurrentInstance();
const { sys_process_category } = proxy.useDict('sys_process_category');

const qingjiaList = ref([]);
const open = ref(false);
const ifUpdate = ref(true);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    applicantName: null,
    leaveType: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询qingjia列表 */
function getList() {
  loading.value = true;
  listQingjia(queryParams.value).then(response => {
    qingjiaList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  ifUpdate.value = true;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    taskId: null,
    applicantName: null,
    leaveType: null,
    createTime: null,
    createBy: null
  };
  proxy.resetForm("qingjiaRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加qingjia";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getQingjia(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改qingjia";
  });
}

/** 查看详情按钮操作 */
function handleView(row) {
  reset();
  const _id = row.id || ids.value
  getQingjia(_id).then(response => {
    form.value = response.data;
    open.value = true;
    ifUpdate.value = false;
    title.value = "修改qingjia";
  });
}



/** 提交按钮 */
function submitForm() {
  proxy.$refs["qingjiaRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateQingjia(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addQingjia(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除qingjia编号为"' + _ids + '"的数据项？').then(function() {
    return delQingjia(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('system/qingjia/export', {
    ...queryParams.value
  }, `qingjia_${new Date().getTime()}.xlsx`)
}

getList();
</script>
