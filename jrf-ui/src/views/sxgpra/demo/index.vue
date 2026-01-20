<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="示例代码" prop="demoCode">
        <el-input
          v-model="queryParams.demoCode"
          placeholder="请输入示例代码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="示例名称" prop="demoName">
        <el-input
          v-model="queryParams.demoName"
          placeholder="请输入示例名称"
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
          v-hasPermi="['sxgpra:demo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="demoList"
      row-key="demoId"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="示例代码" align="center" prop="demoCode">
      </el-table-column>
      <el-table-column label="示例名称" align="center" prop="demoName">
      </el-table-column>
      <el-table-column label="父节点ID" align="center" prop="parentId">
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">

        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改示例树对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="示例代码" prop="demoCode">
          <el-input v-model="form.demoCode" placeholder="请输入示例代码" />
        </el-form-item>
        <el-form-item label="示例名称" prop="demoName">
          <el-input v-model="form.demoName" placeholder="请输入示例名称" />
        </el-form-item>
        <el-form-item label="父节点ID" prop="parentId">
          <el-tree-select
            v-model="form.parentId"
            :data="deptOptions"
            :props="{ value: 'demoId', label: 'demoName', children: 'children' }"
            value-key="demoId"
            placeholder="请选择父节点ID"
            check-strictly
          />
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
import { listDemo, getDemo, delDemo, addDemo, updateDemo } from "@/api/sxgpra/demo";


export default {
  name: "Demo",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 示例树表格数据
      demoList: [],
      // 示例树树选项
      demoOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部展开
      isExpandAll: true,
      // 重新渲染表格状态
      refreshTable: true,
      // 查询参数
      queryParams: {
        demoCode: null,
        demoName: null,
        parentId: null
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
    /** 查询示例树列表 */
    getList() {
      this.loading = true;
      listDemo(this.queryParams).then(response => {
        this.demoList = this.handleTree(response.data, "demoId", "parentId");
        this.loading = false;
      });
    },
    /** 转换示例树数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.demoId,
        label: node.demoName,
        children: node.children
      };
    },
	/** 查询示例树下拉树结构 */
    getTreeselect() {
      listDemo().then(response => {
        this.demoOptions = [];
        const data = { demoId: 0, demoName: '顶级节点', children: [] };
        data.children = this.handleTree(response.data, "demoId", "parentId");
        this.demoOptions.push(data);
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
        demoId: null,
        demoCode: null,
        demoName: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        parentId: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row != null && row.demoId) {
        this.form.parentId = row.demoId;
      } else {
        this.form.parentId = 0;
      }
      this.open = true;
      this.title = "添加示例树";
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      if (row != null) {
        this.form.parentId = row.parentId;
      }
      getDemo(row.demoId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改示例树";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.demoId != null) {
            updateDemo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDemo(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除示例树编号为"' + row.demoId + '"的数据项？').then(function() {
        return delDemo(row.demoId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
