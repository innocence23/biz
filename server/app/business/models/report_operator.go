package models

import (
	"maktub/common/models"
)

type ReportOperator struct {
	models.Model

	Name   string `json:"name" gorm:"type:varchar(128);comment:人员名字"`
	Phone  string `json:"phone" gorm:"type:char(11);comment:电话"`
	Remark string `json:"remark" gorm:"type:varchar(255);comment:备注"`
	models.ModelTime
	models.ControlBy
}

func (ReportOperator) TableName() string {
	return "report_operator"
}

func (e *ReportOperator) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *ReportOperator) GetId() interface{} {
	return e.Id
}
