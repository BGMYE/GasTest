<template>
    <div class="app-container">
        <el-form :model="queryParams" class="queryFormClass" ref="queryFormRef" size="small" :inline="true"
            v-show="showSearch" label-width="68px">
            <el-form-item label="商品名称" prop="goodsName">
                <el-input v-model="queryParams.goodsName" placeholder="请输入商品名称" clearable @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item label="商品分类" prop="goodsType">
                <el-select v-model="queryParams.goodsType" placeholder="请选择商品分类" clearable>
                    <el-option v-for="dict in f_goods_type" :key="dict.value" :label="dict.label" :value="dict.value" />
                </el-select>
            </el-form-item>
            <el-form-item label="商品价格" prop="goodsPrice">
                <el-input v-model="queryParams.goodsPrice" placeholder="请输入商品价格" clearable @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item label="商品库存" prop="goodsInventory">
                <el-input v-model="queryParams.goodsInventory" placeholder="请输入商品库存" clearable
                    @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item label="创建人" prop="createName">
                <el-input v-model="queryParams.createName" placeholder="请输入创建人名称" clearable
                    @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item label="更新人" prop="updateName">
                <el-input v-model="queryParams.updateName" placeholder="请输入更新人名称" clearable
                    @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item>
                <el-button type="primary" icon="Search" size="mini" @click="handleQuery">搜索</el-button>
                <el-button icon="Refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
        </el-form>

        <el-divider></el-divider>

        <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
                <el-button type="primary" icon="Plus" size="mini" @click="handleAdd"
                    v-hasPermi="['logic:goods:add']">新增</el-button>
            </el-col>
            <el-col :span="1.5">
                <el-button type="success" icon="Edit" size="mini" :disabled="single" @click="handleUpdate"
                    v-hasPermi="['logic:goods:edit']">修改</el-button>
            </el-col>
            <el-col :span="1.5">
                <el-button type="danger" icon="Delete" size="mini" :disabled="multiple" @click="handleDelete"
                    v-hasPermi="['logic:goods:remove']">删除</el-button>
            </el-col>
            <el-col :span="1.5">
                <el-button type="warning" icon="Download" size="mini" @click="handleExport"
                    v-hasPermi="['logic:goods:export']">导出</el-button>
            </el-col>
            <right-toolbar :showSearch="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-divider></el-divider>

        <el-table stripe border v-loading="loading" class="tableClass" :data="goodsList"
            @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column label="id" align="center" prop="id" />
            <el-table-column label="商品图片" align="center" prop="imgUrl" width="100" fixed="left">
                <template #default="scope">
                    <image-preview :src="scope.row.imgUrl" :width="50" :height="50" />
                </template>
            </el-table-column>
            <el-table-column label="商品名称" align="center" prop="goodsName" />
            <el-table-column label="商品分类" align="center" prop="goodsType">
                <template #default="scope">
                    <dict-tag :options="f_goods_type" :value="scope.row.goodsType" />
                </template>
            </el-table-column>
            <el-table-column label="商品价格" align="center" prop="goodsPrice" />
            <el-table-column label="商品库存" align="center" prop="goodsInventory" />
            <el-table-column label="创建时间" align="center" prop="createTime" width="180">
                <template #default="scope">
                    <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
                </template>
            </el-table-column>
            <el-table-column label="创建人名称" align="center" prop="createName" />
            <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
                <template #default="scope">
                    <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
                </template>
            </el-table-column>
            <el-table-column label="更新人名称" align="center" prop="updateName" />
            <el-table-column label="操作" fixed="right" align="center" class-name="small-padding fixed-width">
                <template #default="scope">
                    <el-button size="mini" type="text" icon="Edit" @click="handleUpdate(scope.row)"
                        v-hasPermi="['logic:goods:edit']">修改</el-button>
                    <el-button size="mini" type="text" icon="Delete" @click="handleDelete(scope.row)"
                        v-hasPermi="['logic:goods:remove']">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
            v-model:limit="queryParams.pageSize" @pagination="getList" />

        <!-- 添加或修改商品信息对话框 -->
        <el-dialog v-drag-dialog="true" :title="title" v-model="open" width="500px" append-to-body>
            <el-form ref="formRef" :model="form" :rules="rules" label-width="80px">
                <el-form-item label="商品名称" prop="goodsName">
                    <el-input v-model="form.goodsName" placeholder="请输入商品名称" />
                </el-form-item>
                <el-form-item label="商品分类" prop="goodsType">
                    <el-select v-model="form.goodsType" placeholder="请选择商品分类">
                        <el-option v-for="dict in f_goods_type" :key="dict.value" :label="dict.label"
                            :value="dict.value"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="商品价格" prop="goodsPrice">
                    <el-input v-model="form.goodsPrice" placeholder="请输入商品价格" />
                </el-form-item>
                <el-form-item label="商品库存" prop="goodsInventory">
                    <el-input v-model="form.goodsInventory" placeholder="请输入商品库存" />
                </el-form-item>
                <el-form-item label="商品图片" prop="imgUrl">
                    <image-upload v-model="form.imgUrl" />
                </el-form-item>
            </el-form>
            <template #footer>
                <div class="dialog-footer">
                    <el-button type="primary" @click="submitForm">确 定</el-button>
                    <el-button @click="cancel">取 消</el-button>
                </div>
            </template>
        </el-dialog>
    </div>
</template>

<script setup name="sxgpraGoods">
import { ref, reactive, onMounted, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { listGoods, getGoods, delGoods, addGoods, updateGoods } from "@/api/sxgpra/goods"

const { proxy } = getCurrentInstance();

// 组件引用
const queryFormRef = ref()
const formRef = ref()

// 响应式数据
const loading = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const showSearch = ref(true)
const total = ref(0)
const goodsList = ref([])
const title = ref("")
const open = ref(false)

// 查询参数
const queryParams = reactive({
    pageNum: 1,
    pageSize: 10,
    goodsName: null,
    goodsType: null,
    goodsPrice: null,
    goodsInventory: null,
    createName: null,
    updateName: null,
    imgUrl: null
})

// 表单参数
const form = reactive({
    id: null,
    goodsName: null,
    goodsType: null,
    goodsPrice: null,
    goodsInventory: null,
    createTime: null,
    createBy: null,
    createName: null,
    updateTime: null,
    updateBy: null,
    updateName: null,
    delFlag: null,
    imgUrl: null
})

// 表单校验规则
const rules = reactive({
    goodsName: [
        { required: true, message: "商品名称不能为空", trigger: "blur" }
    ],
    goodsType: [
        { required: true, message: "商品分类不能为空", trigger: "change" }
    ],
    goodsPrice: [
        { required: true, message: "商品价格不能为空", trigger: "blur" }
    ],
    goodsInventory: [
        { required: true, message: "商品库存不能为空", trigger: "blur" }
    ],
    createTime: [
        { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
    createBy: [
        { required: true, message: "创建人id不能为空", trigger: "blur" }
    ],
    createName: [
        { required: true, message: "创建人名称不能为空", trigger: "blur" }
    ],
    updateTime: [
        { required: true, message: "更新时间不能为空", trigger: "blur" }
    ],
    updateBy: [
        { required: true, message: "更新人id不能为空", trigger: "blur" }
    ],
    updateName: [
        { required: true, message: "更新人名称不能为空", trigger: "blur" }
    ],
    delFlag: [
        { required: true, message: "删除标识不能为空", trigger: "blur" }
    ]
})

// 字典数据
const { f_goods_type } = proxy.useDict("f_goods_type");

// 生命周期
onMounted(() => {
    getList()
})

// 方法定义
/** 查询商品信息列表 */
const getList = () => {
    loading.value = true
    listGoods(queryParams).then(response => {
        goodsList.value = response.rows
        total.value = response.total
        loading.value = false
    })
}

/** 搜索按钮操作 */
const handleQuery = () => {
    queryParams.pageNum = 1
    getList()
}

/** 重置按钮操作 */
const resetQuery = () => {
    queryFormRef.value.resetFields()
    handleQuery()
}

/** 取消按钮 */
const cancel = () => {
    open.value = false
    reset()
}

/** 表单重置 */
const reset = () => {
    Object.assign(form, {
        id: null,
        goodsName: null,
        goodsType: null,
        goodsPrice: null,
        goodsInventory: null,
        createTime: null,
        createBy: null,
        createName: null,
        updateTime: null,
        updateBy: null,
        updateName: null,
        delFlag: null,
        imgUrl: null
    })
    if (formRef.value) {
        formRef.value.resetFields()
    }
}

/** 多选框选中数据 */
const handleSelectionChange = (selection) => {
    ids.value = selection.map(item => item.id)
    single.value = selection.length !== 1
    multiple.value = !selection.length
}

/** 新增按钮操作 */
const handleAdd = () => {
    reset()
    open.value = true
    title.value = "添加商品信息"
}

/** 修改按钮操作 */
const handleUpdate = (row) => {
    reset()
    const id = row.id || ids.value
    getGoods(id).then(response => {
        Object.assign(form, response.data)
        open.value = true
        title.value = "修改商品信息"
    })
}

/** 提交按钮 */
const submitForm = () => {
    formRef.value.validate(valid => {
        if (valid) {
            if (form.id != null) {
                updateGoods(form).then(response => {
                    ElMessage.success("修改成功")
                    open.value = false
                    getList()
                })
            } else {
                addGoods(form).then(response => {
                    ElMessage.success("新增成功")
                    open.value = false
                    getList()
                })
            }
        }
    })
}

/** 删除按钮操作 */
const handleDelete = (row) => {
    const idsToDelete = row.id || ids.value
    ElMessageBox.confirm('是否确认删除商品信息编号为"' + idsToDelete + '"的数据项？', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
    }).then(() => {
        return delGoods(idsToDelete)
    }).then(() => {
        getList()
        ElMessage.success("删除成功")
    }).catch(() => { })
}

/** 导出按钮操作 */
const handleExport = () => {
    // 这里需要根据实际情况实现导出功能
    // download('logic/goods/export', {
    //   ...queryParams
    // }, `goods_${new Date().getTime()}.xlsx`)
}
</script>