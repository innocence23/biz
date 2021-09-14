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

type Report struct {
	api.Api
}

// GetPage 获取报告列表
// @Summary 获取报告列表
// @Description 获取报告列表
// @Tags 报告
// @Param type query string false "查新范围"
// @Param operatorId query string false "查新员"
// @Param isFinish query string false "是否交费"
// @Param phone query string false "电话"
// @Param pageSize query int false "页条数"
// @Param pageIndex query int false "页码"
// @Success 200 {object} response.Response{data=response.Page{list=[]models.Report}} "{"code": 200, "data": [...]}"
// @Router /api/v1/report [get]
// @Security Bearer
func (e Report) GetPage(c *gin.Context) {
    req := dto.ReportGetPageReq{}
    s := service.Report{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
   		e.Logger.Error(err)
   		e.Error(500, err, err.Error())
   		return
   	}

	p := actions.GetPermissionFromContext(c)
	list := make([]models.Report, 0)
	var count int64
	if err := s.GetPage(&req, p, &list, &count); err != nil {
		e.Error(500, err, fmt.Sprintf("获取报告 失败，\r\n失败信息 %s", err.Error()))
        return
	}

	e.PageOK(list, int(count), req.GetPageIndex(), req.GetPageSize(), "查询成功")
}

// Get 获取报告
// @Summary 获取报告
// @Description 获取报告
// @Tags 报告
// @Param id path string false "id"
// @Success 200 {object} response.Response{data=models.Report} "{"code": 200, "data": [...]}"
// @Router /api/v1/report/{id} [get]
// @Security Bearer
func (e Report) Get(c *gin.Context) {
	req := dto.ReportGetReq{}
	s := service.Report{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	var object models.Report

	p := actions.GetPermissionFromContext(c)
	if err := s.Get(&req, p, &object); err != nil {
		e.Error(500, err, fmt.Sprintf("获取报告失败，\r\n失败信息 %s", err.Error()))
        return
	}

	e.OK( object, "查询成功")
}

// Insert 创建报告
// @Summary 创建报告
// @Description 创建报告
// @Tags 报告
// @Accept application/json
// @Product application/json
// @Param data body dto.ReportInsertReq true "data"
// @Success 200 {object} response.Response	"{"code": 200, "message": "添加成功"}"
// @Router /api/v1/report [post]
// @Security Bearer
func (e Report) Insert(c *gin.Context) {
    req := dto.ReportInsertReq{}
    s := service.Report{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
        e.Logger.Error(err)
        e.Error(500, err, err.Error())
        return
    }
	// 设置创建人
	req.SetCreateBy(user.GetUserId(c))

	if err := s.Insert(&req); err != nil {
		e.Error(500, err, fmt.Sprintf("创建报告  失败，\r\n失败信息 %s", err.Error()))
        return
	}

	e.OK(req.GetId(), "创建成功")
}

// Update 修改报告
// @Summary 修改报告
// @Description 修改报告
// @Tags 报告
// @Accept application/json
// @Product application/json
// @Param data body dto.ReportUpdateReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/report/{id} [put]
// @Security Bearer
func (e Report) Update(c *gin.Context) {
    req := dto.ReportUpdateReq{}
    s := service.Report{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
        e.Logger.Error(err)
        e.Error(500, err, err.Error())
        return
    }
	req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)

	if err := s.Update(&req, p); err != nil {
		e.Error(500, err, fmt.Sprintf("修改报告 失败，\r\n失败信息 %s", err.Error()))
        return
	}
	e.OK( req.GetId(), "修改成功")
}

// Delete 删除报告
// @Summary 删除报告
// @Description 删除报告
// @Tags 报告
// @Param ids body []int false "ids"
// @Success 200 {object} response.Response	"{"code": 200, "message": "删除成功"}"
// @Router /api/v1/report [delete]
// @Security Bearer
func (e Report) Delete(c *gin.Context) {
    s := service.Report{}
    req := dto.ReportDeleteReq{}
    if err := e.MakeContext(c).MakeOrm().Bind(&req).MakeService(&s.Service).Errors; err != nil {
        e.Logger.Error(err)
        e.Error(500, err, err.Error())
        return
    }

	// req.SetUpdateBy(user.GetUserId(c))
	p := actions.GetPermissionFromContext(c)

	if err := s.Remove(&req, p); err != nil {
		e.Error(500, err, fmt.Sprintf("删除报告失败，\r\n失败信息 %s", err.Error()))
        return
	}
	e.OK( req.GetId(), "删除成功")
}