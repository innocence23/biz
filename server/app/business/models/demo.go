package models

import (
	"maktub/common/models"
    "time"
)

type Demo struct {
    models.Model
    
    Title string `json:"title" gorm:"type:varchar(128);comment:标题"` 
    Author string `json:"author" gorm:"type:varchar(128);comment:作者"` 
    Content string `json:"content" gorm:"type:varchar(255);comment:内容"` 
    Status string `json:"status" gorm:"type:tinyint(4);comment:状态"` 
    PublishAt time.Time `json:"publishAt" gorm:"type:datetime;comment:发布时间"` 
    models.ModelTime
    models.ControlBy
}

func (Demo) TableName() string {
    return "demo"
}

func (e *Demo) Generate() models.ActiveRecord {
	o := *e
	return &o
}

func (e *Demo) GetId() interface{} {
	return e.Id
}