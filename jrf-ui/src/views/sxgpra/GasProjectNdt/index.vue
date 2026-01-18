<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="项目检测单位ID" prop="projectNdtId">
        <el-input
          v-model="queryParams.projectNdtId"
          placeholder="请输入项目检测单位ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目ID" prop="projectId">
        <el-input
          v-model="queryParams.projectId"
          placeholder="请输入项目ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="机构ID" prop="deptId">
        <el-input
          v-model="queryParams.deptId"
          placeholder="请输入机构ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检测单位项目分责人" prop="ndtChargerId">
        <el-input
          v-model="queryParams.ndtChargerId"
          placeholder="请输入检测单位项目分责人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检测单位项目资料员" prop="ndtDocumenterId">
        <el-input
          v-model="queryParams.ndtDocumenterId"
          placeholder="请输入检测单位项目资料员"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-input
          v-model="queryParams.status"
          placeholder="请输入状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="检测资质证书编号" prop="testCertNo">
        <el-input
          v-model="queryParams.testCertNo"
          placeholder="请输入检测资质证书编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['sxgpra:GasProjectNdt:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['sxgpra:GasProjectNdt:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['sxgpra:GasProjectNdt:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['sxgpra:GasProjectNdt:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="GasProjectNdtList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="项目检测单位ID" align="center" prop="projectNdtId" />
      <el-table-column label="项目ID" align="center" prop="projectId" />
      <el-table-column label="机构ID" align="center" prop="deptId" />
      <el-table-column label="检测单位项目分责人" align="center" prop="ndtChargerId" />
      <el-table-column label="检测单位项目资料员" align="center" prop="ndtDocumenterId" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="检测资质证书编号" align="center" prop="testCertNo" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['sxgpra:GasProjectNdt:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['sxgpra:GasProjectNdt:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改项目检测单位对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目检测单位ID" prop="projectNdtId">
          <el-input v-model="form.projectNdtId" placeholder="请输入项目检测单位ID" />
        </el-form-item>
        <el-form-item label="项目ID" prop="projectId">
          <el-input v-model="form.projectId" placeholder="请输入项目ID" />
        </el-form-item>
        <el-form-item label="机构ID" prop="deptId">
          <el-input v-model="form.deptId" placeholder="请输入机构ID" />
        </el-form-item>
        <el-form-item label="检测单位项目分责人" prop="ndtChargerId">
          <el-input v-model="form.ndtChargerId" placeholder="请输入检测单位项目分责人" />
        </el-form-item>
        <el-form-item label="检测单位项目资料员" prop="ndtDocumenterId">
          <el-input v-model="form.ndtDocumenterId" placeholder="请输入检测单位项目资料员" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-input v-model="form.status" placeholder="请输入状态" />
        </el-form-item>
        <el-form-item label="删除标志" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入删除标志" />
        </el-form-item>
        <el-form-item label="检测资质证书编号" prop="testCertNo">
          <el-input v-model="form.testCertNo" placeholder="请输入检测资质证书编号" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listGasProjectNdt, getGasProjectNdt, delGasProjectNdt, addGasProjectNdt, updateGasProjectNdt } from "@/api/sxgpra/GasProjectNdt";

export default {
  name: "GasProjectNdt",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 项目检测单位表格数据
      GasProjectNdtList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        projectNdtId: null,
        projectId: null,
        deptId: null,
        ndtChargerId: null,
        ndtDocumenterId: null,
        status: null,
        testCertNo: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询项目检测单位列表 */
    getList() {
      this.loading = true;
      listGasProjectNdt(this.queryParams).then(response => {
        this.GasProjectNdtList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        projectNdtId: null,
        projectId: null,
        deptId: null,
        ndtChargerId: null,
        ndtDocumenterId: null,
        status: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        testCertNo: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.projectNdtId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加项目检测单位";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const projectNdtId = row.projectNdtId || this.ids
      getGasProjectNdt(projectNdtId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改项目检测单位";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.projectNdtId != null) {
            updateGasProjectNdt(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGasProjectNdt(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const projectNdtIds = row.projectNdtId || this.ids;
      this.$modal.confirm('是否确认删除项目检测单位编号为"' + projectNdtIds + '"的数据项？').then(function() {
        return delGasProjectNdt(projectNdtIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('sxgpra/GasProjectNdt/export', {
        ...this.queryParams
      }, `GasProjectNdt_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
