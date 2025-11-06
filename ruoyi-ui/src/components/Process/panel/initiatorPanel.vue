<template>
  <div class="panel-tab__content">
    <div class="element-drawer__button" style="margin-bottom: 16px;">
      <el-button type="primary" icon="plus" @click="openInitiatorForm(null, -1)">添加发起人</el-button>
    </div>

    <el-table :data="initiatorList" max-height="300" border fit>
      <el-table-column label="序号" width="50px" type="index" />
      <el-table-column label="类型" prop="typeName" min-width="80px" />
      <el-table-column label="名称" prop="name" min-width="120px" show-overflow-tooltip />
      <el-table-column label="操作" width="120px">
        <template #="{ row, $index }">
          <el-button type="primary" size="small" link @click="openInitiatorForm(row, $index)">编辑</el-button>
          <el-divider direction="vertical" />
          <el-button type="primary" size="small" link style="color: #ff4d4f"
            @click="removeInitiator(row, $index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 发起人配置弹窗 -->
    <el-dialog v-model="initiatorFormVisible" title="发起人配置" width="600px" append-to-body destroy-on-close>
      <el-form :model="initiatorForm" label-width="130px" ref="initiatorFormRef" :rules="rules">
        <el-form-item label="发起人类型：" prop="type">
          <el-select v-model="initiatorForm.type" placeholder="请选择发起人类型" @change="handleTypeChange">
            <el-option label="指定用户" :value="1" />
            <el-option label="指定部门" :value="2" />
            <el-option label="指定角色" :value="3" />
          </el-select>
        </el-form-item>
        <el-form-item label="选择发起人：" prop="selectedItems" v-if="initiatorForm.type">
          <!-- 用户选择 -->
          <div v-if="initiatorForm.type === 1">
            <el-button type="primary" @click="openUserSelect">选择用户</el-button>
            <div v-if="selectedUsers.length > 0" style="margin-top: 8px;">
              <el-tag
                v-for="user in selectedUsers"
                :key="user.userId"
                closable
                @close="removeSelectedUser(user)"
                style="margin-right: 8px; margin-bottom: 4px;"
              >
                {{ user.nickName }}
              </el-tag>
            </div>
          </div>
          <!-- 部门选择 -->
          <div v-if="initiatorForm.type === 2">
            <el-button type="primary" @click="openDeptSelect">选择部门</el-button>
            <div v-if="selectedDepts.length > 0" style="margin-top: 8px;">
              <el-tag
                v-for="dept in selectedDepts"
                :key="dept.deptId"
                closable
                @close="removeSelectedDept(dept)"
                style="margin-right: 8px; margin-bottom: 4px;"
              >
                {{ dept.deptName }}
              </el-tag>
            </div>
          </div>
          <!-- 角色选择 -->
          <div v-if="initiatorForm.type === 3">
            <el-button type="primary" @click="openRoleSelect">选择角色</el-button>
            <div v-if="selectedRoles.length > 0" style="margin-top: 8px;">
              <el-tag
                v-for="role in selectedRoles"
                :key="role.roleId"
                closable
                @close="removeSelectedRole(role)"
                style="margin-right: 8px; margin-bottom: 4px;"
              >
                {{ role.roleName }}
              </el-tag>
            </div>
          </div>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="initiatorFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveInitiator">确 定</el-button>
      </template>
    </el-dialog>

    <!-- 用户选择弹窗 -->
    <el-dialog v-model="userSelectVisible" title="选择用户" width="800px" append-to-body>
      <el-form :model="userQueryParams" :inline="true">
        <el-form-item label="用户名称">
          <el-input v-model="userQueryParams.nickName" placeholder="请输入用户名称" clearable />
        </el-form-item>
        <el-form-item label="手机号码">
          <el-input v-model="userQueryParams.phonenumber" placeholder="请输入手机号码" clearable />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="getUserList">搜索</el-button>
          <el-button icon="Refresh" @click="resetUserQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-table
        ref="userTableRef"
        :data="userList"
        @selection-change="handleUserSelectionChange"
        max-height="400"
      >
        <el-table-column type="selection" width="50" align="center" />
        <el-table-column label="用户编号" align="center" prop="userId" />
        <el-table-column label="用户名称" align="center" prop="nickName" show-overflow-tooltip />
        <el-table-column label="用户名" align="center" prop="userName" show-overflow-tooltip />
        <el-table-column label="部门" align="center" prop="dept.deptName" show-overflow-tooltip />
        <el-table-column label="手机号码" align="center" prop="phonenumber" />
      </el-table>
      <pagination
        v-show="userTotal > 0"
        :total="userTotal"
        v-model:page="userQueryParams.pageNum"
        v-model:limit="userQueryParams.pageSize"
        @pagination="getUserList"
      />
      <template #footer>
        <el-button @click="userSelectVisible = false">取 消</el-button>
        <el-button type="primary" @click="confirmUserSelect">确 定</el-button>
      </template>
    </el-dialog>

    <!-- 部门选择弹窗 -->
    <el-dialog v-model="deptSelectVisible" title="选择部门" width="600px" append-to-body>
      <el-tree
        ref="deptTreeRef"
        :data="deptOptions"
        show-checkbox
        node-key="id"
        :check-strictly="false"
        empty-text="加载中，请稍候"
        :props="{ label: 'label', children: 'children' }"
      />
      <template #footer>
        <el-button @click="deptSelectVisible = false">取 消</el-button>
        <el-button type="primary" @click="confirmDeptSelect">确 定</el-button>
      </template>
    </el-dialog>

    <!-- 角色选择弹窗 -->
    <el-dialog v-model="roleSelectVisible" title="选择角色" width="800px" append-to-body>
      <el-form :model="roleQueryParams" :inline="true">
        <el-form-item label="角色名称">
          <el-input v-model="roleQueryParams.roleName" placeholder="请输入角色名称" clearable />
        </el-form-item>
        <el-form-item label="权限字符">
          <el-input v-model="roleQueryParams.roleKey" placeholder="请输入权限字符" clearable />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="Search" @click="getRoleList">搜索</el-button>
          <el-button icon="Refresh" @click="resetRoleQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-table
        ref="roleTableRef"
        :data="roleList"
        @selection-change="handleRoleSelectionChange"
        max-height="400"
      >
        <el-table-column type="selection" width="50" align="center" />
        <el-table-column label="角色编号" align="center" prop="roleId" />
        <el-table-column label="角色名称" align="center" prop="roleName" show-overflow-tooltip />
        <el-table-column label="权限字符" align="center" prop="roleKey" show-overflow-tooltip />
        <el-table-column label="显示顺序" align="center" prop="roleSort" />
      </el-table>
      <pagination
        v-show="roleTotal > 0"
        :total="roleTotal"
        v-model:page="roleQueryParams.pageNum"
        v-model:limit="roleQueryParams.pageSize"
        @pagination="getRoleList"
      />
      <template #footer>
        <el-button @click="roleSelectVisible = false">取 消</el-button>
        <el-button type="primary" @click="confirmRoleSelect">确 定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, watch, getCurrentInstance, nextTick } from 'vue'
import { StrUtil } from "@/utils/StrUtil"
import { listUser, deptTreeSelect } from "@/api/system/user"
import { listRole } from "@/api/system/role"

const props = defineProps({
  id: {
    type: String,
    required: true
  }
})

const { proxy } = getCurrentInstance()

// 数据定义
const initiatorList = ref([])
const initiatorForm = ref({})
const editingInitiatorIndex = ref(-1)
const initiatorFormVisible = ref(false)

// 用户选择相关
const userSelectVisible = ref(false)
const userList = ref([])
const userTotal = ref(0)
const selectedUsers = ref([])
const tempSelectedUsers = ref([])
const userQueryParams = ref({
  pageNum: 1,
  pageSize: 10,
  nickName: '',
  phonenumber: ''
})

// 部门选择相关
const deptSelectVisible = ref(false)
const deptOptions = ref([])
const selectedDepts = ref([])

// 角色选择相关
const roleSelectVisible = ref(false)
const roleList = ref([])
const roleTotal = ref(0)
const selectedRoles = ref([])
const tempSelectedRoles = ref([])
const roleQueryParams = ref({
  pageNum: 1,
  pageSize: 10,
  roleName: '',
  roleKey: ''
})

// 表单验证规则
const rules = {
  type: [{ required: true, message: '请选择发起人类型', trigger: 'change' }],
  selectedItems: [
    {
      validator: (rule, value, callback) => {
        const { type } = initiatorForm.value
        if (type === 1 && selectedUsers.value.length === 0) {
          callback(new Error('请选择用户'))
        } else if (type === 2 && selectedDepts.value.length === 0) {
          callback(new Error('请选择部门'))
        } else if (type === 3 && selectedRoles.value.length === 0) {
          callback(new Error('请选择角色'))
        } else {
          callback()
        }
      },
      trigger: 'change'
    }
  ]
}

let bpmnElement = null

/**
 * 重置发起人配置列表
 */
function resetInitiatorList() {
  bpmnElement = window.bpmnElement
  if (!bpmnElement) return

  // 从扩展属性中获取发起人配置
  const extensionElements = bpmnElement.businessObject.extensionElements
  if (extensionElements && extensionElements.values) {
    const properties = extensionElements.values.find(ex => ex.$type === 'flowable:Properties')
    if (properties && properties.values) {
      const initiatorConfigs = properties.values.filter(prop => prop.name && prop.name.startsWith('initiator_'))
      
      const configMap = new Map()
      initiatorConfigs.forEach(config => {
        const [prefix, type, id] = config.name.split('_')
        if (!configMap.has(type + '_' + id)) {
          configMap.set(type + '_' + id, {
            type: parseInt(type),
            id: id,
            name: config.value,
            typeName: getTypeName(parseInt(type))
          })
        }
      })
      
      initiatorList.value = Array.from(configMap.values())
    } else {
      initiatorList.value = []
    }
  } else {
    initiatorList.value = []
  }
}

/**
 * 获取类型名称
 */
function getTypeName(type) {
  switch (type) {
    case 1: return '用户'
    case 2: return '部门'
    case 3: return '角色'
    default: return '未知'
  }
}

/**
 * 打开发起人配置表单
 */
function openInitiatorForm(initiator, index) {
  editingInitiatorIndex.value = index
  if (index === -1) {
    initiatorForm.value = { type: null }
    selectedUsers.value = []
    selectedDepts.value = []
    selectedRoles.value = []
  } else {
    initiatorForm.value = { ...initiator }
    // 根据类型设置已选择的项
    if (initiator.type === 1) {
      selectedUsers.value = [{ userId: initiator.id, nickName: initiator.name }]
    } else if (initiator.type === 2) {
      selectedDepts.value = [{ deptId: initiator.id, deptName: initiator.name }]
    } else if (initiator.type === 3) {
      selectedRoles.value = [{ roleId: initiator.id, roleName: initiator.name }]
    }
  }
  initiatorFormVisible.value = true
  nextTick(() => {
    if (proxy.$refs['initiatorFormRef']) {
      proxy.$refs['initiatorFormRef'].clearValidate()
    }
  })
}

/**
 * 处理类型变化
 */
function handleTypeChange() {
  selectedUsers.value = []
  selectedDepts.value = []
  selectedRoles.value = []
}

/**
 * 删除发起人配置
 */
function removeInitiator(initiator, index) {
  proxy.$confirm("确认删除该发起人配置吗？", "提示", {
    confirmButtonText: "确 认",
    cancelButtonText: "取 消"
  }).then(() => {
    initiatorList.value.splice(index, 1)
    updateElementInitiatorConfig()
  }).catch(() => console.info("操作取消"))
}

/**
 * 保存发起人配置
 */
function saveInitiator() {
  proxy.$refs['initiatorFormRef'].validate((valid) => {
    if (!valid) return

    const { type } = initiatorForm.value
    let configs = []

    if (type === 1 && selectedUsers.value.length > 0) {
      configs = selectedUsers.value.map(user => ({
        type: 1,
        id: user.userId.toString(),
        name: user.nickName,
        typeName: '用户'
      }))
    } else if (type === 2 && selectedDepts.value.length > 0) {
      configs = selectedDepts.value.map(dept => ({
        type: 2,
        id: dept.deptId.toString(),
        name: dept.deptName,
        typeName: '部门'
      }))
    } else if (type === 3 && selectedRoles.value.length > 0) {
      configs = selectedRoles.value.map(role => ({
        type: 3,
        id: role.roleId.toString(),
        name: role.roleName,
        typeName: '角色'
      }))
    }

    if (configs.length === 0) {
      proxy.$message.warning('请选择发起人')
      return
    }

    if (editingInitiatorIndex.value !== -1) {
      // 编辑模式：替换原有配置
      initiatorList.value.splice(editingInitiatorIndex.value, 1, ...configs)
    } else {
      // 新增模式：添加配置
      initiatorList.value.push(...configs)
    }

    updateElementInitiatorConfig()
    initiatorFormVisible.value = false
  })
}

/**
 * 更新元素的发起人配置
 */
function updateElementInitiatorConfig() {
  if (!bpmnElement) return

  const modeling = window.bpmnModeler.get('modeling')
  const moddle = window.bpmnModeler.get('moddle')

  // 获取现有的扩展元素
  let extensionElements = bpmnElement.businessObject.extensionElements
  let otherExtensions = []
  let properties = null

  if (extensionElements && extensionElements.values) {
    // 保留非Properties的其他扩展
    otherExtensions = extensionElements.values.filter(ex => ex.$type !== 'flowable:Properties')
    // 获取现有的Properties
    properties = extensionElements.values.find(ex => ex.$type === 'flowable:Properties')
  }

  // 创建新的Properties对象
  const propertyValues = []

  // 保留非发起人配置的其他属性
  if (properties && properties.values) {
    properties.values.forEach(prop => {
      if (!prop.name || !prop.name.startsWith('initiator_')) {
        propertyValues.push(prop)
      }
    })
  }

  // 添加发起人配置属性
  initiatorList.value.forEach(config => {
    const propertyName = `initiator_${config.type}_${config.id}`
    const property = moddle.create('flowable:Property', {
      name: propertyName,
      value: config.name
    })
    propertyValues.push(property)
  })

  // 创建新的Properties对象
  const newProperties = moddle.create('flowable:Properties', {
    values: propertyValues
  })

  // 创建新的ExtensionElements
  const newExtensionElements = moddle.create('bpmn:ExtensionElements', {
    values: [...otherExtensions, newProperties]
  })

  // 更新元素
  modeling.updateProperties(bpmnElement, {
    extensionElements: newExtensionElements
  })
}

// ==================== 用户选择相关方法 ====================

/**
 * 打开用户选择弹窗
 */
function openUserSelect() {
  userSelectVisible.value = true
  tempSelectedUsers.value = [...selectedUsers.value]
  getUserList()
}

/**
 * 获取用户列表
 */
function getUserList() {
  listUser(userQueryParams.value).then(response => {
    userList.value = response.rows
    userTotal.value = response.total
    
    // 设置已选中的用户
    nextTick(() => {
      if (proxy.$refs.userTableRef) {
        userList.value.forEach(user => {
          if (tempSelectedUsers.value.some(selected => selected.userId === user.userId)) {
            proxy.$refs.userTableRef.toggleRowSelection(user, true)
          }
        })
      }
    })
  })
}

/**
 * 重置用户查询
 */
function resetUserQuery() {
  userQueryParams.value = {
    pageNum: 1,
    pageSize: 10,
    nickName: '',
    phonenumber: ''
  }
  getUserList()
}

/**
 * 处理用户选择变化
 */
function handleUserSelectionChange(selection) {
  tempSelectedUsers.value = selection.map(user => ({
    userId: user.userId,
    nickName: user.nickName
  }))
}

/**
 * 确认用户选择
 */
function confirmUserSelect() {
  selectedUsers.value = [...tempSelectedUsers.value]
  userSelectVisible.value = false
  // 触发表单验证
  nextTick(() => {
    if (proxy.$refs['initiatorFormRef']) {
      proxy.$refs['initiatorFormRef'].validateField('selectedItems')
    }
  })
}

/**
 * 移除已选择的用户
 */
function removeSelectedUser(user) {
  const index = selectedUsers.value.findIndex(item => item.userId === user.userId)
  if (index > -1) {
    selectedUsers.value.splice(index, 1)
    // 触发表单验证
    nextTick(() => {
      if (proxy.$refs['initiatorFormRef']) {
        proxy.$refs['initiatorFormRef'].validateField('selectedItems')
      }
    })
  }
}

// ==================== 部门选择相关方法 ====================

/**
 * 打开部门选择弹窗
 */
function openDeptSelect() {
  deptSelectVisible.value = true
  getDeptTree()
}

/**
 * 获取部门树
 */
function getDeptTree() {
  deptTreeSelect().then(response => {
    deptOptions.value = response.data
    
    // 设置已选中的部门
    nextTick(() => {
      if (proxy.$refs.deptTreeRef && selectedDepts.value.length > 0) {
        const checkedKeys = selectedDepts.value.map(dept => dept.deptId)
        proxy.$refs.deptTreeRef.setCheckedKeys(checkedKeys)
      }
    })
  })
}

/**
 * 确认部门选择
 */
function confirmDeptSelect() {
  const checkedNodes = proxy.$refs.deptTreeRef.getCheckedNodes()
  selectedDepts.value = checkedNodes.map(node => ({
    deptId: node.id,
    deptName: node.label
  }))
  deptSelectVisible.value = false
  // 触发表单验证
  nextTick(() => {
    if (proxy.$refs['initiatorFormRef']) {
      proxy.$refs['initiatorFormRef'].validateField('selectedItems')
    }
  })
}

/**
 * 移除已选择的部门
 */
function removeSelectedDept(dept) {
  const index = selectedDepts.value.findIndex(item => item.deptId === dept.deptId)
  if (index > -1) {
    selectedDepts.value.splice(index, 1)
    // 触发表单验证
    nextTick(() => {
      if (proxy.$refs['initiatorFormRef']) {
        proxy.$refs['initiatorFormRef'].validateField('selectedItems')
      }
    })
  }
}

// ==================== 角色选择相关方法 ====================

/**
 * 打开角色选择弹窗
 */
function openRoleSelect() {
  roleSelectVisible.value = true
  tempSelectedRoles.value = [...selectedRoles.value]
  getRoleList()
}

/**
 * 获取角色列表
 */
function getRoleList() {
  listRole(roleQueryParams.value).then(response => {
    roleList.value = response.rows
    roleTotal.value = response.total
    
    // 设置已选中的角色
    nextTick(() => {
      if (proxy.$refs.roleTableRef) {
        roleList.value.forEach(role => {
          if (tempSelectedRoles.value.some(selected => selected.roleId === role.roleId)) {
            proxy.$refs.roleTableRef.toggleRowSelection(role, true)
          }
        })
      }
    })
  })
}

/**
 * 重置角色查询
 */
function resetRoleQuery() {
  roleQueryParams.value = {
    pageNum: 1,
    pageSize: 10,
    roleName: '',
    roleKey: ''
  }
  getRoleList()
}

/**
 * 处理角色选择变化
 */
function handleRoleSelectionChange(selection) {
  tempSelectedRoles.value = selection.map(role => ({
    roleId: role.roleId,
    roleName: role.roleName
  }))
}

/**
 * 确认角色选择
 */
function confirmRoleSelect() {
  selectedRoles.value = [...tempSelectedRoles.value]
  roleSelectVisible.value = false
  // 触发表单验证
  nextTick(() => {
    if (proxy.$refs['initiatorFormRef']) {
      proxy.$refs['initiatorFormRef'].validateField('selectedItems')
    }
  })
}

/**
 * 移除已选择的角色
 */
function removeSelectedRole(role) {
  const index = selectedRoles.value.findIndex(item => item.roleId === role.roleId)
  if (index > -1) {
    selectedRoles.value.splice(index, 1)
    // 触发表单验证
    nextTick(() => {
      if (proxy.$refs['initiatorFormRef']) {
        proxy.$refs['initiatorFormRef'].validateField('selectedItems')
      }
    })
  }
}

// 监听 id 变化
watch(() => props.id, (val) => {
  if (StrUtil.isNotBlank(val)) {
    resetInitiatorList()
  }
}, { immediate: true })

// 初始化时触发一次
resetInitiatorList()
</script>

<style scoped>
.panel-tab__content {
  padding: 16px;
}

.element-drawer__button {
  display: flex;
  justify-content: center;
}

.el-tag {
  margin-right: 8px;
  margin-bottom: 4px;
}
</style>