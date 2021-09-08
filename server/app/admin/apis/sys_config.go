package apis

import (
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"github.com/go-admin-team/go-admin-core/sdk/api"

	"maktub/app/admin/models"
	"maktub/app/admin/service"
	"maktub/app/admin/service/dto"
)

type SysConfig struct {
	api.Api
}

// Get2SysApp 获取系统配置信息
// @Summary 获取系统前台配置信息，主要注意这里不在验证权限
// @Description 获取系统配置信息，主要注意这里不在验证权限
// @Tags 配置管理
// @Success 200 {object} response.Response{data=map[string]string} "{"code": 200, "data": [...]}"
// @Router /api/v1/app-config [get]
func (e SysConfig) Get2SysApp(c *gin.Context) {
	req := dto.SysConfigGetToSysAppReq{}
	s := service.SysConfig{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req, binding.Form).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		return
	}
	// 控制只读前台的数据
	req.IsFrontend = 1
	list := make([]models.SysConfig, 0)
	err = s.GetWithKeyList(&req, &list)
	if err != nil {
		e.Error(500, err, "查询失败")
		return
	}
	mp := make(map[string]string)
	for i := 0; i < len(list); i++ {
		key := list[i].ConfigKey
		if key != "" {
			mp[key] = list[i].ConfigValue
		}
	}
	e.OK(mp, "查询成功")
}

// Get2Set 获取配置
// @Summary 获取配置
// @Description 界面操作设置配置值的获取
// @Tags 配置管理
// @Accept application/json
// @Product application/json
// @Success 200 {object} response.Response{data=map[string]interface{}}	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/set-config [get]
// @Security Bearer
func (e SysConfig) Get2Set(c *gin.Context) {
	s := service.SysConfig{}
	req := make([]dto.GetSetSysConfigReq, 0)
	err := e.MakeContext(c).
		MakeOrm().
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}
	err = s.GetForSet(&req)
	if err != nil {
		e.Error(500, err, "查询失败")
		return
	}
	m := make(map[string]interface{}, 0)
	for _, v := range req {
		m[v.ConfigKey] = v.ConfigValue
	}
	e.OK(m, "查询成功")
}

// Update2Set 设置配置
// @Summary 设置配置
// @Description 界面操作设置配置值
// @Tags 配置管理
// @Accept application/json
// @Product application/json
// @Param data body []dto.GetSetSysConfigReq true "body"
// @Success 200 {object} response.Response	"{"code": 200, "message": "修改成功"}"
// @Router /api/v1/set-config [put]
// @Security Bearer
func (e SysConfig) Update2Set(c *gin.Context) {
	s := service.SysConfig{}
	req := make([]dto.GetSetSysConfigReq, 0)
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req, binding.JSON).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}

	err = s.UpdateForSet(&req)
	if err != nil {
		e.Error(500, err, err.Error())
		return
	}

	e.OK("", "更新成功")
}

// GetSysConfigByKEYForService 根据Key获取SysConfig的Service
// @Summary 根据Key获取SysConfig的Service
// @Description 根据Key获取SysConfig的Service
// @Tags 配置管理
// @Param configKey path string false "configKey"
// @Success 200 {object} response.Response{data=dto.SysConfigByKeyReq} "{"code": 200, "data": [...]}"
// @Router /api/v1/sys-config/{id} [get]
// @Security Bearer
func (e SysConfig) GetSysConfigByKEYForService(c *gin.Context) {
	var s = new(service.SysConfig)
	var req = new(dto.SysConfigByKeyReq)
	var resp = new(dto.GetSysConfigByKEYForServiceResp)
	err := e.MakeContext(c).
		MakeOrm().
		Bind(req, nil).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err)
		e.Error(500, err, err.Error())
		return
	}

	err = s.GetWithKey(req, resp)
	if err != nil {
		e.Error(500, err, err.Error())
		return
	}
	e.OK(resp, s.Msg)
}
