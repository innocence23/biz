package dto

import (
	"maktub/app/business/models"
	"maktub/common/dto"
	common "maktub/common/models"
     
     
     "time"
)

type DemoGetPageReq struct {
	dto.Pagination     `search:"-"`
    Title string `form:"title" search:"type:contains;column:title;table:demo" comment:"标题"`
    Status string `form:"status" search:"type:exact;column:status;table:demo" comment:"状态"`
    CreatedAt time.Time `form:"createdAt" search:"type:exact;column:created_at;table:demo" comment:"创建时间"`
    DemoOrder
}

type DemoOrder struct {Id int `form:"idOrder" search:"type:order;column:id;table:demo"`
    Title string `form:"titleOrder" search:"type:order;column:title;table:demo"`
    Author string `form:"authorOrder" search:"type:order;column:author;table:demo"`
    Content string `form:"contentOrder" search:"type:order;column:content;table:demo"`
    Status string `form:"statusOrder" search:"type:order;column:status;table:demo"`
    CreateBy string `form:"createByOrder" search:"type:order;column:create_by;table:demo"`
    UpdateBy string `form:"updateByOrder" search:"type:order;column:update_by;table:demo"`
    PublishAt time.Time `form:"publishAtOrder" search:"type:order;column:publish_at;table:demo"`
    CreatedAt time.Time `form:"createdAtOrder" search:"type:order;column:created_at;table:demo"`
    UpdatedAt time.Time `form:"updatedAtOrder" search:"type:order;column:updated_at;table:demo"`
    DeletedAt time.Time `form:"deletedAtOrder" search:"type:order;column:deleted_at;table:demo"`
    
}

func (m *DemoGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type DemoInsertReq struct {
    Id int `json:"-" comment:"ID"` // ID
    Title string `json:"title" comment:"标题"`
    Author string `json:"author" comment:"作者"`
    Content string `json:"content" comment:"内容"`
    Status string `json:"status" comment:"状态"`
    PublishAt time.Time `json:"publishAt" comment:"发布时间"`
    common.ControlBy
}

func (s *DemoInsertReq) Generate(model *models.Demo) {
    if s.Id == 0 {
        model.Model = common.Model{ Id: s.Id }
    }
    model.Title = s.Title
    model.Author = s.Author
    model.Content = s.Content
    model.Status = s.Status
    model.PublishAt = s.PublishAt
}

func (s *DemoInsertReq) GetId() interface{} {
	return s.Id
}

type DemoUpdateReq struct {
    Id int `uri:"id" comment:"ID"` // ID
    Title string `json:"title" comment:"标题"`
    Author string `json:"author" comment:"作者"`
    Content string `json:"content" comment:"内容"`
    Status string `json:"status" comment:"状态"`
    PublishAt time.Time `json:"publishAt" comment:"发布时间"`
    common.ControlBy
}

func (s *DemoUpdateReq) Generate(model *models.Demo) {
    if s.Id == 0 {
        model.Model = common.Model{ Id: s.Id }
    }
    model.Title = s.Title
    model.Author = s.Author
    model.Content = s.Content
    model.Status = s.Status
    model.PublishAt = s.PublishAt
}

func (s *DemoUpdateReq) GetId() interface{} {
	return s.Id
}

// DemoGetReq 功能获取请求参数
type DemoGetReq struct {
     Id int `uri:"id"`
}
func (s *DemoGetReq) GetId() interface{} {
	return s.Id
}

// DemoDeleteReq 功能删除请求参数
type DemoDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *DemoDeleteReq) GetId() interface{} {
	return s.Ids
}