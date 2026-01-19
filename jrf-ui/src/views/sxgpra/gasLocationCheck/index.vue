<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="项目ID" prop="projectId">
        <el-input
          v-model="queryParams.projectId"
          placeholder="请输入项目ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="焊工ID" prop="welderId">
        <el-input
          v-model="queryParams.welderId"
          placeholder="请输入焊工ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="焊口编号" prop="manycode">
        <el-input
          v-model="queryParams.manycode"
          placeholder="请输入焊口编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="焊口精确定位方式" prop="locationtype">
        <el-select v-model="queryParams.locationtype" placeholder="请选择焊口精确定位方式" clearable>
          <el-option
            v-for="dict in dict.type.${dictType}"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="埋深图片信息" prop="photo">
        <el-input
          v-model="queryParams.photo"
          placeholder="请输入埋深图片信息"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="位置" prop="location">
        <el-input
          v-model="queryParams.location"
          placeholder="请输入位置"
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
          v-hasPermi="['sxgpra:gasLocationCheck:add']"
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
          v-hasPermi="['sxgpra:gasLocationCheck:edit']"
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
          v-hasPermi="['sxgpra:gasLocationCheck:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['sxgpra:gasLocationCheck:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="gasLocationCheckList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="locationCheckId" />
      <el-table-column label="项目ID" align="center" prop="projectId" />
      <el-table-column label="焊工ID" align="center" prop="welderId" />
      <el-table-column label="焊口编号" align="center" prop="manycode" />
      <el-table-column label="焊口精确定位方式" align="center" prop="locationtype" />
      <el-table-column label="埋深图片信息" align="center" prop="photo" />
      <el-table-column label="位置" align="center" prop="location" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['sxgpra:gasLocationCheck:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['sxgpra:gasLocationCheck:remove']"
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

    <!-- 添加或修改定位校验对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="项目ID" prop="projectId">
          <el-input v-model="form.projectId" placeholder="请输入项目ID" />
        </el-form-item>
        <el-form-item label="焊工ID" prop="welderId">
          <el-input v-model="form.welderId" placeholder="请输入焊工ID" />
        </el-form-item>
        <el-form-item label="焊口编号" prop="manycode">
          <el-input v-model="form.manycode" placeholder="请输入焊口编号" />
        </el-form-item>
        <el-form-item label="焊口精确定位方式" prop="locationtype">
          <el-select v-model="form.locationtype" placeholder="请选择焊口精确定位方式">
            <el-option
              v-for="dict in dict.type.${dictType}"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="埋深图片信息" prop="photo">
          <el-input v-model="form.photo" placeholder="请输入埋深图片信息" />
        </el-form-item>
        <el-form-item label="位置" prop="location">
          <el-input v-model="form.location" placeholder="请输入位置" />
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
import { listGasLocationCheck, getGasLocationCheck, delGasLocationCheck, addGasLocationCheck, updateGasLocationCheck } from "@/api/sxgpra/gasLocationCheck";

export default {
  name: "GasLocationCheck",
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
      // 定位校验表格数据
      gasLocationCheckList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        projectId: null,
        welderId: null,
        manycode: null,
        locationtype: null,
        photo: null,
        location: null,
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
    /** 查询定位校验列表 */
    getList() {
      this.loading = true;
      listGasLocationCheck(this.queryParams).then(response => {
        this.gasLocationCheckList = response.rows;
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
        locationCheckId: null,
        projectId: null,
        welderId: null,
        manycode: null,
        locationtype: null,
        photo: null,
        location: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.ids = selection.map(item => item.locationCheckId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加定位校验";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const locationCheckId = row.locationCheckId || this.ids
      getGasLocationCheck(locationCheckId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改定位校验";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.locationCheckId != null) {
            updateGasLocationCheck(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGasLocationCheck(this.form).then(response => {
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
      const locationCheckIds = row.locationCheckId || this.ids;
      this.$modal.confirm('是否确认删除定位校验编号为"' + locationCheckIds + '"的数据项？').then(function() {
        return delGasLocationCheck(locationCheckIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('sxgpra/gasLocationCheck/export', {
        ...this.queryParams
      }, `gasLocationCheck_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
