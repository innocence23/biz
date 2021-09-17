package apis

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/go-admin-team/go-admin-core/sdk/api"
	"github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth/user"
	_ "github.com/go-admin-team/go-admin-core/sdk/pkg/response"

	"maktub/app/business/models"
	"maktub/app/business/service"
	"maktub/app/business/service/dto"
	"maktub/common/actions"
)

type Demo struct {
	api.Api
}

// GetPage 获取例子Demo列表
// @Summary 获取例子Demo列表
// @Description 获取例子Demo列表
// @Tags 例子Demo
// @Param title query string false "标题"
// @Param status query string false "状态"
// @Param createdAt query time.Time false "创建时间"
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.Demo}} "{"code": 200, "data": [...]}"
// @Router /api/v1/demo [get]
// @Security Bearer
func (e Demo) GetPage(c *gin.Context) {
	req := dto.DemoGetPageReq{}
	s := service.Demo{}
	if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}

	p := actions.GetPermissionFromContext(c)
	list := make([]models.Demo, 0)
	var count int64
	if err := s.GetPage(&req, p, &list, &count); err != nil {
		e.Error(500, err, fmt.Sprintf("获取例子Demo 失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取例子Demo
// @Summary 获取例子Demo
// @Description 获取例子Demo
// @Tags 例子Demo
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.Demo} "{"code": 200, "data": [...]}"
// @Router /api/v1/demo/{id} [get]
// @Security Bearer
func (e Demo) Get(c *gin.Context) {
	req := dto.DemoGetReq{}
	s := service.Demo{}
	if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	var object models.Demo

	p := actions.GetPermissionFromContext(c)
	if err := s.Get(&req, p, &object); err != nil {
		e.Error(500, err, fmt.Sprintf("获取例子Demo失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(object, "查询成功")
}

// Insert 创建例子Demo
// @Summary 创建例子Demo
// @Description 创建例子Demo
// @Tags 例子Demo
// @Accept application/json
// @Product application/json
// @Param data body dto.DemoInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/demo [post]
// @Security Bearer
func (e Demo) Insert(c *gin.Context) {
	req := dto.DemoInsertReq{}
	s := service.Demo{}
	if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	// 设置创建人
	req.SetCreateBy(user.GetUserId(c))
	req.SetUpdateBy(user.GetUserId(c))

	if err := s.Insert(&req); err != nil {
		e.Error(500, err, fmt.Sprintf("创建例子Demo  失败，\r\n失败信息 %s", err.Error()))
		return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改例子Demo
// @Summary 修改例子Demo
// @Description 修改例子Demo
// @Tags 例子Demo
// @Accept application/json
// @Product application/json
// @Param data body dto.DemoUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/demo/{id} [put]
// @Security Bearer
func (e Demo) Update(c *gin.Context) {
	req := dto.DemoUpdateReq{}
	s := service.Demo{}
	if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)
	if err := s.Update(&req, p); err != nil {
		e.Error(500, err, fmt.Sprintf("修改例子Demo 失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "修改成功")
}

// Delete 删除例子Demo
// @Summary 删除例子Demo
// @Description 删除例子Demo
// @Tags 例子Demo
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/demo [delete]
// @Security Bearer
func (e Demo) Delete(c *gin.Context) {
	s := service.Demo{}
	req := dto.DemoDeleteReq{}
	if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}

	// req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)

	if err := s.Remove(&req, p); err != nil {
		e.Error(500, err, fmt.Sprintf("删除例子Demo失败，\r\n失败信息 %s", err.Error()))
		return
	}
	e.OK(req.GetId(), "删除成功")
}
