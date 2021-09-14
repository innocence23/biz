package router

import (
	"github.com/gin-gonic/gin"
	jwt "github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth"

	"maktub/app/business/apis"
	"maktub/common/middleware"
)

func init() {
	routerCheckRole = append(routerCheckRole, registerReportOperatorRouter)
}

// registerReportOperatorRouter
func registerReportOperatorRouter(v1 *gin.RouterGroup, authMiddleware *jwt.GinJWTMiddleware) {
	api := apis.ReportOperator{}
	r := v1.Group("/report-operator").Use(authMiddleware.MiddlewareFunc()).Use(middleware.AuthCheckRole())
	{
		r.GET("", api.GetPage)
		r.GET("/:id", api.Get)
		r.POST("", api.Insert)
		r.PUT("/:id", api.Update)
		r.DELETE("", api.Delete)
	}
}