<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="100px">
                  <el-form-item label="监察机构" prop="supervisionId">
                     <el-tree-select
                        v-model="queryParams.supervisionId"
                        :data="deptOptions"
                        :props="{ value: 'id', label: 'label', children: 'children' }"
                        value-key="id"
                        placeholder="请选择监察机构"
                        clearable
                        check-strictly
                     />
                  </el-form-item>
                  <el-form-item label="监检机构" prop="inspectionId">
                     <el-tree-select
                        v-model="queryParams.inspectionId"
                        :data="deptOptions"
                        :props="{ value: 'id', label: 'label', children: 'children' }"
                        value-key="id"
                        placeholder="请选择监检机构"
                        clearable
                        check-strictly
                     />
                  </el-form-item>
                  <el-form-item label="安装区域代码" prop="regionCode">
                    <el-input
                        v-model="queryParams.regionCode"
                        placeholder="请输入安装区域代码"
                        clearable
                        @keyup.enter="handleQuery"
                    />
                  </el-form-item>
                  <el-form-item label="安装区域名称" prop="regionName">
                    <el-input
                        v-model="queryParams.regionName"
                        placeholder="请输入安装区域名称"
                        clearable
                        @keyup.enter="handleQuery"
                    />
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
            v-hasPermi="['sxgpra:gasAreaManage:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="success"
            plain
            icon="Edit"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['sxgpra:gasAreaManage:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['sxgpra:gasAreaManage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['sxgpra:gasAreaManage:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gasAreaManageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
              <el-table-column label="监察机构" align="center" prop="supervisionDept.deptName" width="250">
              </el-table-column>
              <el-table-column label="监检机构" align="center" prop="inspectionDept.deptName" width="250"/>
              <el-table-column label="安装区域代码" align="center" prop="regionCode" width="250"/>
              <el-table-column label="安装区域名称" align="center" prop="regionName" width="250"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['sxgpra:gasAreaManage:edit']">修改</el-button>
          <el-button link type="primary" icon="Edit" @click="handleView(scope.row)" v-hasPermi="['sxgpra:gasAreaManage:edit']">详情</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['sxgpra:gasAreaManage:remove']">删除</el-button>
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
 
    <!-- 添加或修改监检区域分配对话框 -->
    <el-dialog :title="title" v-model="open" width="1000px" append-to-body>
      <el-form ref="gasAreaManageRef" :model="form" :rules="rules" label-width="80px">
        <el-row>
                            <el-col :span="24">
                          <el-form-item label="监察机构" prop="supervisionId">
                            <el-tree-select
                                v-model="form.supervisionId"
                                :data="deptOptions"
                                :props="{ value: 'id', label: 'label', children: 'children' }"
                                value-key="id"
                                placeholder="请选择监察机构"
                                check-strictly
                            />
                          </el-form-item>
                        </el-col>
                            <el-col :span="24">
                              <el-form-item label="监检机构" prop="inspectionId">
                                <el-tree-select
                                    v-model="form.inspectionId"
                                    :data="deptOptions"
                                    :props="{ value: 'id', label: 'label', children: 'children' }"
                                    value-key="id"
                                    placeholder="请选择监检机构"
                                    check-strictly
                                />
                              </el-form-item>
                            </el-col>
                            <el-col :span="24">
                          <el-form-item label="安装区域代码" prop="regionCode">
                            <el-input v-model="form.regionCode" placeholder="请输入安装区域代码" :readonly="ifView"/>
                          </el-form-item>
                        </el-col>
                            <el-col :span="24">
                          <el-form-item label="安装区域名称" prop="regionName">
                            <el-input v-model="form.regionName" placeholder="请输入安装区域名称" :readonly="ifView"/>
                          </el-form-item>
                        </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm" v-if="!ifView">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="GasAreaManage">
  import { listGasAreaManage, getGasAreaManage, delGasAreaManage, addGasAreaManage, updateGasAreaManage , deptTreeSelect} from "@/api/sxgpra/gasAreaManage";

  const { proxy } = getCurrentInstance();

  const gasAreaManageList = ref([]);
  const open = ref(false);
  const ifView = ref(false);
  const loading = ref(true);
  const showSearch = ref(true);
  const ids = ref([]);
  const single = ref(true);
  const multiple = ref(true);
  const total = ref(0);
  const title = ref("");
  const deptOptions = ref(undefined);

  const data = reactive({
    form: {},
    queryParams: {
      pageNum: 1,
      pageSize: 10,
                    supervisionId: null,
                    inspectionId: null,
                    regionCode: null,
                    regionName: null,
    },
    rules: {
    }
  });

  const { queryParams, form, rules } = toRefs(data);

  /** 查询监检区域分配列表 */
  function getList() {
    loading.value = true;
    listGasAreaManage(queryParams.value).then(response => {
            gasAreaManageList.value = response.rows;
      total.value = response.total;
      loading.value = false;
    });
  }

  // 取消按钮
  function cancel() {
    open.value = false;
    ifView.value = false;
    reset();
  }

  // 表单重置
  function reset() {
    form.value = {
                    areaManageId: null,
                    supervisionId: null,
                    inspectionId: null,
                    regionCode: null,
                    regionName: null,
                    createBy: null,
                    createTime: null,
                    updateBy: null,
                    updateTime: null
    };
    ifView.value = false;
    proxy.resetForm("gasAreaManageRef");
  }

  /** 查询部门下拉树结构 */
function getDeptTree() {
  deptTreeSelect().then(response => {
    deptOptions.value = response.data;
  });
};

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
    ids.value = selection.map(item => item.areaManageId);
    single.value = selection.length != 1;
    multiple.value = !selection.length;
  }

  /** 新增按钮操作 */
  function handleAdd() {
    reset();
    open.value = true;
    title.value = "添加监检区域分配";
  }

  /** 修改按钮操作 */
  function handleUpdate(row) {
    reset();
    const _areaManageId = row.areaManageId || ids.value
    getGasAreaManage(_areaManageId).then(response => {
      form.value = response.data;
      open.value = true;
      title.value = "修改监检区域分配";
    });
  }

  /** 查看详情按钮操作 */
  function handleView(row) {
    reset();
    const _areaManageId = row.areaManageId || ids.value
    getGasAreaManage(_areaManageId).then(response => {
      form.value = response.data;
      open.value = true;
      ifView.value = true;
      title.value = "修改监检区域分配";
    });
  }



  /** 提交按钮 */
  function submitForm() {
    proxy.$refs["gasAreaManageRef"].validate(valid => {
      if (valid) {
        if (form.value.areaManageId != null) {
          updateGasAreaManage(form.value).then(response => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          });
        } else {
          addGasAreaManage(form.value).then(response => {
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
    const _areaManageIds = row.areaManageId || ids.value;
    proxy.$modal.confirm('是否确认删除监检区域分配编号为"' + _areaManageIds + '"的数据项？').then(function() {
      return delGasAreaManage(_areaManageIds);
    }).then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    }).catch(() => {});
  }

  /** 导出按钮操作 */
  function handleExport() {
    proxy.download('sxgpra/gasAreaManage/export', {
      ...queryParams.value
    }, `gasAreaManage_${new Date().getTime()}.xlsx`)
  }
  getDeptTree();
  getList();
</script>
