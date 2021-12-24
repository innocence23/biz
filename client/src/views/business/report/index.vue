
<template>
    <BasicLayout>
        <template #wrapper>
            <el-card class="box-card">
                <el-form ref="queryForm" :model="queryParams" :inline="true" label-width="68px">
                    <el-form-item label="委托单位" prop="company"><el-input v-model="queryParams.company" placeholder="请输入委托单位" clearable
                                              size="small" @keyup.enter.native="handleQuery"/>
                            </el-form-item>
                        <el-form-item label="查新范围" prop="type"><el-select v-model="queryParams.type"
                                               placeholder="报告管理查新范围 国内外" clearable size="small">
                                        <el-option
                                                v-for="dict in typeOptions"
                                                :key="dict.value"
                                                :label="dict.label"
                                                :value="dict.value"
                                        />
                                    </el-select>
                            </el-form-item>
                        <el-form-item label="查新员" prop="operatorId"><el-select v-model="queryParams.operatorId"
                                           placeholder="请选择" clearable size="small" >
                                    <el-option
                                            v-for="dict in operatorIdOptions"
                                            :key="dict.key"
                                            :label="dict.value"
                                            :value="dict.key"
                                    />
                                </el-select>
                            </el-form-item>
                        <el-form-item label="是否交费" prop="isFinish"><el-select v-model="queryParams.isFinish"
                                               placeholder="报告管理是否交费" clearable size="small">
                                        <el-option
                                                v-for="dict in isFinishOptions"
                                                :key="dict.value"
                                                :label="dict.label"
                                                :value="dict.value"
                                        />
                                    </el-select>
                            </el-form-item>

                    <el-form-item>
                        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
                    </el-form-item>
                </el-form>

                <el-row :gutter="10" class="mb8">
                    <el-col :span="1.5">
                        <el-button
                                v-permisaction="['business:report:add']"
                                type="primary"
                                icon="el-icon-plus"
                                size="mini"
                                @click="handleAdd"
                        >新增
                        </el-button>
                    </el-col>
                    <el-col :span="1.5">
                        <el-button
                                v-permisaction="['business:report:edit']"
                                type="success"
                                icon="el-icon-edit"
                                size="mini"
                                :disabled="single"
                                @click="handleUpdate"
                        >修改
                        </el-button>
                    </el-col>
                    <el-col :span="1.5">
                        <el-button
                                v-permisaction="['business:report:remove']"
                                type="danger"
                                icon="el-icon-delete"
                                size="mini"
                                :disabled="multiple"
                                @click="handleDelete"
                        >删除
                        </el-button>
                    </el-col>
                </el-row>

                <el-table v-loading="loading" :data="reportList" @selection-change="handleSelectionChange">
                    <el-table-column type="selection" width="55" align="center"/><el-table-column label="ID" align="center" prop="id"
                                                 :show-overflow-tooltip="true"/>
                                                 <el-table-column label="创建时间" align="center" prop="createdAt" width="200"
                                                                :show-overflow-tooltip="true">
                                                    <template slot-scope="scope">
                                                    <span>{{ parseTime(scope.row.createdAt) }}</span>
                                                    </template>
                                                </el-table-column>
                                                 <el-table-column label="委托单位" align="center" prop="company" width="200"
                                                 :show-overflow-tooltip="true"/><el-table-column label="查新范围" align="center" prop="type"
                                                 :formatter="typeFormat" width="100">
                                    <template slot-scope="scope">
                                        {{ typeFormat(scope.row) }}
                                    </template>
                                </el-table-column><el-table-column label="费用" align="center" prop="price"
                                                 :show-overflow-tooltip="true"/><el-table-column label="查新员" align="center" prop="operatorId" :formatter="operatorIdFormat" width="100">
                                <template slot-scope="scope">
                                    {{ operatorIdFormat(scope.row) }}
                                </template>
                            </el-table-column>
                                <el-table-column label="是否交费" align="center" prop="isFinish"
                                                 :formatter="isFinishFormat" width="100">
                                    <template slot-scope="scope">
                                        {{ isFinishFormat(scope.row) }}
                                    </template>
                                </el-table-column>
                                <el-table-column label="回执" align="center" :show-overflow-tooltip="true">
                                    <template slot-scope="scope">
                                        <a :href="scope.row.huizhi" target="_blank">附件</a>
                                    </template>
                                </el-table-column>
                                <el-table-column label="委托书" align="center" :show-overflow-tooltip="true">
                                    <template slot-scope="scope">
                                        <a :href="scope.row.weituoshu" target="_blank">附件</a>
                                    </template>
                                </el-table-column>
                                <el-table-column label="报告" align="center" :show-overflow-tooltip="true">
                                    <template slot-scope="scope">
                                        <a :href="scope.row.baogao" target="_blank">附件</a>
                                    </template>
                                </el-table-column>
                                <el-table-column label="发票" align="center" :show-overflow-tooltip="true">
                                    <template slot-scope="scope">
                                        <a :href="scope.row.fapiao" target="_blank">附件</a>
                                    </template>
                                </el-table-column>
                                <el-table-column label="扫描" align="center" :show-overflow-tooltip="true">
                                    <template slot-scope="scope">
                                        <a :href="scope.row.saomiao" target="_blank">附件</a>
                                    </template>
                                </el-table-column>
                                <el-table-column label="其他" align="center" :show-overflow-tooltip="true">
                                    <template slot-scope="scope">
                                        <a :href="scope.row.other" target="_blank">附件</a>
                                    </template>
                                </el-table-column>
                                <el-table-column label="电话" align="center" prop="phone"
                                :show-overflow-tooltip="true"/>
                                <el-table-column label="备注" align="center" prop="remark"
                                :show-overflow-tooltip="true"/>
                    <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                        <template slot-scope="scope">
                        <el-button
                            slot="reference"
                            v-permisaction="['business:report:edit']"
                            @click="handleUpdate(scope.row)"
                            size="mini"
                            type="text"
                            icon="el-icon-edit"
                        >修改
                        </el-button>
                         <el-popconfirm
                            class="delete-popconfirm"
                            title="确认要删除吗?"
                            confirm-button-text="删除"
                            @onConfirm="handleDelete(scope.row)"
                         >
                            <el-button
                              slot="reference"
                              v-permisaction="['business:report:remove']"
                              size="mini"
                              type="text"
                              icon="el-icon-delete"
                            >删除
                            </el-button>
                         </el-popconfirm>
                        </template>
                    </el-table-column>
                </el-table>

                <pagination
                        v-show="total>0"
                        :total="total"
                        :page.sync="queryParams.pageIndex"
                        :limit.sync="queryParams.pageSize"
                        @pagination="getList"
                />

                <!-- 添加或修改对话框 -->
                <el-dialog :title="title" :visible.sync="open" width="500px">
                    <el-form ref="form" :model="form" :rules="rules" label-width="80px">

                                    <el-form-item label="委托单位" prop="company">
                                        <el-input v-model="form.company" placeholder="委托单位"
                                                      />
                                    </el-form-item>
                                    <el-form-item label="查新范围" prop="type">
                                        <el-select v-model="form.type"
                                                       placeholder="请选择" >
                                                <el-option
                                                        v-for="dict in typeOptions"
                                                        :key="dict.value"
                                                        :label="dict.label"
                                                        :value="dict.value"
                                                />
                                            </el-select>
                                    </el-form-item>
                                    <el-form-item label="费用" prop="price">
                                        <el-input v-model="form.price" placeholder="费用"
                                                      />
                                    </el-form-item>
                                    <el-form-item label="查新员" prop="operatorId">
                                        <el-select v-model="form.operatorId"
                                                       placeholder="请选择" >
                                                <el-option
                                                        v-for="dict in operatorIdOptions"
                                                        :key="dict.key"
                                                        :label="dict.value"
                                                        :value="dict.key"
                                                />
                                            </el-select>
                                    </el-form-item>
                                    <el-form-item label="是否交费" prop="isFinish">
                                        <el-select v-model="form.isFinish"
                                                       placeholder="请选择" >
                                                <el-option
                                                        v-for="dict in isFinishOptions"
                                                        :key="dict.value"
                                                        :label="dict.label"
                                                        :value="dict.value"
                                                />
                                            </el-select>
                                    </el-form-item>

                                    <!-- <el-upload ref="sys_app_logo" :headers="headers"
                                    :file-list="sys_app_logofileList" :action="sys_app_logoAction"
                                    style="float:left" :before-upload="sys_app_logoBeforeUpload"
                                     list-type="picture-card" :show-file-list="false" :on-success="uploadSuccess">
                                        <i class="el-icon-plus" />
                                      </el-upload> -->

                                    <el-form-item label="回执" prop="huizhi" required>
                                    <el-upload :headers="headers" ref="huizhi" :file-list="huizhifileList" :action="huizhiAction" :limit="1" :on-exceed="handleExceed"
                                        :on-preview="handlePreview" :before-upload="huizhiBeforeUpload" :on-success="uploadSuccess1" :on-remove="handleRemove1">
                                        <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
                                    </el-upload>
                                    </el-form-item>
                                    <el-form-item label="委托书" prop="weituoshu">
                                    <el-upload :headers="headers" ref="weituoshu" :file-list="weituoshufileList" :action="weituoshuAction" :limit="1" :on-exceed="handleExceed"
                                        :on-preview="handlePreview" :before-upload="weituoshuBeforeUpload" :on-success="uploadSuccess2" :on-remove="handleRemove2">
                                        <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
                                    </el-upload>
                                    </el-form-item>
                                    <el-form-item label="报告" prop="baogao">
                                    <el-upload :headers="headers" ref="baogao" :file-list="baogaofileList" :action="baogaoAction" :limit="1" :on-exceed="handleExceed"
                                        :on-preview="handlePreview" :before-upload="baogaoBeforeUpload" :on-success="uploadSuccess3" :on-remove="handleRemove3">
                                        <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
                                    </el-upload>
                                    </el-form-item>
                                    <el-form-item label="发票" prop="fapiao">
                                    <el-upload :headers="headers" ref="fapiao" :file-list="fapiaofileList" :action="fapiaoAction" :limit="1" :on-exceed="handleExceed" list-type="picture"
                                        :on-preview="handlePreview" :before-upload="fapiaoBeforeUpload" :on-success="uploadSuccess4" :on-remove="handleRemove4">
                                        <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
                                    </el-upload>
                                    </el-form-item>
                                    <el-form-item label="扫描" prop="saomiao" required>
                                    <el-upload :headers="headers" ref="saomiao" :file-list="saomiaofileList" :action="saomiaoAction" :limit="1" :on-exceed="handleExceed"
                                        :on-preview="handlePreview" :before-upload="saomiaoBeforeUpload" :on-success="uploadSuccess5" :on-remove="handleRemove5">
                                        <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
                                    </el-upload>
                                    </el-form-item>
                                    <el-form-item label="其他" prop="other">
                                    <el-upload :headers="headers" ref="other" :file-list="otherfileList" :action="otherAction" :limit="1" :on-exceed="handleExceed"
                                        :on-preview="handlePreview" :before-upload="otherBeforeUpload" :on-success="uploadSuccess6" :on-remove="handleRemove6">
                                        <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
                                    </el-upload>
                                    </el-form-item>
                                    <el-form-item label="电话" prop="phone">
                                        <el-input v-model="form.phone" placeholder="电话"/>
                                    </el-form-item>
                                    <el-form-item label="备注" prop="remark">
                                        <el-input
                                                    v-model="form.remark"
                                                    type="textarea"
                                                    :rows="2"
                                                    placeholder="请输入内容">
                                            </el-input>
                                    </el-form-item>
                    </el-form>
                    <div slot="footer" class="dialog-footer">
                        <el-button type="primary" @click="submitForm">确 定</el-button>
                        <el-button @click="cancel">取 消</el-button>
                    </div>
                </el-dialog>
            </el-card>
        </template>
    </BasicLayout>
</template>

<script>
    import {addReport, delReport, getReport, listReport, updateReport} from '@/api/business/report'

    import {listReportOperator } from '@/api/business/report-operator'
    import { getToken } from '@/utils/auth'

    export default {
        name: 'Report',
        components: {
        },
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
                // 总条数
                total: 0,
                // 弹出层标题
                title: '',
                // 是否显示弹出层
                open: false,
                isEdit: false,
                // 类型数据字典
                typeOptions: [],
                reportList: [],
                typeOptions: [],isFinishOptions: [],
                // 关系表类型
                operatorIdOptions :[],

                // 查询参数
                queryParams: {
                    pageIndex: 1,
                    pageSize: 10,
                    company:undefined,
                    type:undefined,
                    operatorId:undefined,
                    isFinish:undefined,
                    phone:undefined,

                },
                // 表单参数
                form: {
                },
                // 表单校验
                rules: {company:  [ {required: true, message: '委托单位不能为空', trigger: 'blur'} ],
                type:  [ {required: true, message: '查新范围不能为空', trigger: 'blur'} ],
                operatorId:  [ {required: true, message: '查新员不能为空', trigger: 'blur'} ],
                isFinish:  [ {required: true, message: '是否交费不能为空', trigger: 'blur'} ],
                },
                headers: { 'Authorization': 'Bearer ' + getToken() },
                huizhiAction: process.env.VUE_APP_BASE_API + '/api/v1/public/uploadFile',
                huizhifileList: [],
                weituoshuAction: process.env.VUE_APP_BASE_API + '/api/v1/public/uploadFile',
                weituoshufileList: [],
                baogaoAction: process.env.VUE_APP_BASE_API + '/api/v1/public/uploadFile',
                baogaofileList: [],
                fapiaoAction: process.env.VUE_APP_BASE_API + '/api/v1/public/uploadFile',
                fapiaofileList: [],
                saomiaoAction: process.env.VUE_APP_BASE_API + '/api/v1/public/uploadFile',
                saomiaofileList: [],
                otherAction: process.env.VUE_APP_BASE_API + '/api/v1/public/uploadFile',
                otherfileList: [],
        }
        },
        created() {
            this.getList()
            this.getDicts('report_type').then(response => {
                this.typeOptions = response.data
            })
            this.getReportOperatorItems()
            this.getDicts('report_is_finish').then(response => {
                this.isFinishOptions = response.data
            })
            },
        methods: {
            uploadSuccess1(response, file, fileList) {
                this.form.huizhi = process.env.VUE_APP_BASE_API + response.data.full_path
            },
            uploadSuccess2(response, file, fileList) {
                this.form.weituoshu = process.env.VUE_APP_BASE_API + response.data.full_path
            },
            uploadSuccess3(response, file, fileList) {
                this.form.baogao = process.env.VUE_APP_BASE_API + response.data.full_path
            },
            uploadSuccess4(response, file, fileList) {
                this.form.fapiao = process.env.VUE_APP_BASE_API + response.data.full_path
            },
            uploadSuccess5(response, file, fileList) {
                this.form.saomiao = process.env.VUE_APP_BASE_API + response.data.full_path
            },
            uploadSuccess6(response, file, fileList) {
                this.form.other = process.env.VUE_APP_BASE_API + response.data.full_path
            },
            handleRemove1(file, fileList) {
                this.form.huizhi = ""
            },
            handleRemove2(file, fileList) {
                this.form.weituoshu = ""
            },
            handleRemove3(file, fileList) {
                this.form.baogao = ""
            },
            handleRemove4(file, fileList) {
                this.form.fapiao = ""
            },
            handleRemove5(file, fileList) {
                this.form.saomiao = ""
            },
            handleRemove6(file, fileList) {
                this.form.other = ""
            },
            handlePreview(file, fileList) {
                console.log(file)
                window.open(file.url, "_blank");
            },
            /** 查询参数列表 */
            getList() {
                this.loading = true
                listReport(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
                        this.reportList = response.data.list
                        this.total = response.data.count
                        this.loading = false
                    }
                )
            },
            // 取消按钮
            cancel() {
                this.open = false
                this.reset()
            },
            // 表单重置
            reset() {
                this.form = {
                    id: undefined,
                    company: undefined,
                    type: undefined,
                    price: undefined,
                    operatorId: undefined,
                    isFinish: undefined,
                    huizhi: undefined,
                    weituoshu: undefined,
                    baogao: undefined,
                    fapiao: undefined,
                    saomiao: undefined,
                    other: undefined,
                    phone: undefined,
                    remark: undefined,
                }
                this.huizhifileList=[],
                this.weituoshufileList=[],
                this.baogaofileList=[],
                this.fapiaofileList=[],
                this.saomiaofileList=[],
                this.otherfileList=[],
                this.resetForm('form')
            },
            getImgList: function() {
              this.form[this.fileIndex] = this.$refs['fileChoose'].resultList[0].fullUrl
            },
            fileClose: function() {
              this.fileOpen = false
            },
            typeFormat(row) {
                return this.selectDictLabel(this.typeOptions, row.type)
            },
            operatorIdFormat(row) {
                return this.selectItemsLabel(this.operatorIdOptions, row.operatorId)
            },
            isFinishFormat(row) {
                return this.selectDictLabel(this.isFinishOptions, row.isFinish)
            },
            // 关系
            getReportOperatorItems() {
               this.getItems(listReportOperator, undefined).then(res => {
                   this.operatorIdOptions = this.setItems(res, 'id', 'name')
               })
            },
            // 文件
            /** 搜索按钮操作 */
            handleQuery() {
                this.queryParams.pageIndex = 1
                this.getList()
            },
            /** 重置按钮操作 */
            resetQuery() {
                this.dateRange = []
                this.resetForm('queryForm')
                this.handleQuery()
            },
            /** 新增按钮操作 */
            handleAdd() {
                this.reset()
                this.open = true
                this.title = '添加报告管理'
                this.isEdit = false
            },
            // 多选框选中数据
            handleSelectionChange(selection) {
                this.ids = selection.map(item => item.id)
                this.single = selection.length !== 1
                this.multiple = !selection.length
            },
            handleExceed(files, fileList) {
                this.$message.warning(`当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
            },
            /** 修改按钮操作 */
            handleUpdate(row) {
                this.reset()
                const id =
                row.id || this.ids
                getReport(id).then(response => {
                    this.form = response.data
                    this.open = true
                    this.title = '修改报告'
                    this.isEdit = true

                    let obj1 = new Object();
                    obj1.url = obj1.name = response.data.huizhi;
                    this.huizhifileList.push(obj1);

                    let obj2 = new Object();
                    obj2.url = obj2.name = response.data.weituoshu;
                    this.weituoshufileList.push(obj2);

                    let obj3 = new Object();
                    obj3.url = obj3.name = response.data.baogao;
                    this.baogaofileList.push(obj3);

                    let obj4 = new Object();
                    obj4.url = obj4.name = response.data.fapiao;
                    this.fapiaofileList.push(obj4);

                    let obj5 = new Object();
                    obj5.url = obj5.name = response.data.saomiao;
                    this.saomiaofileList.push(obj5);

                    let obj6 = new Object();
                    obj6.url = obj6.name = response.data.other;
                    this.otherfileList.push(obj6);
                })
            },
            /** 提交按钮 */
            submitForm: function () {
                this.$refs['form'].validate(valid => {
                    if (valid) {
                        if (this.form.id !== undefined) {
                            updateReport(this.form).then(response => {
                                if (response.code === 200) {
                                    this.msgSuccess(response.msg)
                                    this.open = false
                                    this.getList()
                                } else {
                                    this.msgError(response.msg)
                                }
                            })
                        } else {
                            addReport(this.form).then(response => {
                                if (response.code === 200) {
                                    this.msgSuccess(response.msg)
                                    this.open = false
                                    this.getList()
                                } else {
                                    this.msgError(response.msg)
                                }
                            })
                        }
                    }
                })
            },
            /** 删除按钮操作 */
            handleDelete(row) {
                var Ids = (row.id && [row.id]) || this.ids

                this.$confirm('是否确认删除编号为"' + Ids + '"的数据项?', '警告', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(function () {
                      return delReport( { 'ids': Ids })
                }).then((response) => {
                   if (response.code === 200) {
                     this.msgSuccess(response.msg)
                     this.open = false
                     this.getList()
                   } else {
                     this.msgError(response.msg)
                   }
                }).catch(function () {
                })
            },
            huizhiBeforeUpload(file) {
                let isRightSize = file.size / 1024 / 1024 < 2
                if (!isRightSize) {
                this.$message.error('文件大小超过 2MB')
                }
                return isRightSize
            },
            weituoshuBeforeUpload(file) {
                let isRightSize = file.size / 1024 / 1024 < 2
                if (!isRightSize) {
                this.$message.error('文件大小超过 2MB')
                }
                return isRightSize
            },
            baogaoBeforeUpload(file) {
                let isRightSize = file.size / 1024 / 1024 < 2
                if (!isRightSize) {
                this.$message.error('文件大小超过 2MB')
                }
                return isRightSize
            },
            fapiaoBeforeUpload(file) {
                let isRightSize = file.size / 1024 / 1024 < 2
                if (!isRightSize) {
                this.$message.error('文件大小超过 2MB')
                }
                return isRightSize
            },
            saomiaoBeforeUpload(file) {
                let isRightSize = file.size / 1024 / 1024 < 2
                if (!isRightSize) {
                this.$message.error('文件大小超过 2MB')
                }
                return isRightSize
            },
            otherBeforeUpload(file) {
                let isRightSize = file.size / 1024 / 1024 < 2
                if (!isRightSize) {
                this.$message.error('文件大小超过 2MB')
                }
                return isRightSize
            }
        }
    }
</script>

