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

type ReportOperator struct {
	api.Api
}

// GetPage 获取报告名单列表
// @Summary 获取报告名单列表
// @Description 获取报告名单列表
// @Tags 报告名单
// @Param name query string false "人员名字"
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.ReportOperator}} "{"code": 200, "data": [...]}"
// @Router /api/v1/report-operator [get]
// @Security Bearer
func (e ReportOperator) GetPage(c *gin.Context) {
    req := dto.ReportOperatorGetPageReq{}
    s := service.ReportOperator{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
   		e.Logger.Error(err)
   		e.Error(500, err, err.Error())
   		return
   	}

	p := actions.GetPermissionFromContext(c)
	list := make([]models.ReportOperator, 0)
	var count int64
	if err := s.GetPage(&req, p, &list, &count); err != nil {
		e.Error(500, err, fmt.Sprintf("获取报告名单 失败，\r\n失败信息 %s", err.Error()))
        return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取报告名单
// @Summary 获取报告名单
// @Description 获取报告名单
// @Tags 报告名单
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.ReportOperator} "{"code": 200, "data": [...]}"
// @Router /api/v1/report-operator/{id} [get]
// @Security Bearer
func (e ReportOperator) Get(c *gin.Context) {
	req := dto.ReportOperatorGetReq{}
	s := service.ReportOperator{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	var object models.ReportOperator

	p := actions.GetPermissionFromContext(c)
	if err := s.Get(&req, p, &object); err != nil {
		e.Error(500, err, fmt.Sprintf("获取报告名单失败，\r\n失败信息 %s", err.Error()))
        return
	}

	e.OK( object, "查询成功")
}

// Insert 创建报告名单
// @Summary 创建报告名单
// @Description 创建报告名单
// @Tags 报告名单
// @Accept application/json
// @Product application/json
// @Param data body dto.ReportOperatorInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/report-operator [post]
// @Security Bearer
func (e ReportOperator) Insert(c *gin.Context) {
    req := dto.ReportOperatorInsertReq{}
    s := service.ReportOperator{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
        e.Logger.Error(err)
        e.Error(500, err, err.Error())
        return
    }
	// 设置创建人
	req.SetCreateBy(user.GetUserId(c))
	req.SetUpdateBy(user.GetUserId(c))

	if err := s.Insert(&req); err != nil {
		e.Error(500, err, fmt.Sprintf("创建报告名单  失败，\r\n失败信息 %s", err.Error()))
        return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改报告名单
// @Summary 修改报告名单
// @Description 修改报告名单
// @Tags 报告名单
// @Accept application/json
// @Product application/json
// @Param data body dto.ReportOperatorUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/report-operator/{id} [put]
// @Security Bearer
func (e ReportOperator) Update(c *gin.Context) {
    req := dto.ReportOperatorUpdateReq{}
    s := service.ReportOperator{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
        e.Logger.Error(err)
        e.Error(500, err, err.Error())
        return
    }
	req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)

	if err := s.Update(&req, p); err != nil {
		e.Error(500, err, fmt.Sprintf("修改报告名单 失败，\r\n失败信息 %s", err.Error()))
        return
	}
	e.OK( req.GetId(), "修改成功")
}

// Delete 删除报告名单
// @Summary 删除报告名单
// @Description 删除报告名单
// @Tags 报告名单
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/report-operator [delete]
// @Security Bearer
func (e ReportOperator) Delete(c *gin.Context) {
    s := service.ReportOperator{}
    req := dto.ReportOperatorDeleteReq{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
        e.Logger.Error(err)
        e.Error(500, err, err.Error())
        return
    }

	// req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)

	if err := s.Remove(&req, p); err != nil {
		e.Error(500, err, fmt.Sprintf("删除报告名单失败，\r\n失败信息 %s", err.Error()))
        return
	}
	e.OK( req.GetId(), "删除成功")
}