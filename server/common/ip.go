package common

import (
	"strings"

	"github.com/gin-gonic/gin"
)

func GetClientIP(c *gin.Context) string {
	ClientIP := c.ClientIP()
	RemoteIP, _ := c.RemoteIP()
	ip := c.Request.Header.Get("X-Forwarded-For")
	if strings.Contains(ip, "127.0.0.1") || ip == "" {
		ip = c.Request.Header.Get("X-real-ip")
	}
	if ip == "" {
		ip = "127.0.0.1"
	}
	if RemoteIP.String() != "127.0.0.1" {
		ip = RemoteIP.String()
	}
	if ClientIP != "127.0.0.1" {
		ip = ClientIP
	}
	return ip
}
