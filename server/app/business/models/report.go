package models

import (
	"maktub/common/models"
)

type Report struct {
	models.Model

	Company    string `json:"company" gorm:"type:varchar(128);comment:委托单位"`
	Type       string `json:"type" gorm:"type:tinyint(4);comment:查新范围"`
	Price      string `json:"price" gorm:"type:decimal(8,2);comment:费用 元 -999999.99--999999.99"`
	OperatorId string `json:"operatorId" gorm:"type:varchar(128);comment:查新员"`
	IsFinish   string `json:"isFinish" gorm:"type:tinyint(4);comment:是否交费"`
	Huizhi     string `json:"huizhi" gorm:"type:varchar(128);comment:回执 file"`
	Weituoshu  string `json:"weituoshu" gorm:"type:varchar(128);comment:委托书 file"`
	Baogao     string `json:"baogao" gorm:"type:varchar(128);comment:报告 file"`
	Fapiao     string `json:"fapiao" gorm:"type:varchar(128);comment:发票 file"`
	Saomiao    string `json:"saomiao" gorm:"type:varchar(128);comment:扫描 file"`
	Other      string `json:"other" gorm:"type:varchar(128);comment:其他 file"`
	Phone      string `json:"phone" gorm:"type:char(11);comment:电话"`
	Remark     string `json:"remark" gorm:"type:varchar(255);comment:备注"`
	models.ModelTime
	models.ControlBy
}

func (Report) TableName() string {
	return "report"
}

func (e *Report) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *Report) GetId() interface{} {
	return e.Id
}
