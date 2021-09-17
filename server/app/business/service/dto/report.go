package dto

import (
	"maktub/app/business/models"
	"maktub/common/dto"
	common "maktub/common/models"
	"time"
)

type ReportGetPageReq struct {
	dto.Pagination `search:"-"`
	Type           string `form:"type" search:"type:exact;column:type;table:report" comment:"查新范围"`
	OperatorId     string `form:"operatorId" search:"type:exact;column:operator_id;table:report" comment:"查新员"`
	IsFinish       string `form:"isFinish" search:"type:exact;column:is_finish;table:report" comment:"是否交费"`
	Phone          string `form:"phone" search:"type:exact;column:phone;table:report" comment:"电话"`
	ReportOrder
}

type ReportOrder struct {
	Id         int       `form:"idOrder" search:"type:order;column:id;table:report"`
	Company    string    `form:"companyOrder" search:"type:order;column:company;table:report"`
	Type       string    `form:"typeOrder" search:"type:order;column:type;table:report"`
	Price      string    `form:"priceOrder" search:"type:order;column:price;table:report"`
	OperatorId string    `form:"operatorIdOrder" search:"type:order;column:operator_id;table:report"`
	IsFinish   string    `form:"isFinishOrder" search:"type:order;column:is_finish;table:report"`
	Huizhi     string    `form:"huizhiOrder" search:"type:order;column:huizhi;table:report"`
	Weituoshu  string    `form:"weituoshuOrder" search:"type:order;column:weituoshu;table:report"`
	Baogao     string    `form:"baogaoOrder" search:"type:order;column:baogao;table:report"`
	Fapiao     string    `form:"fapiaoOrder" search:"type:order;column:fapiao;table:report"`
	Saomiao    string    `form:"saomiaoOrder" search:"type:order;column:saomiao;table:report"`
	Other      string    `form:"otherOrder" search:"type:order;column:other;table:report"`
	Phone      string    `form:"phoneOrder" search:"type:order;column:phone;table:report"`
	Remark     string    `form:"remarkOrder" search:"type:order;column:remark;table:report"`
	CreateBy   string    `form:"createByOrder" search:"type:order;column:create_by;table:report"`
	UpdateBy   string    `form:"updateByOrder" search:"type:order;column:update_by;table:report"`
	CreatedAt  time.Time `form:"createdAtOrder" search:"type:order;column:created_at;table:report"`
	UpdatedAt  time.Time `form:"updatedAtOrder" search:"type:order;column:updated_at;table:report"`
	DeletedAt  time.Time `form:"deletedAtOrder" search:"type:order;column:deleted_at;table:report"`
}

func (m *ReportGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type ReportInsertReq struct {
	Id         int    `json:"-" comment:"ID"` // ID
	Company    string `json:"company" comment:"委托单位"`
	Type       string `json:"type" comment:"查新范围"`
	Price      string `json:"price" comment:"费用 元 -999999.99--999999.99"`
	OperatorId string `json:"operatorId" comment:"查新员"`
	IsFinish   string `json:"isFinish" comment:"是否交费"`
	Huizhi     string `json:"huizhi" comment:"回执 file"`
	Weituoshu  string `json:"weituoshu" comment:"委托书 file"`
	Baogao     string `json:"baogao" comment:"报告 file"`
	Fapiao     string `json:"fapiao" comment:"发票 file"`
	Saomiao    string `json:"saomiao" comment:"扫描 file"`
	Other      string `json:"other" comment:"其他 file"`
	Phone      string `json:"phone" comment:"电话"`
	Remark     string `json:"remark" comment:"备注"`
	common.ControlBy
}

func (s *ReportInsertReq) Generate(model *models.Report) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Company = s.Company
	model.Type = s.Type
	model.Price = s.Price
	model.OperatorId = s.OperatorId
	model.IsFinish = s.IsFinish
	model.Huizhi = s.Huizhi
	model.Weituoshu = s.Weituoshu
	model.Baogao = s.Baogao
	model.Fapiao = s.Fapiao
	model.Saomiao = s.Saomiao
	model.Other = s.Other
	model.Phone = s.Phone
	model.Remark = s.Remark
	if s.CreateBy != 0 {
		model.CreateBy = s.CreateBy
	}
	if s.UpdateBy != 0 {
		model.UpdateBy = s.UpdateBy
	}
}

func (s *ReportInsertReq) GetId() interface{} {
	return s.Id
}

type ReportUpdateReq struct {
	Id         int    `uri:"id" comment:"ID"` // ID
	Company    string `json:"company" comment:"委托单位"`
	Type       string `json:"type" comment:"查新范围"`
	Price      string `json:"price" comment:"费用 元 -999999.99--999999.99"`
	OperatorId string `json:"operatorId" comment:"查新员"`
	IsFinish   string `json:"isFinish" comment:"是否交费"`
	Huizhi     string `json:"huizhi" comment:"回执 file"`
	Weituoshu  string `json:"weituoshu" comment:"委托书 file"`
	Baogao     string `json:"baogao" comment:"报告 file"`
	Fapiao     string `json:"fapiao" comment:"发票 file"`
	Saomiao    string `json:"saomiao" comment:"扫描 file"`
	Other      string `json:"other" comment:"其他 file"`
	Phone      string `json:"phone" comment:"电话"`
	Remark     string `json:"remark" comment:"备注"`
	common.ControlBy
}

func (s *ReportUpdateReq) Generate(model *models.Report) {
	if s.Id == 0 {
		model.Model = common.Model{Id: s.Id}
	}
	model.Company = s.Company
	model.Type = s.Type
	model.Price = s.Price
	model.OperatorId = s.OperatorId
	model.IsFinish = s.IsFinish
	model.Huizhi = s.Huizhi
	model.Weituoshu = s.Weituoshu
	model.Baogao = s.Baogao
	model.Fapiao = s.Fapiao
	model.Saomiao = s.Saomiao
	model.Other = s.Other
	model.Phone = s.Phone
	model.Remark = s.Remark
}

func (s *ReportUpdateReq) GetId() interface{} {
	return s.Id
}

// ReportGetReq 功能获取请求参数
type ReportGetReq struct {
	Id int `uri:"id"`
}

func (s *ReportGetReq) GetId() interface{} {
	return s.Id
}

// ReportDeleteReq 功能删除请求参数
type ReportDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *ReportDeleteReq) GetId() interface{} {
	return s.Ids
}
