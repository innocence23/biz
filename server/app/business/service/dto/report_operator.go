package dto

import (
	"maktub/app/business/models"
	"maktub/common/dto"
	common "maktub/common/models"
	
	"time"
)

type ReportOperatorGetPageReq struct {
	dto.Pagination	`search:"-"`
	Id int `form:"id" search:"type:exact;column:id;table:report_operator" comment:"ID"`
	Name string `form:"name" search:"type:contains;column:name;table:report_operator" comment:"人员名字"`
	ReportOperatorOrder
}

type ReportOperatorOrder struct {Id int `form:"idOrder" search:"type:order;column:id;table:report_operator"`
	Name string `form:"nameOrder" search:"type:order;column:name;table:report_operator"`
	Phone string `form:"phoneOrder" search:"type:order;column:phone;table:report_operator"`
	Remark string `form:"remarkOrder" search:"type:order;column:remark;table:report_operator"`
	CreateBy string `form:"createByOrder" search:"type:order;column:create_by;table:report_operator"`
	UpdateBy string `form:"updateByOrder" search:"type:order;column:update_by;table:report_operator"`
	CreatedAt time.Time `form:"createdAtOrder" search:"type:order;column:created_at;table:report_operator"`
	UpdatedAt time.Time `form:"updatedAtOrder" search:"type:order;column:updated_at;table:report_operator"`
	DeletedAt time.Time `form:"deletedAtOrder" search:"type:order;column:deleted_at;table:report_operator"`
	
}

func (m *ReportOperatorGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type ReportOperatorInsertReq struct {
	Id int `json:"-" comment:"ID"` // ID
	Name string `json:"name" comment:"人员名字"`
	Phone string `json:"phone" comment:"电话"`
	Remark string `json:"remark" comment:"备注"`
	common.ControlBy
}

func (s *ReportOperatorInsertReq) Generate(model *models.ReportOperator) {
	if s.Id == 0 {
		model.Model = common.Model{ Id: s.Id }
	}
	model.Name = s.Name
	model.Phone = s.Phone
	model.Remark = s.Remark
	if s.CreateBy != 0 {
		model.CreateBy = s.CreateBy
	}
	if s.UpdateBy != 0 {
		model.UpdateBy = s.UpdateBy
	}
}

func (s *ReportOperatorInsertReq) GetId() interface{} {
	return s.Id
}

type ReportOperatorUpdateReq struct {
	Id int `uri:"id" comment:"ID"` // ID
	Name string `json:"name" comment:"人员名字"`
	Phone string `json:"phone" comment:"电话"`
	Remark string `json:"remark" comment:"备注"`
	common.ControlBy
}

func (s *ReportOperatorUpdateReq) Generate(model *models.ReportOperator) {
	if s.Id == 0 {
		model.Model = common.Model{ Id: s.Id }
	}
	model.Name = s.Name
	model.Phone = s.Phone
	model.Remark = s.Remark
}

func (s *ReportOperatorUpdateReq) GetId() interface{} {
	return s.Id
}

// ReportOperatorGetReq 功能获取请求参数
type ReportOperatorGetReq struct {
	Id int `uri:"id"`
}

func (s *ReportOperatorGetReq) GetId() interface{} {
	return s.Id
}

// ReportOperatorDeleteReq 功能删除请求参数
type ReportOperatorDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *ReportOperatorDeleteReq) GetId() interface{} {
	return s.Ids
}
